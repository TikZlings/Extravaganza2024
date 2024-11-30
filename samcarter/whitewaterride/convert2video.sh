# clean up old video
rm whitewaterride.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile -f 375 whitewaterride.pdf whitewaterride
pdftoppm -png -r 240 -progress whitewaterride.pdf whitewaterride

# convert to video
ffmpeg  \
  -ss 00:00:00 -i whitewaterride-%03d.png \
  -ss 00:00:08 -i Swan_Lake_-_II._Dance_of_the_Little_Swans_-_Part_3_8-imusiciki-EVSb3dFszH4.m4a \
  -shortest whitewaterride_raw.mp4  
  
# repair video
HandBrakeCLI --crop 0:0:0:0  -i whitewaterride_raw.mp4 -o whitewaterride.mp4

# clean up
rm whitewaterride-*.png
rm water-*.jpg
rm whitewaterride_raw.mp4