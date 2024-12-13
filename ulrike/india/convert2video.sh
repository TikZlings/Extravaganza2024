# clean up old video
rm india.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile -f 400 india.pdf india
pdftoppm -png -r 240 -progress india.pdf india

# convert to video
ffmpeg  \
  -ss 00:00:00 -i india-%03d.png \
  -ss 00:00:04 -i Signature_Video_Kerala_Tourism_Experience_God_s_Own_Country-Kerala_Tourism-R83BlU5nnbs.m4a \
  -shortest india_raw.mp4  
  
# repair video
HandBrakeCLI --crop 0:0:0:0  -i india_raw.mp4 -o india.mp4

# clean up
if [ -e "india.mp4" ]; then
  rm india-*.png
  rm india_raw.mp4
fi