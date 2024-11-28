# clean up old video
rm unstoppable.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile  unstoppable.pdf unstoppable
pdftoppm -png -r 240 -progress unstoppable.pdf unstoppable

# convert to video
ffmpeg \
  -ss 00:00:00 -i unstoppable-%03d.png \
  -ss 00:01:04 -i The_Bridge_on_the_River_Kwai_1957_-_Colonel_Bogey_March-ostmusicmix-dzWRlTgEB5Q.m4a \
  -shortest unstoppable_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i unstoppable_raw.mp4 -o unstoppable.mp4

# clean up
rm unstoppable-*.png
rm unstoppable_raw.mp4