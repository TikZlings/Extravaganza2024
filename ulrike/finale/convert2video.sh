# clean up old video
rm finale.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile -f 555 finale.pdf finale
pdftoppm -png -r 240 -progress finale.pdf finale

# convert to video
ffmpeg  \
  -ss 00:00:00 -i finale-%03d.png \
  -ss 00:00:00 -i Vangelis_-_Conquest_of_paradise-Makmian-WYeDsa4Tw0c.m4a \
  -shortest finale_raw.mp4  
  
# repair video
HandBrakeCLI --crop 0:0:0:0  -i finale_raw.mp4 -o finale.mp4

# clean up
if [ -e "finale.mp4" ]; then
  rm finale-*.png
  rm finale_raw.mp4
fi