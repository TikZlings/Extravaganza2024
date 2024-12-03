# clean up old video
rm silentnight.mp4

# convert to png images
pdftoppm -png -r 240 -progress silentnight_repeat.pdf silentnight

# convert to video
ffmpeg  -ss 00:00:00 -i silentnight-%03d.png -ss 00:00:18 -i Margret_Almer_-_Stille_Nacht_heilige_Nacht_Jodel_Version_1997-G5wpQbTU1Ck.m4a -shortest silentnight_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i silentnight_raw.mp4 -o silentnight.mp4

# clean up
rm silentnight-*.png
rm silentnight_raw.mp4

# view :)
open silentnight.mp4