
How do we choose between hypotheses?

The way I see it there are broadly three different families of model selection criterion, there are those that focus on prediction, those that focus on correctness and those that strike a balance between the two.

## Prediction

A lot of the time the only thing we really care about is how well our model can make future predictions.  If the true data distribution is some $\nu(x)$ and we have a model $p(x)$ a [very natural way](kl.html) to score the effectiveness of the model is to measure the KL divergence between the two.

$$ \int dx\, \nu(x) \log \frac{\nu(x)}{p(x)} $$

AIC, WAIC, Cross validation, all that.

## Correctness

BIC, marginal likelihood, free energy, all that.


## In between

MDL, ELBO, things like that.


## Final word?



