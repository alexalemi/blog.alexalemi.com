
Let's see if we can very quickly prove the Jarzynski Equality and related non-equilibrium statistical mechanics results.  Much like the mathematical underpinnings of thermodynamics are pretty mathematically simple, e.g. the existence of a convex surface on which mixed partial derivatives commute, I believe most of the results in non-equilibrium statistical mechanics are similarly due to a rhetorical reinterpretation of a simple mathematical manipulation.

This post will assume some familiarity with physics.

## Basic Facts

The underlying math in our case are two facts, one that probability distributions are normalized:
$$ \int dx\, p(x) = 1. $$
<aside><sup id="#concave">1</sup>
The proof of which is straightforward given that $\log$ is concave and Jensen's inequality, see <a href="kl.html#non-negative-proof">my other blog post</a> for a proof.
</aside>
and second, that KL divergence is positive:<sup><a href="#concave">1</a></sup>
$$ \int dx\, p(x) \log \frac{p(x)}{q(x)} \geq 0. $$


## Density Ratios

To generate the classic non-equilibrium statistical mechanics results we start by considering a simple ratio of two joint probability distributions:
$$ \frac{q(x_0, x_1)}{p(x_0, x_1)} $$
Clearly we have a tremendous freedom here in our choices for the distributions $p$ and $q$. Mathematically it's uninteresting but we can start to build some rhetorical weight by factoring our two distributions in two distinct ways:
$$ \frac{q(x_1) q(x_0|x_1)}{p(x_0)p(x_1|x_0)} $$
Despite still not having done anything, we can start to build an interpretation here. Imagine $x_0$ and $x_1$ as being two configurations of a system, with $x_1$ happening *after* $x_0$.  Now, though we're allowed by the chain rule to factor distributions any way we wish, here we've chosen to factor $p$ to be suggestive of some kind of *forward process* wherein we first sample some $x_0$ from a distribution $p(x_0)$ and then evolve it according to some potentially stochastic process to generate our next state $x_1$ conditioned on the first: $p(x_1|x_0)$.  At the same time, we've factored $q$ the other way, evocative of a *reverse process* that starts at $x_1$ and then evolves backward to $x_0$.  

To make further progress, let's specialize a bit.  Let's imagine that $x_0$ and $x_1$ are configurations of a physical system evolving according to Hamiltonian dynamics, with a Hamiltonian governed by some kind of control parameter $\lambda$.  Let's further *imagine* that at the beginning of either our forward or reverse process our system is in thermodynamic equilibrium at the same temperature, and in particular in a [canonical ensemble](https://en.wikipedia.org/wiki/Canonical_ensemble):<sup><a href="#beta">2</a></sup>
<aside><sup id="#beta">2</sup>
$\beta$ is the <a href="https://en.wikipedia.org/wiki/Thermodynamic_beta">inverse temperature</a> $1/(k_B T)$
</aside>
$$ 
\begin{align}
    p(x_0) &= \frac{1}{Z(\beta,\lambda_0)} e^{-\beta H(x_0, \lambda_0)} \\
    q(x_1) &= \frac{1}{Z(\beta, \lambda_1)} e^{-\beta H(x_1, \lambda_1)}.
\end{align}
$$

Simply substituting these expressions into our density ratio we find:

$$ \frac{q(x_0,x_1)}{p(x_0,x_1)} = \frac{Z(\beta,\lambda_0)}{Z(\beta, \lambda_1)} e^{-\beta \left( H(x_1,\lambda_1) - H(x_0, \lambda_0) \right)} \frac{q(x_0|x_1)}{p(x_1|x_0)}. $$

We can clean this up a bit and give it a cleaner physical interpretation.  Let's identify the change in the Hamiltonian with the work:
$$ W \equiv H(x_1,\lambda_1) - H(x_0, \lambda_0). $$
And let's use the standard definition of the free energy:
$$ \beta F = -\log Z, $$
to rewrite the ratio of partition functions as a difference in free energies:
$$ e^{-\beta \Delta F} = e^{\log Z(\beta,\lambda_0) -\log Z(\beta,\lambda_1)} = \frac{Z(\beta,\lambda_0)}{Z(\beta,\lambda_1)}. $$
Combining these results gives:
$$ \frac{q(x_0,x_1)}{p(x_0,x_1)} = e^{\beta (W - \Delta F)} \frac{q(x_0|x_1)}{p(x_1|x_0)}. $$
I'm going to anticipate some of the things we're going to talk about below and define the log of the forward over the reverse transition probabilities as the *heat*:
$$ Q = \log \frac{p(x_1|x_0)}{q(x_0|x_1)}. $$
With this final identification we end up with the general statement:
$$ \frac{q_R}{p_F} = e^{\beta (W - Q - \Delta F)}. $$
The density ratio of the reverse process (shortened here as $q_R$) to the forward process $p_F$ is given by the exponential of $\beta$

