#! /usr/bin/env bash

pdftoppm  -png -r 150 sliderule-zine.pdf temp  
convert temp-1.png -crop 2x4@ +repage -rotate 90 sliderule-zine-%02d.png
mogrify -rotate 180 sliderule-zine-00.png sliderule-zine-02.png sliderule-zine-04.png sliderule-zine-06.png 
rm temp-1.png

mv sliderule-zine-00.png sliderule-zine-6.png
mv sliderule-zine-01.png sliderule-zine-5.png
mv sliderule-zine-02.png sliderule-zine-7.png
mv sliderule-zine-03.png sliderule-zine-4.png
mv sliderule-zine-04.png sliderule-zine-8.png
mv sliderule-zine-05.png sliderule-zine-3.png
mv sliderule-zine-06.png sliderule-zine-1.png
mv sliderule-zine-07.png sliderule-zine-2.png

