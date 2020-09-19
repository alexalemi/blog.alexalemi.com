# Hello?? Can anyone hear us?

A common notion spread by sci-fi books and movies is that we've been continuously beaming out our radio signals into space for decades, and so any aliens out there might be watching I Love Lucy reruns as they judge whether or not to annihilate our species.  But does this actually work out?

How much power are we talking about? [Clear-channel stations](https://en.wikipedia.org/wiki/Clear-channel_station) must broadcast at at least $10 \ \textrm{kW}$ to maintain their status, with most stations broadcasting at $50 \ \textrm{kW}$,  The most powerful AM radio station on earth is the Mexican station [XEM](https://en.wikipedia.org/wiki/XEW-AM) which has been broadcasting at $900 \ \textrm{kHz}$ at $250 \ \textrm{kW}$ for more than 80 years, until 2016 when they moved transmitters and are now back down at $100 \ \textrm{kW}$.

As the signal propogates away from the earth, its energy density diminishes as it spreads out over a larger area.  This is the classic $1/R^2$ style decay we're used to from most interactions.  In particular, if we look at the signal's intensity as it moves away from the earth it takes the form:

\begin{equation}
	\frac{\textrm{power}}{\textrm{area}} = \frac{250 \ \textrm{kW}}{4 \pi R^2} = 9\times10^{-19} \ \left.\textrm{W}\middle/\textrm{m}^2\right. \cdot \left( \frac{1 \ \textrm{au}}{R}\right)^2
\end{equation}

Can this signal be detected?  If the aliens have good enough equipment, maybe?  At somepoint however this energy density is going to drop below the noise floor set by the [Cosmic Microwave Background](https://en.wikipedia.org/wiki/Cosmic_microwave_background), radio waves filling the universe and left over from the big bang.  The CMB follows a perfect blackbody 
form with a temperature of $2.7255 \ \textrm{K}$.

![cmb blackbody](https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Cmbr.svg/1024px-Cmbr.svg.png)

The spectral radiance follows:

\begin{equation}
	B_\nu(\nu, T) = \frac{2 h \nu^3}{c^2} \frac{1}{e^{h \nu / kT} - 1}
\end{equation}

So, integrating over a full $4\pi$ steridian since we are in the limit of low frequency this becomes, for a $20 \ \textrm{kHz}$ bandwidth typical of an AM radio station:

\begin{equation}
    \frac{2 \nu^2 kT}{c^2} \Delta \nu = 1.4\times10^{-23} \ \left.\textrm{W}\middle/\textrm{m}^2\right.
\end{equation}

Equating these two gives an estimate for the distance our signals can be heard above background:

\begin{equation}
	R = \sqrt{ \frac{ 250 \ \textrm{kW}\!\cdot\!c^2 }{ 8 \pi \nu^2 \Delta \nu k T}} \sim 260 \ \textrm{au} \sim 4 \ \textrm{mly}
\end{equation}

For comparison, [Voyager 1](https://en.wikipedia.org/wiki/Voyager_1) the further any man-made object has gotten has thus far gotten $\sim 150 \ \text{au}$ from Earth.  Pluto orbits the sun at $\sim 40 \ \text{au}$.  The nearest star to us is [Alpha Centauri](https://en.wikipedia.org/wiki/Alpha_Centauri) at $\sim 4.4 \ \text{ly}$ away. 

So our most power radio signal managed to make it $0.09\%$ or about 1 part per thousand of distance to our nearest neighbor.

## Worrying about Sun

Since we are still quite close to the sun, we might worry that the dominate noise source is noise from the sun rather than the CMB.  At the frequencies we are talking, we are in the low frequency limit for both, so the ratio of the intensities becomes simply the ratio of the temperatures.  The sun's blackbody temperature is approximately $5800 \ \textrm{K}$ and so its radio intensity would be some $2000$ times larger, though I'm suddenly confused how that works as we move farther and farther away from the sun.  I mean we know that at the earth the signal is more intense than solar background cause we can hear it, so it'll remain above solar background as it spreads, cause the solar radiation also spreads.  But the CMB is everywhere, you can't outrun it.

I'd like to try to figure out what the steridian 

## Minimum Detectable Signal

So looking at wikipedia we have [this](https://en.wikipedia.org/wiki/Minimum_detectable_signal) page on minimum detectable signals.  Rearranging the formula they give it seems to suggest that you can detect a signal if:

\begin{equation}
	10 \log_{10} \left(\frac{k T \cdot \Delta \nu}{1 \ \textrm{mW}} \right) + NF
\end{equation}

## Integrating signals

In the low SNR limit, detection seems to require observing for some $\sim 1/(\textrm{SNR})^2$ cycles.  Since the station ran for $80 \ \textrm{year}$, 
this gives us $\sim 2\times10^{15}$ cycles total, which even in this case only can take us out to about $30 \ \textrm{ly}$ of detection threshold.

## References

 1. https://arxiv.org/abs/1412.4867
 1. https://history.nasa.gov/CP-2156/ch5.5.htm
 
 
 
