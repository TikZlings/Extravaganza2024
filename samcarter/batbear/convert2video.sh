# clean up old video
rm batbear.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile -f 500 batbear.pdf batbear
pdftoppm -png -r 240 -progress batbear.pdf batbear

# convert to video
ffmpeg \
  -ss 00:00:00 -i batbear-%03d.png \
  -ss 00:00:50 -i Batman_Soundtrack_-_01._The_Batman_Theme-jediking12-lcCYhDu4_ZY.m4a \
  -shortest batbear_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i batbear_raw.mp4 -o batbear.mp4

# clean up
if [ -e "batbear.mp4" ]; then
  rm batbear-*.png
  rm batbear_raw.mp4
fi