# clean up old video
rm mariachi.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile -f 14 mariachi.pdf mariachi
pdftoppm -png -r 240 -progress mariachi_repeat.pdf mariachi

# convert to video
ffmpeg  -ss 00:00:00 -i mariachi-%03d.png -ss 00:02:34 -i The_Mariachis_-_Feliz_Navidad_official_video-The_Mariachis-C9QHtOnEIHk.m4a -shortest mariachi_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i mariachi_raw.mp4 -o mariachi.mp4

# clean up
if [ -e "mariachi.mp4" ]; then
  rm mariachi-*.png
  rm mariachi_raw.mp4
fi