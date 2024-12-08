# clean up old video
rm excitingtimes.mp4

# convert to png images
pdftoppm -png -r 48 -progress -singlefile excitingtimes.pdf excitingtimes
pdftoppm -png -r 240 -progress excitingtimes_repeat.pdf excitingtimes

# convert to video
ffmpeg  -ss 00:00:00 -i excitingtimes-%03d.png -ss 00:00:58 -i The_Pointer_Sisters_-_I_m_So_Excited_Official_Video_Full_HD_Digitally_Remastered_and_Upscaled-Enhanced_Music_Videos-5qFb0_JUjE8.m4a -shortest excitingtimes_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i excitingtimes_raw.mp4 -o excitingtimes.mp4

# clean up
if [ -e "excitingtimes.mp4" ]; then
  rm excitingtimes-*.png
  rm excitingtimes_raw.mp4
fi