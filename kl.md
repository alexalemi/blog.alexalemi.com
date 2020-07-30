
The [Kullback-Liebler
divergence](https://en.wikipedia.org/wiki/Kullback%E2%80%93Leibler_divergence),
or KL divergence, or relative entropy, or relative information, or information
gain, or information divergence (it goes by a lot of different names) is unique
amongst the ways to measure the difference between two probability
distributions.  It holds a special and privileged place, being used to define
all of the core concepts in information theory, such as mutual information.

Why is the relative information so special and where does it come from? 
How should you interpret it? What is a nat anyway?  What does that mean?  In this
note, I'll try to give a better understanding and set of intuitions about
what KL is, why its interesting, where it comes from and what its good for.

## Whither Continuous Entropy

The relative entropy really is the proper way to define entropy.  For all
of the things that Shannon got right, he flubbed a bit when he defined the
entropy of a distribution as:
$$ H(P) = -\sum_i p_i \log p_i $$

Why do I say he flubbed?  Because this notion of entropy doesn't generalize
to continuous distributions.  The continuous analog:
$$ H(P) = -\int dx\, p(x) \log p(x) $$
isn't *reparameterization independent*.  Consider for instance the distribution
of adult human heights:

<figure>
  <center>
  <img src="figures/adult_heights.png"
    alt="Distribution of adult heights.">
  <figcaption>Distribution of adult heights.</figcaption>
  </center>
</figure>

<aside>
Data taken from 
<a href="https://ourworldindata.org/human-height">ourworldindata.org</a>.

Note that you may have heard that 
[heights are normally distributed](https://www.johndcook.com/blog/2008/07/20/why-heights-are-normally-distributed/). Adult male (or female) heights are normally distributed,
but differ in their means and variances, making the 
[distribution of adult heights a mixture distribution](https://www.johndcook.com/blog/2008/11/25/distribution-of-adult-heights/).
</aside>

If you measure the continuous entropy of this distribution measured
in centimeters you get 5.4 bits.  If you instead measure the entropy
of the same distribution in feet you get 4 bits.  If you instead
were to measure heights in meters it would be -1.3 bits!


# OLD

Why is KL unique and special?  What is it that is so great.

Go over the proof in the Arthur paper, but extend it to make more sense
of what happens in the linear decomposition case.  Use the Ariel Caticha
paper to connect this with bayesian inference.

First let's see if we can recreate the argument in the Arthur Hobson article.

At our core we are interested in some axiomatically pure way to measure the 
amount of information in the update from some prior set of beliefs about some
outcomes to some new setting of beliefs.

$ I(p; q) $ is the information in moving from a distribution $ q $ to a new distribution $ p $.

We are going to require that the function be:
 
  1. Continuous in each of its probabilities.
  2. Permutation invariant.
  3. $ I = 0 $ if $ p = q $
  4. If we go from a uniform distribution over $ n_0 $ 
      things to one over $ n $ things, we want $ I $ to
      be an increasing function of $ n_0 $ and a decreasing
      function of $ n $ for any $ n_0 \geq n $.
  5. Linear Composition.

This is the same basically as in Shannon's Case.

## Shannon's Original Proof

Originally, Shannon provided a nice proof that entropy was uniquely the best measure, suppose you have a 
list of probabilities, if there is a measure $ H(p_1, p_2, \dots) $ it should have the following
properties:

  1. $ H $ should be continuous in all the $p_i$.
  2.  If all of the $p_i$ are equal, then $H$ should be a monotonic increasing function of $n$.
      There should be more uncertainty with more events.
  3. If a choice can be broken down into two successive choices, the original $H$ should be a weighted sum of the individual values of $H$.

The appendix then establishes that the only $H$ satisfying the above three assumptions is of the form:

$$ H = -K \sum_i p_i \log p_i $$

Repeating the argument from his appendix, we first let $H(1/n, 1/n, \dots, 1/n) = A(n)$, from the third condition we could break things up
and instead of considering a choice amongst $s^m$ equally likely outcomes we could first do a series of $m$ choices each from $s$ possible
outcomes and require that:

$$ A(s^m) = m A(s) $$
we could just as well do:
$$ A(t^n) = n A(t) $$
now we could take a large $n$ and find an $m$ such that:
$$ s^m \leq t^n \lt s^{(m+1)} $$
taking logarithms of both sides:
$$ m \log s \leq n \log t \lt (m+1) \log s $$
dividing by $n \log s$ we get:
$$ \frac m n \leq \frac{\log t}{\log s} \lt \frac{m}{n} + \frac 1 n $$
or in other words:
$$ \left| \frac m n - \frac{\log t }{\log s} \right| \lt \epsilon $$
From monotonicity we have that 

$$ A(s^m) \leq A(t^n) \leq A(s^{m+1}) $$
$$ m A(s) \leq n A(t) \leq (m+1) A(s) $$
dividing by $n A(s)$ we get
$$ \left| \frac m n - \frac{A(t)}{A(s)} \right| \lt \epsilon $$

combining these two we get
$$ \left| \frac{A(t)}{A(s)} - \frac{\log t}{\log s} \right| \leq 2 \epsilon $$
$$ A(t) = -K \log t $$



