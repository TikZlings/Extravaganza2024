# clean up old video
rm lion.mp4

# convert to png images
# pdftoppm -png -r 48 -progress -singlefil/e -f 310 lion.pdf lion
pdftoppm -png -r 240 -progress lion.pdf lion

# convert to video
ffmpeg \
  -ss 00:00:00 -i lion-%03d.png \
  -ss 00:00:11 -i The_Lion_Sleeps_Tonight_Lyrics-morty298-399syDv0bBM.m4a \
  -shortest lion_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i lion_raw.mp4 -o lion.mp4

# clean up
if [ -e "lion.mp4" ]; then
  # rm lion-*.png
  rm lion_raw.mp4
fi