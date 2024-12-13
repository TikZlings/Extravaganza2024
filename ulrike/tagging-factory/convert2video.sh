# clean up old video
rm tagging-factory.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile -f 27 tagging-factory.pdf tagging-factory
pdftoppm -png -r 240 -progress tagging-factory_repeat.pdf tagging-factory

# convert to video
ffmpeg  -ss 00:00:00 -i tagging-factory-%03d.png -shortest tagging-factory_raw.mp4
# ffmpeg  -ss 00:00:00 -i tagging-factory-%03d.png -ss 00:00:08 -i Silent_Night_on_bagpipes_by_Ryan_Randall-Ryan_Randall-avB5oDsZvZ0.m4a -shortest tagging-factory_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i tagging-factory_raw.mp4 -o tagging-factory.mp4

# clean up
if [ -e "tagging-factory.mp4" ]; then
  rm tagging-factory-*.png
  rm tagging-factory_raw.mp4
fi