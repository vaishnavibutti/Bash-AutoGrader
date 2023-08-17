#!/bin/bash
read url no
#url is the required url and no is number of directories you want to cut
fil=$(basename "$url")
wget -r -np -nH -R index.html.tmp -R index.html --cut-dirs=$no $url 
mv $fil mock_grading
