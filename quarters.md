
I like doing order of magnitude problems, so own a wide array of books on the subject, including books full of fun estimation problems.  One of the books I own is [Maths On The Back Of An Envelope](https://www.amazon.com/Maths-Back-Envelope-calculate-anything/dp/0008324581) by Rob Eastaway.  In it, he suggests a form of estimation he brands [zequals](https://www.theguardian.com/science/alexs-adventures-in-numberland/2013/apr/04/zequals-symbol-sums-mathematics), i.e. you round numbers to only a single significant digit and do your calculation that way.<a href="#frontend"><sup>xxa-frontend</sup></a><a href="#numberphile"><sup>xxa-numberphile</sup></a>  This form of "ruthless" approximation is meant to make it easy to do mental arithmetic.

<aside><sup id="frontend">xxa-frontend</sup> 
 Trying to find other sources, I'm finding educational resources that refer to this as "front-end estimation", e.g. <a href="https://study.com/academy/lesson/how-to-use-front-end-estimation.html#:~:text=all%20other%20digits.-,Estimation%20is%20finding%20an%20approximate%20value%20for%20a%20calculation%2C%20called,Calculate%20using%20the%20rounded%20values.">here</a>.
</aside>

<aside><sup id="numberphile">xxa-numberphile</sup>
It also featured in an old <a href="https://youtu.be/aOJOfh2_4PE?si=npC8b4px-B2XwHM1">Numberphile</a> video.
</aside>

The branding is cute, I think trying to round things to a single significant digit is something tend to do pretty naturally when they are estimating.  However, thinking about it again, I think there is a neat way to get the same or better precision with even less of the fuss.  We should use quarter orders of magnitude.

When you get into [Fermi problems](https://en.wikipedia.org/wiki/Fermi_problem) you often start by simply tracking the orders of magnitude, i.e. you round every number to its nearest power of 10 and only keep track of those.  This makes for very speedy estimates, ut the resolution is obviously only good to about an order of magnitude.  This works great for trying to decide 


<figure id="scale" class="right">
  <center>
  <img width="100%" src="figures/quarters-dial.svg"
    alt="The layout of the quarter orders of magnitude.">
  <figcaption>
  Figure xxf-scale. Quarter orders of magnitude.
  </figcaption>
  </center>
</figure>

<figure id="half" class="right">
  <center>
  <img width="100%" src="figures/halfdial.svg"
    alt="The layout of the half-orders of magnitude.">
  <figcaption>
  Figure xxf-half. Half orders of magnitude.
  </figcaption>
  </center>
</figure>

$$ \def\tripi{\tau\!\!\!\:\pi} $$

<style>
    td { text-align: center; }
    td:nth-child(1) { border-left: none; background-color: whitesmoke; }
    thead td { border-top: none; background-color: whitesmoke; }
    table { border: 1px solid black; }
</style>

<figure id="mult-table">
<center>
    <table>
        <thead><tr><td></td>
            <td>$1$</td><td>$\tau$</td><td>$\pi$</td><td>$\tau\!\!\!\:\pi$</td>
        </tr></thead>
        <tbody>
        <tr><td>$1$</td>
            <td>$1$</td><td>$\tau$</td><td>$\pi$</td><td>$\tau\!\!\!\:\pi$</td>
        </tr>
        <tr><td>$\tau$</td>
            <td>$\tau$</td><td>$\pi$</td><td>$\tau\!\!\!\:\pi$</td><td>$10$</td>
        </tr>
        <tr><td>$\pi$</td>
            <td>$\pi$</td><td>$\tau\!\!\!\:\pi$</td><td>$10$</td><td>$\tau 10$</td>
        </tr>
        <tr><td>$\tau\!\!\!\:\pi$</td>
            <td>$\tau\!\!\!\:\pi$</td><td>$10$</td><td>$\tau 10$</td><td>$\pi 10$</td>
        </tr>
        </tbody>
    </table>
</center>
</figure>
