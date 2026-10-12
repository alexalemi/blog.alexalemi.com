<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
    <title>blog.alexalemi.com</title>

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

    <!-- Search Engine -->
    <meta name="description" content="Alex Alemi's Blog">
    <link rel="canonical" href="https://blog.alexalemi.com/">

    <!-- Open Graph (Facebook, LinkedIn, Slack, Bluesky, ...) -->
    <meta property="og:type" content="website">
    <meta property="og:title" content="Alex Alemi's Blog">
    <meta property="og:description" content="Alex Alemi's Blog">
    <meta property="og:url" content="https://blog.alexalemi.com/">
    <meta property="og:site_name" content="blog.alexalemi.com">
    <meta property="og:image" content="https://alexalemi.com/assets/images/me_small.jpg">
    <meta property="og:image:alt" content="Headshot of Alex Alemi">

    <!-- Twitter / X (falls back to og:* for title, description, image) -->
    <meta name="twitter:card" content="summary">
    <meta name="twitter:creator" content="@alemi">

    <!-- Structured data -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "Blog",
      "name": "Alex Alemi's Blog",
      "url": "https://blog.alexalemi.com/",
      "author": { "@type": "Person", "name": "Alexander A. Alemi", "url": "https://alexalemi.com/" }
    }
    </script>

    <!-- Prerender same-origin links on hover -->
    <script type="speculationrules">
    { "prerender": [{ "where": { "href_matches": "/*" }, "eagerness": "moderate" }] }
    </script>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;1,400&family=Mulish:wght@700&display=swap">

    <!-- Inline CSS -->
    <link rel="stylesheet" type="text/css" href="assets/style.css"/>

</head>

<body>

    <!-- Header with social links -->
    <header>
        <h1 style="margin-top: 0px; margin-bottom: 4px">Alex Alemi's Blog</h1>
        <nav aria-label="Site">
          <a href="https://blog.alexalemi.com" aria-current="page">Index</a> |
          <a href="https://alexalemi.com">About Me</a> |
          <a rel="alternate" type="application/rss+xml" title="blog.AlexAlemi.com" href="https://blog.alexalemi.com/rss.xml">RSS</a>
        </nav>
        <!--    <a href="rss.xml" target="_blank">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="256px" height="250px"
                    viewBox="0 0 24 24" version="1.1" preserveAspectRatio="xMidYMid">
                    <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-12.832 20c-1.197 0-2.168-.969-2.168-2.165s.971-2.165 2.168-2.165 2.167.969 2.167 2.165-.97 2.165-2.167 2.165zm5.18 0c-.041-4.029-3.314-7.298-7.348-7.339v-3.207c5.814.041 10.518 4.739 10.561 10.546h-3.213zm5.441 0c-.021-7.063-5.736-12.761-12.789-12.792v-3.208c8.83.031 15.98 7.179 16 16h-3.211z"/>
                    </svg>
            </a>
        -->
    </header>

    <main>
      <!-- Bio and stuff -->
      <p>Some of <a href="https://alexalemi.com">my</a> thoughts...</p>
      <p>If you have feedback, please reach out on <a href="https://twitter.com/alemi">twitter</a> or <a rel="me" href="https://sigmoid.social/@alemi">mastodon</a> or have a discussion on <a href="https://github.com/alexalemi/blog.alexalemi.com/discussions">github</a>.</p>

    <!--- Writings section --->
    <div class="listing">
      {% for a in index %}
        {% if not a.hidden and not a.draft %}
          <article>
           <cite><a href="{% if a.obtude %}ob/nbs/{{a.src}}{% else %}{{ a.src.replace('.md', '.html') }}{% endif %}">{{ a.title }}</a></cite>
           <p>
             <time datetime="{{ a.date }}">{{ a.date }}</time>
             <span class="summary">{{ a.description }}</span>
           </p>
          </article>
        <hr />
        {% endif %}
      {% endfor %}
    </div>
    </main>

		<footer>
		<p>
		DISCLAIMER: This is a personal website, produced in my own time and solely reflecting my
		personal opinions. Statements on this site do not represent the views or policies of my
		employer.
		</p>
		</footer>


</body>
</html>
