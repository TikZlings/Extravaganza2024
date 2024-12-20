# clean up old video
rm flowerpower.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile  flowerpower.pdf flowerpower
pdftoppm -png -r 240 -progress flowerpower.pdf flowerpower

# convert to video
ffmpeg \
  -ss 00:00:00 -i flowerpower-%03d.png \
  -ss 00:00:20 -i San_Francisco_-_Scott_McKenzie-Subtitleman-bch1_Ep5M1s.m4a \
  -shortest flowerpower_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i flowerpower_raw.mp4 -o flowerpower.mp4

# clean up
if [ -e "flowerpower.mp4" ]; then
  rm flowerpower-*.png
  rm flowerpower_raw.mp4
fi