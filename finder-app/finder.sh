#!/usr/bin/env bash
if (( $# < 2 )); then
  #echo "Not enough arguments provided. Exiting..."
  exit 1
fi
declare -r filesdir=$1
declare -r searchstr=$2
declare X=0
declare Y=0
if [ -d $filesdir ];
then
  X=$(grep -rc $searchstr $filesdir | wc -l)
  for i in $(grep -rc $searchstr $filesdir | grep -oP :[0-9]* | grep -oP [0-9]*); do
	((Y+=i))
  done
  echo "The number of files are $X and the number of matching lines are $Y"
  exit 0
else
  #echo "$variable1 is not a directory! Exiting..."
  exit 1
fi
