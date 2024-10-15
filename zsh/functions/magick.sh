#!/usr/bin/env bash

function tlc_submit() {
  cd ~/Downloads/submit || return
  mogrify -format jpg *.heic
  rm *.heic
  magick *.jpg answers.pdf
  rm *.jpg
  open -a 'Microsoft Outlook'
  open .
  cd - || return
}
