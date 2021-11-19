<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
    <title>blog.alexalemi.com</title>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-F5SW43T5NT"></script>
    <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());

    gtag('config', 'G-F5SW43T5NT');
    </script>

    <!-- RSS Feed -->
    <link rel="alternate" type="application/rss+xml" title="blog.AlexAlemi.com" href="https://blog.alexalemi.com/rss.xml" />

    <!-- Search Engine -->
    <meta name="description" content="Alex Alemi's Blog">
    <meta name="image" content="https://alexalemi.com/images/me_small.jpg">

    <!-- Schema.org for Google -->
    <meta itemprop="name" content="blog.alexalemi.com">
    <meta itemprop="description" content="Alex Alemi's Blog">
    <meta itemprop="image" content="https://alexalemi.com/images/me_small.jpg">

    <!-- Twitter -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="blog.alexalemi.com">
    <meta name="twitter:description" content="Alex Alemi's Blog">
    <meta name="twitter:creator" content="alemi">
    <meta name="twitter:image:src" content="https://alexalemi.com/images/me_small.jpg">

    <!-- Open Graph general (Facebook, Pinterest & Google+) -->
    <meta name="og:title" content="blog.alexalemi.com">
    <meta name="og:description" content="Alex Alemi's Blog">
    <meta name="og:image" content="https://alexalemi.com/images/me_small.jpg">
    <meta name="og:url" content="https://blog.alexalemi.com">
    <meta name="og:site_name" content="blog.alexalemi.com">
    <meta name="og:type" content="website">

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

</head>

<body>

    <!-- Header with social links -->
    <header>
        <h1 style="margin-top: 0px; margin-bottom: 4px">Alex Alemi's Blog</h1>
        <nav>
          <a href='https://blog.alexalemi.com' />Index</a> |
          <a href='https://alexalemi.com' />About Me</a> | 
          <a rel="alternate" type="application/rss+xml" title="blog.AlexAlemi.com" href="https://blog.alexalemi.com/rss.xml" />RSS</a>
        </nav>
        <!--    <a href="rss.xml" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="256px" height="250px"
                    viewBox="0 0 24 24" version="1.1" preserveAspectRatio="xMidYMid">
                    <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-12.832 20c-1.197 0-2.168-.969-2.168-2.165s.971-2.165 2.168-2.165 2.167.969 2.167 2.165-.97 2.165-2.167 2.165zm5.18 0c-.041-4.029-3.314-7.298-7.348-7.339v-3.207c5.814.041 10.518 4.739 10.561 10.546h-3.213zm5.441 0c-.021-7.063-5.736-12.761-12.789-12.792v-3.208c8.83.031 15.98 7.179 16 16h-3.211z"/>
                    </svg>
            </a>
        -->
    </header>

    <!-- Bio and stuff -->
    <main>
      <p>Some of <a href="https://alexalemi.com">my</a> thoughts...</p>
      <p>If you have feedback, please reach out on <a href="https://twitter.com/alemi">twitter</a> or have a discussion on <a href="https://github.com/alexalemi/blog.alexalemi.com/discussions">github</a>.
    </main>

    <!--- Writings section --->
    <div class="listing">
      {% for a in posts %}
        {% if not a.hidden and not a.draft %}
          <article>
           <cite><a href="{{ a.src.replace('.md', '.html') }}">{{ a.title }}</a></cite>
           <p>
             <date>{{ a.date }}</date>
             <summary>{{ a.description }}</summary>
           </p>
          </article>
        <hr />
        {% endif %}
      {% endfor %}
    </div>

</body>
</html>
