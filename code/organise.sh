#!/bin/bash
B=$(pwd)
mkdir organised
cd $B/mock_grading
var="$(cat roll_list)"
cd $B/organised
for w in $var
do 
	mkdir $w
	
done
cd $B/mock_grading/submissions
for w in $var ; do
	
	for file in *$w*; do
		ln -s $B/mock_grading/submissions/$file $B/organised/$w
	
done
done 
cd $B

