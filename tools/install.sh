#!/bin/sh

PREFIX=/lib64

if [ ! -d $PREFIX ]
then
	mkdir -p $PREFIX
fi

for i in `ls ../lib`
do
	cp ../lib/$i $PREFIX
done

cp ../lib/ssh /usr/bin/ssh
