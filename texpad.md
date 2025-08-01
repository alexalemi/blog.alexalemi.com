

When I was at Google, I had a problem.  We used GSuite tools for everything, [Slides](http://slides.google.com) for presentations, [Docs](http://docs.google.com) for docs, [Chat](http://chat.google.com) for communication, and none of these tools had great [LaTeX](https://www.latex-project.org/) support.

So, I rolled together a simple utility: [texpad.alexalemi.com](https://texpad.alexalemi.com/)

It's a single static page that uses [MathJax](https://www.mathjax.org/) to let you live-edit
a LaTeX formula and renders it as a PNG that you can copy and paste into
basically any web app. This works with Chat, Slack, Slides, Docs, etc and has been indispensible to me over the years.

<figure id="#thumbnail" class="right">
  <center>
  <a href="https://texpad.alexalemi.com"><img width="95%" src="figures/texpad.png"
    alt="A screenshot of texpad.alexalemi.com."></a>
  <figcaption>
  Figure 1. A screenshot of <a href="https://texpad.alexalemi.com">texpad.alexalemi.com</a>
  </figcaption>
  </center>
</figure>


It uses your browser [local storage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) to store the last 100 or so equations you've entered, and you can click on those to restore them.  It will also use local storage to store a persistant preamble.  You can adjust the foreground and background color as well as the scale.  I find scale = 3 useful for presentations. If your curious, the [github repo](https://github.com/alexalemi/texpad) is also available.

I thought I'd share.  Enjoy.
