# clean up old video
rm abbeyroad.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile -f 300 abbeyroad.pdf abbeyroad
pdftoppm -png -r 240 -progress abbeyroad.pdf abbeyroad

# convert to video
ffmpeg  \
  -ss 00:00:00 -i abbeyroad-%03d.png \
  -shortest abbeyroad_raw.mp4

# ffmpeg  \
#   -ss 00:00:00 -i abbeyroad-%03d.png \
#   -ss 01:00:04 -i The_Bridge_on_the_River_Kwai_1957_-_Colonel_Bogey_March-ostmusicmix-dzWRlTgEB5Q.m4a \
#   -shortest abbeyroad_raw.mp4  

# repair video
HandBrakeCLI --crop 0:0:0:0  -i abbeyroad_raw.mp4 -o abbeyroad.mp4

# clean up
rm abbeyroad-*.png
rm abbeyroad_raw.mp4