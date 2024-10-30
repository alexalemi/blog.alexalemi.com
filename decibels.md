
Quick, what is 4.5 + 8?  Now try to do 2.8 * 6.3 to two sigfigs?  How about 4.5 - 8 and 2.8 / 6.3?  Which of those
was easier?

There are corners of the internet where people argue whether [Seximal](https://www.seximal.net/), [Dozenal](https://en.wikipedia.org/wiki/Duodecimal) or [decimal](https://en.wikipedia.org/wiki/Decimal) are the best way to represent numbers<a href="#others"><sup>1</sup></a>. 

<aside> <sup id="others">1</sup> 
  Amongst <a href="https://en.wikipedia.org/wiki/Numeral_system">others</a>.
</aside>

I find myself quite sympathetic to the arguments in favor of seximal.  Base six
is a nice small base, with a lot of factors and would simplify most arithmetic
we do on a daily basis.  However, if I'm being honest, most of the arithmetic I
do on a daily basis is done with numbers in scientific notation.

<aside> <sup id="natural-log">2</sup>
<a href="https://www.scientificamerican.com/article/a-natural-log/">
<i>A Natural Log: Our Innate Sense of Numbers is Logarithmic, Not Linear</i>. Kurt Kleiner. Scientific American. Aug 2008.
</a>
</aside>

<aside> <sup id="speed-of-light">3</sup>
The speed of light in a vacuum, in meters per second.
</aside>

<style>
	.em1 {color: steelblue}
	.em2 {color: salmon}
    .em3 {color: darkseagreen}
</style>

[Scientific notation](https://en.wikipedia.org/wiki/Scientific_notation) is nice because it aligns well with our naturally logarithmic sense of numbers.<sup><a href="#natural-log">2</a></sup>. A number is simplified down to its <i class="em1">significand</i>, and <i class="em2">exponent</i> just like in [floating point](https://en.wikipedia.org/wiki/Floating-point_arithmetic) (plus its <i class="em3">unit</i>).  For example the number 299,792,458<sup><a href="#speed-of-light">3</a></sup> would become:

$$ \color{steelblue}{2.99792458} \times 10^{\color{salmon}{8}} \color{darkseagreen}{\text{ m/s}} $$

Now the focus has shifted, we can look to the exponent to the right to immediately figure out the <i>scale</i>
of the number, and the significand only has the sort of <i>numberness</i> of the number, and we can see that this
particular number is very three-like.

Compare this with the following:

$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} \{\color{darkseagreen}{\text{m/s}}\} $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} ]\color{darkseagreen}{\text{m/s}}[ $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} ]\color{darkseagreen}{\text{m/s}} $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} \ell\color{darkseagreen}{\text{m/s}} $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} |\color{darkseagreen}{\text{m/s}} $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} \lfloor\color{darkseagreen}{\text{m/s}} \rceil $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} [\color{darkseagreen}{\text{m/s}} ] $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} \langle \color{darkseagreen}{\text{m/s}} \rangle $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} \lfloor\color{darkseagreen}{\text{m/s}} ) $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} \lfloor\color{darkseagreen}{\text{m/s}} ] $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} (\color{darkseagreen}{\text{m/s}} ) $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} \rangle\color{darkseagreen}{\text{m/s}} ] $$
$$ {\color{salmon}8}{\color{steelblue}{4.76820703}} \rangle\color{darkseagreen}{\text{m/s}} \rangle $$

$$ 64 \rangle \text{m/s} \rangle \cdot 21 \rangle \text{s} \rangle = 85 \rangle \text{m}\rangle $$
$$ 64 \rangle \text{m/s}  \cdot 21 \rangle \text{s}  = 85 \rangle \text{m} $$
$$ 64 \,\underline{\text{m/s}}  \cdot 21  \,\underline{\text{s} } = 85 \,\underline{ \text{m}} $$

## Physical Constants

## Multiplication

## Addition

## Belief


## Other models of arithmetic

Order of magnitude.  Zestimates,  1-$\pi$-10,  sexibels...
