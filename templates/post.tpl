<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
    <title>{{ title }} - blog.alexalemi.com</title>

		<!-- favicon stuff -->
		<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
		<link rel="manifest" href="/site.webmanifest">
		<meta name="msapplication-TileColor" content="#da532c">
		<meta name="theme-color" content="#fefefe" media="(prefers-color-scheme: light)">
		<meta name="theme-color" content="#16171F" media="(prefers-color-scheme: dark)">


    <!-- RSS Feed -->
    <link rel="alternate" type="application/rss+xml" title="blog.AlexAlemi.com" href="https://blog.alexalemi.com/rss.xml" />

    {% set url = "https://blog.alexalemi.com/" ~ src.replace('.md', '.html') %}
    <!-- Search Engine -->
    <meta name="description" content="{{ description|e }}">
    <meta name="author" content="Alexander A. Alemi">
    <link rel="canonical" href="{{ url }}">

    <!-- Open Graph (Facebook, LinkedIn, Slack, Bluesky, ...) -->
    <meta property="og:type" content="article">
    <meta property="og:title" content="{{ title|e }}">
    <meta property="og:description" content="{{ description|e }}">
    <meta property="og:url" content="{{ url }}">
    <meta property="og:site_name" content="blog.alexalemi.com">
    <meta property="og:image" content="https://alexalemi.com/assets/images/me_small.jpg">
    <meta property="og:image:alt" content="Headshot of Alex Alemi">
    <meta property="article:published_time" content="{{ date }}">
    <meta property="article:author" content="https://alexalemi.com/">
    {% for tag in tags %}<meta property="article:tag" content="{{ tag|e }}">
    {% endfor %}

    <!-- Twitter / X (falls back to og:* for title, description, image) -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:creator" content="@alemi">

    <!-- Structured data -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "BlogPosting",
      "headline": {{ title|tojson }},
      "description": {{ description|tojson }},
      "datePublished": "{{ date }}",
      "url": "{{ url }}",
      "keywords": {{ tags|tojson }},
      "author": { "@type": "Person", "name": "Alexander A. Alemi", "url": "https://alexalemi.com/" },
      "publisher": { "@type": "Person", "name": "Alexander A. Alemi", "url": "https://alexalemi.com/" },
      "isPartOf": { "@type": "Blog", "name": "Alex Alemi's Blog", "url": "https://blog.alexalemi.com/" }
    }
    </script>

    <!-- Prerender same-origin links on hover -->
    <script type="speculationrules">
    { "prerender": [{ "where": { "href_matches": "/*" }, "eagerness": "moderate" }] }
    </script>

    <!-- Fonts -->
    <link rel="stylesheet" href="assets/fonts/fonts.css">

    <script>
    MathJax = {
      tex: {
        inlineMath: [['$', '$'], ['\\(', '\\)']],
        processEscapes: true
      }
    };
    </script>
    <script id="MathJax-script" defer src="https://cdn.jsdelivr.net/npm/mathjax@4/tex-mml-chtml.js"></script>

    <!-- Inline CSS -->
    <link rel="stylesheet" type="text/css" href="assets/style.css"/>
</head>

<body>


  <header>
    <p class="site-title">Alex Alemi's Blog</p>
    <nav aria-label="Site">
      <a href='https://blog.alexalemi.com'>Index</a> |
      <a href='https://alexalemi.com'>About Me</a> |
      <a rel="alternate" type="application/rss+xml" title="blog.AlexAlemi.com" href="https://blog.alexalemi.com/rss.xml">RSS</a>
    </nav>
  </header>

  <main>
  <article>
		<h1>{{ title }}</h1>
		<p>Alexander A. Alemi. <time datetime="{{ date }}">{{ date }}</time></p>
    <div class="content">
    {{ content }} 
    </div>
  </article>

  <section class="comments" aria-label="Comments">
  <script src="https://giscus.app/client.js"
        data-repo="alexalemi/blog.alexalemi.com"
        data-repo-id="MDEwOlJlcG9zaXRvcnkyNjk2OTU4MzU="
        data-category="Announcements"
        data-category-id="DIC_kwDOEBM7W84B_4Ke"
        data-mapping="pathname"
        data-reactions-enabled="1"
        data-emit-metadata="0"
        data-theme="preferred_color_scheme"
        data-lang="en"
        crossorigin="anonymous"
        async>
  </script>
  </section>
  </main>

  <footer>
    <!-- <p>
    &copy; 2020 Alexander A. Alemi
    </p>
    -->
  </footer>



</body>
</html>
