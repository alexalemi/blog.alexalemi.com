
I'm a big fan of the new generation of *reactive* notebooks that don't have internal state, 
projects like [clerk](https://clerk.vision/)<sup><a href="#clerktudes">xxa-clerk</a></sup>
for clojure, [marimo](https://marimo.io/) for python, [pluto.jl](https://plutojl.org/) for julia and [observable notebook kit](https://observablehq.com/notebook-kit/kit)<sup><a href="#notebook-kit">xxa-observable</a></sup> for javascript.  Each of these deal with the biggest complaint about [jupyter notebooks](https://ipython.org/notebook.html) and [colab notebooks](https://colab.research.google.com/); namely that they have hidden state<sup><a href="#suck">xxa-suck</a></sup>. 
<aside> <sup id="clerktudes">xxa-clerk</sup> 
  E.g. see my <a href="https://github.clerk.garden/alexalemi/clerktudes">clerktudes</a>, mostly neat visual versions of some of <a href="https://github.com/alexalemi/advent">my adventofcode solutions</a>.
</aside>
<aside> <sup id="notebook-kit">xxa-observable</sup> 
  I just converted my old <a href="https://blog.alexalemi.com/ob/nbs/leap-day.html">Leap Day post</a> to the new <a href="https://observablehq.com/blog/observable-2-0">Observable 2.0 Notebook Kit</a>.
</aside>
<aside> <sup id="suck">xxa-suck</sup> 
  E.g. see <a href="https://youtu.be/7jiPeIFXb6U?si=JCZSTm_zVKDUJcIQ">the Joel Grus' infamous talk</a>.
</aside>

They each use what I think is the best trick in the book for solving a problem, if you don't want to be sick to some issue, make yourself invariant to it.  These projects don't look at your code linearly, from top to bottom, they instead see your code as organized into *cells* and resolve a dependency graph for how they all relate, ensuring that they only ever run cells when they change or once of their parent cells change.


[Marimo](https://marimo.io/) is a really nice entry into the space, I enjoy it a lot, but it asks that I abandon my ordinary development environment<sup><a href="neovim">xxa-neovim</a></sup> and use theirs instead.  [Clerk](https://clerk.vision/) and the just-released 
[Observable Notebook Kit](https://observablehq.com/notebook-kit/kit) instead let you use your ordinary editor and simply watch for whenever you make updates to the code.  This means you get to keep all of the niceties of the editor environment you've perfected over the years, and get to take advantage of nice tools like [linters](https://docs.astral.sh/ruff/), [language servers](https://en.wikipedia.org/wiki/Language_Server_Protocol), tab completion, autocomplete, and potentially things like llm agents and [claude code](https://www.anthropic.com/claude-code).
<aside> <sup id="neovim">xxa-neovim</sup> 
  I like <a href="https://zed.dev/">Zed</a> and <a href="https://neovim.io/">neovim</a> these days.
</aside>

My old coworker [Danijar](https://danijar.com/) had a nice project he called [Handout](https://github.com/danijar/handout), which let you build nice rendered python handouts and always executed fresh from top to bottom.  You got to use your own editor and didn't have any hidden state, but this, much like marimo, required writing nonstandard python code.


Feeling like python was still missing something quite like [clerk](https://clerk.vision), 
I decided to try to roll my own. I call it [Plaque](https://github.com/alexalemi/plaque), as in the ornamental tablet.  It uses ordinary python code and `# %%` style cell boundaries like [Jupytext](https://jupytext.readthedocs.io/en/latest/).  The bit of inspiration I had is that we can get essentially all of the benefits of a full reactive environment with very little work if we simply look for cells that change and run only those and all of the cells further down the page. With a bit more code we can actually use the python `ast` module to try to skip cells that don't reference any of the things we changed.  With very little code we end up with a system that I've found useful enough to begin using it regularly at work.


Here's a short video demo:
<center><iframe width="560" height="315" src="https://www.youtube.com/embed/DlbA1aOMsFw?si=QJQgb0kG-TWA04PK" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe></center>

If you use [`uv`](https://docs.astral.sh/uv/) you should be able to try it out right now:

`uvx plaque serve your-nb.py`

Check it out and let me know what you think.
