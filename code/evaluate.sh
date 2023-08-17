#!/bin/bash
B=$(pwd)
> marksheet.csv
> distribution.txt
cd $B/mock_grading
var="$(cat roll_list)"

for w in $var; do
	score=0
	cd $B/organised/$w
	
	mkdir student_outputs
	for f in *.cpp; do
		g++ $f -o executable 2>/dev/null
	done
	
	for filename in $(ls $B/mock_grading/inputs/ | sed -n 's/\.in$//p'); do
	timeout 5 ./executable <$B/mock_grading/inputs/$filename.in> $B/organised/$w/student_outputs/$filename.out  2>/dev/null | :
	dif=$(diff $B/mock_grading/outputs/$filename.out $B/organised/$w/student_outputs/$filename.out)
	if [[ $dif == "" ]]
	then 
		let "score+=1"
	fi
	done
	echo $score >> $B/distribution.txt
	echo $w,$score >> $B/marksheet.csv		
done
cd $B
sort -k1 -n -t, marksheet.csv -o marksheet.csv
sort -r distribution.txt -o distribution.txt