## Hamiltonian Dynamics


First, if we assume that our dynamics is Hamiltonian, and thus deterministic and reversible, we know that the probability that we start at $x_0$ and end up at $x_1$ if we evolve forward in time is the same as the probability that we start at $x_1$ and end up at $x_0$ if we reverse our time evolution, ($q(x_0|x_1) = p(x_1|x_0)$)<sup><a href="#heat-caveat">3</a></sup>
<aside><sup id="#heat-caveat">3</sup>
    Alternatively, if you trust our identification of heat, you could imagine an isolated system where the heat flow is zero.
</aside>
so the ratio of conditional probabilities actually cancels and we generate <a href="https://en.wikipedia.org/wiki/Crooks_fluctuation_theorem">Crook's Fluctuation Theorem</a>:
$$ \frac{q_R}{p_F} =  e^{\beta (W - \Delta F)}. $$
The ratio of the reverse process probability to the forward probability for a given initial and final point is given by the exponential $e^{\beta (W - \Delta F)}$.  If we now take the integral of this with respect to the forward process, we generate the <a href="https://en.wikipedia.org/wiki/Jarzynski_equality">Jarzynski equality</a>:<sup><a href="#langle">4</a></sup>
<aside><sup id="#langle">4</sup>
We've also introduced the $\langle \cdot \rangle$ notation for expectations to clean up the notation a bit.
</aside>
$$ \int dx_0\, dx_1\, p(x_0,x_1) \frac{q(x_0,x_1)}{p(x_0,x_1)} = 1 = \left\langle e^{\beta (W - \Delta F)} \right\rangle_p, $$
<aside><sup id="#free-energy">5</sup>
The free energy only depends on the partition function $Z$ which is a constant so can be taken outside the expectation.
</aside>
which simplifies to<sup><a href="#free-energy">5</a></sup>:
$$ \left\langle e^{-\beta W}\right\rangle_p = e^{-\beta \Delta F}. $$
So, recapping, what have we just done?  
Since we can take density ratios of arbitrary probability distributions, we could choose those two densities to mean something we care about.  Consider $p$ the forward, Hamiltonian evolution of a system from $x_0$ to $x_1$ and $q$ the reverse process.  If we imagine that both the forward and reverse processes start in a state of canonical equilibrium, we can generate both Crook's Fluctuation Theorem as well as the Jarzynski equality. 

The power of this result is that it allows us to relate an expectation computed with respect to non-equilibrium processes (the exponential of the beta weighted stochastic work needed for a bunch of non-equilibrium realizations of our trajectory) to a pure equilibrium quantity (a difference of equilibrium free energies).
In the context of the physical sciences, this lets us perform non-equilibrium simulations or experiments, and provided we measure the work performed over many such runs, even with the system driven far from equilibrium, we can estimate equilibrium free energy differences.

## Stochastic Dynamics

But, let's say you don't like the assumption that the dynamics are Hamiltonian, we can imagine something else, imagine our dynamics is stochastic but imagine discretizing the dynamics.  We still need to make some kind of assumption, in this case, we'll imagine that our process consists of $N$ steps, each of which is governed by a Markov transition kernel.  Finally, we'll assume that each transition kernel has a stationary distribution and satisfies detailed balance.

What this means is that we'll imagine that our forward process now takes the form:
$$ 
\begin{align}
     p_F &= p(x_0) p(x_1|x_0) p(x_2|x_1) \cdots p(x_N|x_{N-1}) \\
     &= p(x_0) T_1(x_1|x_0) T_2(x_2|x_0) \cdots T_N(x_N|x_{N-1}) 
