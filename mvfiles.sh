#!/bin/bash
INPUT=data/legend.csv
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
{
read
while read uid name emotion
do
  if [ ! -d "images/$emotion" ]
  then 
    mkdir images/$emotion
  fi
  W=`identify -format '%w' images/$name`
  H=`identify -format '%h' images/$name`
  if [ "$W" == 350 ] && [ "$H" == 350 ];
  then
    mv images/$name images/$emotion/
  else
    echo "Name : $name"
    echo "$H $W"
  fi
done
} < $INPUT
IFS=$OLDIFS
cd images
#rm *.jpg
