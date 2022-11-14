
Performing Bayesian inference requires a full joint distribution over both our
data and parameters $p(D,\theta)$.  In the usual way of doing things, we
specify that joint distribution by providing two pieces: a likelihood
$p(D|\theta)$ that specifies how we believe the data would be
generated if we happened to know the exact parameter values and some prior
$p(\theta)$ over parameters that represents our state of belief about what the
parameters are before we look at any data.

Most people don't have any deep philosophical issues with specifying a
likelihood $p(D|\theta)$. We're aware that our likelihoods might not be
perfect, that they are some approximation of what is happening in the real
world. Still, we have opinions about them, we feel as though we can reason about
whether a given likelihood is good or bad for some situation.

I believe I can model a series of $D$ heads in $N$ coin flips with a [Binomial
likelihood](https://en.wikipedia.org/wiki/Binomial_distribution) for instance,
and I don't really have any qualms about that.
I might decide to model the heights of my pea plants with a [Normal
Distribution](https://en.wikipedia.org/wiki/Normal_distribution) or perform a
[linear fit](https://en.wikipedia.org/wiki/Linear_regression) to some data, or
do image classification with some [convolutional neural
network](https://en.wikipedia.org/wiki/Convolutional_neural_network) or
[transformer](https://en.wikipedia.org/wiki/Transformer_(machine_learning_model)). In any case, I often have a good idea of what I should use as a likelihood $p(D|\theta)$.

<aside><sup id="yesterday">1</sup>
This quote is often attributed to Lindley (1970), but I see no such occurance in that work. Looking around the original quote appears to be "Today's posterior is tomorrow's prior." From <a href="https://people.umass.edu/stanek/pubhlth892d/Lindley-The-Statist-2000.pdf"><i>The Philosophy of Statistics</i></a> by Dennis V Lindley, The Statistician 2000.  There do not appear to be any earlier occurrences of "today's prior" used in the sense of Bayesian inference that appear on Google Scholar.
</aside>

Choosing the prior $p(\theta)$ is what all the fuss is about.  This is the part that raises various philosophical issues.  This is the part that, if we are being honest, is much harder.  What do I believe the bias of a coin is before I ever flip the coin?  I'm not really sure to be honest.  In many contexts I might have previously done some experiments, in which case I could use yesterday's posterior as today's prior.<sup><a href="#yesterday">1</a></sup>

<aside><sup id="indifference">2</sup>
Originally coined the <i>principle of insufficient reason</i> by Johannes on Kries, John Maynard Keyes renamed it the <i>principle of indifference</i>. <a href="https://en.wikipedia.org/wiki/Principle_of_indifference#History">[wiki]</a>
</aside>

<aside><sup id="jaynes-priors">3</sup>
    <a href="https://bayes.wustl.edu/etj/articles/prior.pdf"><i>Prior Probabilities</i></a> by Edwin T. Jaynes. 1968
</aside>

<aside><sup id="reference">4</sup>
See for instance <a href="https://arxiv.org/pdf/0904.0156.pdf"><i>A Formal Definition of Reference Priors</i></a> by Berger, Bernardo and Sun.  For a more modern take I really like see <a href="https://arxiv.org/abs/1705.01166"><i>Maximizing the information learned from finite data selects a simple model</i></a> by Mattingly et al. and <a href="https://arxiv.org/abs/2205.03343"><i>Far from Asymptopia</i></a> by Abbott and Machta.
</aside>

However lacking previous experiments, I often feel at a loss. There are many frameworks for designing priors that people have proposed.  Laplace originally motivated a flat prior for the Bernoulli likelihood by appealing to the *principle of indifference*.<sup><a href="#indifference">2</a></sup> 
<a href="https://en.wikipedia.org/wiki/Jeffreys_prior">Jeffreys</a> taught us how to build priors that were reparameterization-independent.
Jaynes would argue for choosing priors by appealing to symmetries.<sup><a href="#jaynes-priors">3</a></sup> Bernardo suggested choosing priors to maximize the information you extract from data, so called <i>reference priors</i>.<sup><a href="#reference">4</a></sup> Gelman and friends tout <i>weakly informative priors</i>. 
There are even whole [lists of common recommendations](https://github.com/stan-dev/stan/wiki/Prior-Choice-Recommendations).

What if we didn't have to choose a prior directly?

## The Method of Imaginary Results

<aside><sup id="gelman-speed">5</sup>
See the first page of the nice little paper <a href="http://www.stat.columbia.edu/~gelman/research/published/GelmanSpeed.pdf"><i>Characterizing a Joint Probability Distribution By Conditionals</i></a> by Gelman and Speed, 1991.
</aside>

Enter *the method of imaginary results*.  It turns out<sup><a href="#gelman-speed">5</a></sup> that we can uniquely characterize a joint distribution in a different way.  Specifying a likelihood $L(D|\theta)$ and a prior $\pi(\theta)$ uniquely characterizes the joint $p(D,\theta) = L(D|\theta)\pi(\theta)$.  You know what else uniquely characterizes the joint? Specifying a likelihood $L(D|\theta)$ and some *hypothetical* posterior $q(\theta|D_0)$. The corresponding unique joint $p(\theta,D)$ is given by:

$$ p(\theta, D) \propto L(D|\theta) \frac{q(\theta|D_0)}{L(D_0|\theta)} = \frac{ L(D|\theta) \frac{q(\theta|D_0)}{L(D_0|\theta)} }{\int d\theta\, L(D|\theta) \frac{q(\theta|D_0)}{L(D_0|\theta)}}.  $$

Which naturally satisfies the two inputs we provided:
$$ p(D|\theta) = L(D|\theta) \qquad p(\theta|D_0) = q(\theta|D_0). $$

This flips the problem on its head.  We no longer have to specify a *prior*.  Instead we can specify a *hypothetical posterior*.  We can say what we would believe, if, hypothetically we had observed some dataset $D_0$.

I think that this is an easier task to do.  It is easier for me to reason about what beliefs I should hypothetically hold in like of some data than it is for me to reason about what I believe independent of any data.

## Coin Example

Let's work a simple example of a coin flip.  I believe I can model a coin as being a simple Bernoulli process. There is some probability $\theta$ that the coin will land heads and each flip is independent and identically distributed.  Therefore I can model observing $H$ heads out of sequence of $N$ flips with a [Binomial Likelihood](https://en.wikipedia.org/wiki/Binomial_distribution):

$$ L({H,N}|\theta) = { N \choose H} \theta^H (1- \theta)^{N-H} $$

Now, we imagine I actually observe some sequence of coin flips, let's say 6 out of 10 flips were heads. Now what should I believe about the bias of my coin?  To answer this I need to specify a prior belief I have about the bias of the coin.  In most textbook examples, that prior is taken to be uniform $p(\theta) = 1$, saying that our prior belief is that it is equally likely that the coin should have a bias in an interval $\theta + \delta \theta$ for any $\theta$, i.e. this prior says its just as likely the bias of the coin is between 0.1 and 0.2 as it is that it is between 0.5 and 0.6. 

## Mixture

## Jaynes and ESP


## Linear Fit


## Neural Networks


## Rational Ignorance