# clean up old video
rm Example.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile  Example.pdf Example
pdftoppm -png -r 240 -progress Example.pdf Example

# convert to video
ffmpeg \
  -ss 00:00:00 -i Example-%03d.png \
  -ss 00:00:10 -i Music.m4a \
  -shortest Example_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i Example_raw.mp4 -o Example.mp4

# clean up
if [ -e "Example.mp4" ]; then
  rm Example-*.png
  rm Example_raw.mp4
fi