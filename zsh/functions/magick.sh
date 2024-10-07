#!/usr/bin/env bash

function tlc_submit() {
  cd ~/Downloads/submit || exit
  mogrify -format jpg *.heic
  rm *.heic
  magick *.jpg answers.pdf
}