\end{align}
$$
Here we've denoted the intermediate conditional distributions as being governed by our transistion kernels, labeled with the corresponding stationary distribution.  Saying that our kernels have a stationary distribution that they respect according to detailed balance means that:
$$ T_k(x'|x) \sigma_k(x) = T_{k}(x|x') \sigma_k(x'), $$
for the stationary distribution $\sigma_k$.  

We've defined our forward process, now we need to define our reverse process.  We'll imagine that the reverse process is governed by the same transition kernels but running in reverse:<sup><a href="#reverse">6</a></sup>
<aside><sup id="#reverse">6</sup>
Notice that by *reverse* here we mean that the kernels are actually designed to be the ones targeting the stationary distribution for the step we're on, rather than the one we are heading to.
</aside>
$$
\begin{align}
    q_R &= q(x_N) q(x_{N-1}|x_N) \cdots q(x_1|x_2) q(x_0|x_1) \\
    &= q(x_N) T_{N}(x_{N-1}|x_N) \cdots T_2(x_1|x_2) T_1(x_0|x_1).
\end{align}
$$

Now if we look at the ratio of our reverse to our forward process, things simplify a bit:
$$
\begin{align}
    \frac{q_R}{p_F} &= \frac{q(x_N)T_N(x_{N-1}|x_N)\cdots T_2(x_1|x_2)T_1(x_0|x_1)}{p(x_0)T_1(x_1|x_0)T_2(x_2|x_1)\cdots T_N(x_N|x_{N-1})} \\
    &= \frac{q(x_N)}{p(x_0)} \frac{T_1(x_1|x_0)}{T_1(x_0|x_1)} \frac{T_2(x_1|x_2)}{T_2(x_2|x_1)} \cdots \frac{T_N(x_{N-1}|x_N)}{T_N(x_N|x_{N-1})} \\
    &= \frac{q(x_N)}{p(x_0)} \frac{\sigma_1(x_1)}{\sigma_1(x_0)} \frac{\sigma_2(x_2)}{\sigma_2(x_1)} \cdots \frac{\sigma_N(x_{N-1})}{\sigma_N(x_N)} .
\end{align}
$$

Finally, as we did above, let's imagine that all of these marginal distributions take the form of a canonical distribution.<sup><a href="#stationary">7</a></sup>
<aside><sup id="#stationary">7</sup>
Notice that this isn't the same as assuming that our process is always in equilibrium, we are still describing a potentially non-equilibrium process, the only assumption here is that the dynamics is Markov and *stationary* with some stationary distribution that we can characterize.
</aside>
$$
\begin{align}
    q(x_N) &\equiv \frac{1}{Z_N} e^{-\beta H_N} \\
    p(x_0) &\equiv \frac{1}{Z_0} e^{-\beta H_0} \\
    \sigma_k(x_j) &\equiv \frac{1}{Z_k} e^{-\beta E_k(x_j)}.
\end{align}
$$
Notice that the nice simplification that happens here is that since we imagined our reverse process as being the reverse of the forward process, in all but one of these fractions, the partition function of the intermediate stationary processes will cancel out.  Putting this all together we obtain the general result:
$$ \frac{q_R}{p_F} = e^{\beta(W - Q - \Delta F)}, $$
if we identify $W$ with the total energy change of the system ($H_0-H_N$), $\Delta F$ with the change in the partition functions (as above, $-\beta \Delta F = \log Z_0/Z_N$) and now identify the <i>heat</i> as additional energy changes in each of the intermediate processes:<sup><a href="#serious">8</a></sup>
<aside><sup id="#serious">8</sup>
I don't think we should take this identification with the heat too seriously, some of the literature just calls this the total work for the trajectory.
</aside>
$$ Q \equiv \sum_{k=1}^{N} Q_k \qquad Q_k = \Delta E_k = E_k(x_k) - E_k(x_{k-1}) . $$
And I believe we've done it.  Taking the expectation of this quantity with respect to the forward process will give us the Jarzynksi equality again<sup><a href="#ais">9</a></sup>:
$$ \left\langle e^{\beta(W - Q)} \right\rangle = e^{\beta \Delta F}. $$
<aside><sup id="#ais">9</sup>
    We've also just reinvented <a href="https://arxiv.org/abs/physics/9803008">Annealed Importance Sampling (AIS)</a>. For more details of how these non-equilibrium results relate to AIS see <a href="https://papers.nips.cc/paper/2017/hash/4da04049a062f5adfe81b67dd755cecc-Abstract.html"><i>Model Evidence from nonequilibrium simulations</i></a> by Habeck, NeurIPS2017.
</aside>

Taking the logarithm of the ratio and then the expectation is equivalent to the KL divergence between the forward and reverse processes, which we know must be positive:
$$ D(p_F; q_R) = \left\langle \log \frac{p_F}{q_F} \right\rangle_F = -\beta \left\langle W - Q \right\rangle + \beta \Delta F \geq 0 $$
which naturally generates the inequality (a version of the second law):
$$ \Delta F \geq \left\langle W - Q \right\rangle. $$
As a reminder, in this case, we were generalized to a situation where our initial distributions were canonical, but our dynamics were generalized to any sequence of Markovian transition kernels, provided only that those kernels have a stationary distribution.

## Variational Autoencoder

To show some of the generality of what we're doing here, let's do it again but for a completely different kind of system, this time a [Variational Autoencoder](https://en.wikipedia.org/wiki/Variational_autoencoder).  In a variational autoencoder there are two joint distributions at play, one a *representational model* $p(x,z) = p(x) p(z|x)$ which starts with a draw from some *true* data distribution $p(x)$ and then uses an *encoder* to map that datum to some kind of representative code, or summary, or representation $z$: $p(z|x)$.  The other joint distribution consists of a *generative model* $q(x,z) = q(z)q(x|z)$ that imagines a joint distribution over the same space but works in _reverse_.  First, we generate a *latent variable* $z$ from some *prior distribution* $q(z)$ and then we use a *decoder* to stochastically turn that latent variable into a generated datum $x$: $q(x|z)$.

We can easily imagine the ratio of these two densities:
$$ \frac{q(x,z)}{p(x,z)} = \frac{q(z)q(x|z)}{p(x)p(z|x)}. $$

As we saw above, the way to generate an inequality here is to turn this into a KL divergence:
$$
\begin{align}
    D( p(x,z) ; q(x,z) ) &= \left\langle \log \frac{p(x) p(z|x)}{q(z) q(x|z)} \right\rangle_p  \\
    &= -\left\langle -\log p(x) \right\rangle_p + \left\langle -\log q(x|z) \right\rangle_p  + \left\langle \log \frac{p(z|x)}{q(z)} \right\rangle_p \\
    &\equiv -\mathbb{H} + D + R  \geq 0
\end{align}
$$
Here, just as above we've only rearranged terms, but this time organized them into three contributions, the *entropy* of the true data generating process:
$$ H \equiv \left\langle -\log p(x) \right\rangle_p, $$
the *distortion* a measure of the likelihood we encode then decode and image to the one we started with:
$$ D \equiv \left\langle - \log q(x|z) \right\rangle_p = -\int dx\, p(x) \int dz\, p(z|x) \log q(x|z), $$
and the *rate*, a measure of the excess cost required to communicate this message $z$ over a wire designed to be optimal for the prior $q(z)$:
$$ R \equiv \left\langle \log \frac{p(z|x)}{q(z)} \right\rangle_p = \left\langle D(p(z|x); q(z)) \right\rangle_{p(x)}. $$
We've just rederived the *ELBO*<sup><a href="#elbo">10</a></sup>
<aside><sup id="#elbo">10</sup>
For Evidence Lower BOund.
</aside>
rendered in the form presented in <i>Fixing a Broken ELBO</i><sup><a href="#brokenelbo">11</a></sup>
<aside><sup id="#brokenelbo">11</sup>
<i>Fixing a Broken ELBO</i> by AA Alemi, B Poole, I Fischer, JV Dillon, RA Saurous and K Murphy, ICML 2018. <a href="https://arxiv.org/abs/1711.00464">1711.00464</a>
</aside>
$$ \textsf{ELBO} \equiv D + R \geq H. $$


## Conclusion

We've managed to derive several non-equilibrium statistical mechanical equalities and inequalities seemingly from nothing.  All of these results were powered by the facts we opened with, that probability distributions integrate to one and that KL divergences are positive.  The only challenge here was one of semantics.  To get power out of such trivial mathematical manipulations required us to make judicious choices in how we interpreted them.

<small>Special thanks to Sam Schoenholz and Srinivas Vasudevan for helpful feedback on this post.</small>
