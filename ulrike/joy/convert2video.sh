# clean up old video
rm joy.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile joy.pdf joy
pdftoppm -png -r 240 -progress joy_repeat.pdf joy

# convert to video
ffmpeg  \
  -ss 00:00:00 -i joy-%03d.png \
  -ss 00:00:10 -i Joy_To_The_World_The_Bach_Choir_Lyrics-Praise_Adonai-cr8myPmEpWw.m4a \
  -shortest joy_raw.mp4  
  
# repair video
HandBrakeCLI --crop 0:0:0:0  -i joy_raw.mp4 -o joy.mp4

# clean up
if [ -e "joy.mp4" ]; then
  rm joy-*.png
  rm joy_raw.mp4
fi