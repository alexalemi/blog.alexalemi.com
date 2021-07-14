<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name='viewport'
      content='width=device-width, initial-scale=1.0, maximum-scale=1.0' />
    <title>blog.alexalemi.com {{title}}</title>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-153903138-1"></script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'UA-153903138-1');
    </script>

    <!-- RSS Feed -->
    <link rel="alternate" type="application/rss+xml" title="blog.AlexAlemi.com" href="https://blog.alexalemi.com/rss.xml" />

    <!-- Fonts -->
    <script type="text/javascript">
        WebFontConfig = {
            google: { families: [ 'Muli', 'Lato' ] }
        };
        (function() {
            var wf = document.createElement('script');
            wf.src = ('https:' == document.location.protocol ? 'https' : 'http') + '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
            wf.type = 'text/javascript';
            wf.async = 'true';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(wf, s);
        })();
    </script>

    <!-- Inline CSS -->
    <link rel="stylesheet" type="text/css" href="assets/style.css"/>

    <script defer src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
    <script>
    MathJax = {
      tex: {
        inlineMath: [['$', '$'], ['\\(', '\\)']],
        processEscapes: true
      }};
    </script>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

</head>

<body>


  <header>
    <h3>Alex Alemi's Blog</h3>
    <nav>
      <a href='https://blog.alexalemi.com' />Index</a> |
      <a href='https://alexalemi.com' />About Me</a> | 
      <a rel="alternate" type="application/rss+xml" title="blog.AlexAlemi.com" href="https://blog.alexalemi.com/rss.xml" />RSS</a>
    </nav>
  </header>

  <article>
    <header>
      <h1>{{ title }}<h1>
      <p>Alexander A. Alemi. <time datetime='{{ date }}'>{{ date }}</time></p>
    </header>
    <div class="content">
    {{ content }} 
    </div>
  </article>

  <footer>
    <!-- <p>
    &copy; 2020 Alexander A. Alemi
    </p>
    -->
  </footer>



</body>
</html>
