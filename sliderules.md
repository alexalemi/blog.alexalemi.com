
Sliderules rule.  I'm rather enamored with them.  


I've collected several over the years.  One of my favorite 
is my old <a href="https://collection.maas.museum/object/383283">Soviet KL-1</a>.

<figure id="#benford">
  <center>
  <img width="95%" src="figures/circular-slide-rule.jpg"
    alt="Benford's distribution.">
  <figcaption>
  Figure xxf-physical. This is a picture of one of my <a href="https://collection.maas.museum/object/383283">Soviet KL-1 circular slide rules</a>, which previously featured in <a href="benfords.html">my post about Benford's law</a>.
  </figcaption>
  </center>
</figure>

Unlike a pocket
calculator, it feels like using a sliderule helps you develop a better number
sense, rather than rob you of one. 
An elegant weapon for a more civilized age.

## Digital Sliderule

In order to ensure that I always have a sliderule at my disposal, I recently build a *digital* one, available at
<a href="https://sliderule.alexalemi.com">sliderule.alexalemi.com</a>.

<figure id="#sliderule">
    <center>
    <a href="https://alexalemi.com/random/sliderule/">
    <img src="figures/mysliderule.png" 
        style="opacity: 1; border: 1px solid black; transition: opacity 0.1s ease;"
        onmouseover="this.style.opacity='0.6'"
        onmouseout="this.style.opacity='1'" />
    </a>
    </center>
  <figcaption>
  Figure xxf-sliderule. The digital sliderule I made at <a href="https://sliderule.alexalemi.com">sliderule.alexalemi.com</a>.
  </figcaption>
  </center>
</figure>


## Zine

If you're new to slide rules, in keeping with the tangible, physical theme, I made a <a href="https://en.wikipedia.org/wiki/Zine">Zine</a> that attempts to introduce how they work.  You can read it here:

<!--
<img src="figures/sliderule-zine-1.png" /><br>
<img src="figures/sliderule-zine-2.png" /><br>
<img src="figures/sliderule-zine-3.png" /><br>
<img src="figures/sliderule-zine-4.png" /><br>
<img src="figures/sliderule-zine-5.png" /><br>
<img src="figures/sliderule-zine-6.png" /><br>
<img src="figures/sliderule-zine-7.png" /><br>
<img src="figures/sliderule-zine-8.png" /><br>
-->

<style>
    .zine-viewer {
        max-width: 600px;
        margin: 20px auto;
        text-align: center;
    }

    .zine-container {
        position: relative;
        display: inline-block;
        background: white;
        border: 1px solid #ddd;
        border-radius: 8px;
        overflow: hidden;
        cursor: pointer;
    }

    .zine-image {
        display: block;
        max-width: 100%;
        height: auto;
    }

    .click-area {
        position: absolute;
        top: 0;
        bottom: 0;
        width: 50%;
        cursor: pointer;
    }

    .click-left {
        left: 0;
    }

    .click-right {
        right: 0;
    }

    .click-area:hover {
        background: rgba(0,0,0,0.05);
    }

    .page-counter {
        margin-top: 10px;
        font-family: Arial, sans-serif;
        color: #666;
        font-size: 14px;
    }
</style>
<div class="zine-viewer">
    <div class="zine-container">
        <img id="zineImage" class="zine-image" src="figures/sliderule-zine-1.png" alt="Zine page">
        <div class="click-area click-left" onclick="prevPage()"></div>
        <div class="click-area click-right" onclick="nextPage()"></div>
    </div>
    <div class="page-counter">
        Page <span id="currentPage">1</span> of 8
    </div>
</div>

<script>
    let currentPage = 1;
    const totalPages = 8;

    function updatePage() {
        document.getElementById('zineImage').src = `figures/sliderule-zine-${currentPage}.png`;
        document.getElementById('currentPage').textContent = currentPage;
    }

    function nextPage() {
        if (currentPage < totalPages) {
            currentPage++;
            updatePage();
        }
    }

    function prevPage() {
        if (currentPage > 1) {
            currentPage--;
            updatePage();
        }
    }

    // Keyboard navigation
    document.addEventListener('keydown', (e) => {
        if (e.key === 'ArrowLeft') prevPage();
        if (e.key === 'ArrowRight') nextPage();
    });
</script>

Or you can download a <a href="assets/sliderule-zine.pdf">PDF</a> copy that you can print and <a href="https://www.42ndstreet.org.uk/media/etdlxppk/zine-guide-colour.jpg">fold</a> yourself.

If you want to learn more, there is an old <a href="https://sliderulemuseum.com/Manuals/M220_AnEasyIntroductionToTheSlideRule_IsaacAsimov_1965.pdf">book by Isaac Asimov</a>,  or a great <a href="https://www.youtube.com/watch?v=oYQdKbQ-sgM">1957 Educational film</a>.


## Make your own

You can <a href="https://www.sliderulemuseum.com/REF/scales/MakeYourOwnSlideRule_ScientificAmerican_May2006.pdf">print your own</a> using instructions in an old <a href="https://www.physics.wisc.edu/ingersollmuseum/wp-content/uploads/sites/10/2020/04/scientificamerican0506-80-WhenSlideRulesRuled.pdf">Scientific American article</a>.

Or an innovated <a href="https://sliderulemuseum.com/SR_Scales.shtml#YingHum">circular slide rule</a> created by Ying Hum that can be printed and fit in an old CD jewel case.

Another option would be to 3D print your own. <a href="https://www.youtube.com/watch?v=qTd03m8rsfg">Alex Desilets created plans</a> for a series of 3D printed sliderules. 

<figure id="#printed-sliderule">
  <center>
  <img src="figures/printed-sliderule.jpg" width="100%" alt='3d printed sliderule'/>
  <figcaption>
  Figure xxf-printed. A circular sliderule I 3d printed.
  </figcaption>
  </center>
</figure>

