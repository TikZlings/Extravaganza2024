# clean up old video
rm paddington.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile  paddington.pdf paddington
pdftoppm -png -r 240 -progress paddington.pdf paddington

# convert to video
ffmpeg \
  -ss 00:00:00 -i paddington-%03d.png \
  -ss 00:00:24 -i The_Adventure_of_Paddington_Marmalade_Song-Best_Youtubers_and_Tv_shows_for_kids-EHxUb5akz48.m4a \
  -shortest paddington_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i paddington_raw.mp4 -o paddington.mp4

# clean up
rm paddington-*.png
rm paddington_raw.mp4