#!/bin/bash

# passing a title to the intermission
# Params:
# 1: jobname
# 2: some string for the title
convert2video(){

    # compiling
    latexmk -jobname=extravaganza-intermission-$1 -pretex="\def\mytitle{$2}" -usepretex extravaganza-intermission
    
    # clean up old video
    rm $1.mp4

    # convert to png images
    # convert -density 160 extravaganza-intermission-$1.pdf $1.png
    pdftoppm -png -r 240 -progress extravaganza-intermission-$1.pdf $1

    # convert to video
    ffmpeg -r 10 -ss 00:00:00 -i $1-%02d.png -ss 00:00:00 -i christmas-music-box-music.m4a -shortest $1_raw.mp4

    # repair video
    HandBrakeCLI --crop 0:0:0:0 -i $1_raw.mp4 -o $1.mp4

    # clean up
    rm $1-*.png
    rm $1_raw.mp4
    rm extravaganza-intermission-$1.aux
    rm extravaganza-intermission-$1.log
    rm extravaganza-intermission-$1.nav
    rm extravaganza-intermission-$1.snm
    rm extravaganza-intermission-$1.toc
    rm extravaganza-intermission-$1.out
    rm extravaganza-intermission-$1.fls
    rm extravaganza-intermission-$1.fdb_latexmk

}

# repeat an existing pdf several times
# Params:
# 1: jobname
# 2: path and name to the pdf file
# 3: number of repetitions [default 75]
repeatconvert(){

    # compiling
    latexmk -jobname=extravaganza-intermission-$1 -pretex="\def\filename{$2}\def\myrepeat{$3}" -usepretex repeat  
    
    # clean up old video
    rm $1.mp4

    # convert to png images
    pdftoppm -png -r 240 -progress extravaganza-intermission-$1.pdf $1

    # convert to video
    ffmpeg -r 10 -ss 00:00:00 -i $1-%03d.png -ss 00:00:00 -i christmas-music-box-music.m4a -shortest $1_raw.mp4

    # repair video
    HandBrakeCLI --crop 0:0:0:0 -i $1_raw.mp4 -o $1.mp4

    # clean up
    rm $1-*.png
    rm $1_raw.mp4
    rm extravaganza-intermission-$1.aux
    rm extravaganza-intermission-$1.log
    rm extravaganza-intermission-$1.nav
    rm extravaganza-intermission-$1.snm
    rm extravaganza-intermission-$1.toc
    rm extravaganza-intermission-$1.out
    rm extravaganza-intermission-$1.fls
    rm extravaganza-intermission-$1.fdb_latexmk
        
}

# preview images
pdftoppm -png -r 48 -progress -singlefile extravaganza-titlepage.pdf icon_small
pdftoppm -png -r 100 -progress -singlefile extravaganza-titlepage.pdf icon_medium
pdftoppm -png -r 150 -progress -singlefile extravaganza-titlepage.pdf icon_large

# Converting
# repeatconvert title "./extravaganza-titlepage.pdf" 101
# convert2video excitingtimes "Exciting Times"
# convert2video unstoppable "Unstoppable"
# convert2video flowerpower "Flower Power"
# convert2video mariachi "Mariachi Marmots"
# convert2video paddington "Paddington"
# convert2video joy "Joy to the World"
# convert2video commercial "Commercial Break"
# convert2video batbear "Batbär"
# convert2video abbeyroad "Abbey Road 2.0"
# convert2video whitewaterride "White Water Fun"
# convert2video lion "Meanwhile in Africa..."
# convert2video silentnight "Silent Night"
# convert2video finale "Grand Finale"
# repeatconvert credits "./extravaganza-credits.pdf" 150