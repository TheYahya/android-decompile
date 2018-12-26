#!/bin/bash

APKTOOL="./apktool/apktool"
DEX2JAR="./dex2jar-2.0/d2j-dex2jar.sh" 
DIR_RESULT="./result"
DIR_TEMP="./temp"
mkdir -pv $DIR_RESULT
mkdir -pv $DIR_TEMP

for i in ./apk/*.apk
do
    if test -f "$i" 
    then
        filename=$(basename "$i")
        extension="${filename##*.}"
        filename="${filename%.*}"
       	echo "$filename"
        echo "$filename ziping..."
       	cp -v ./apk/$filename.apk ./$DIR_TEMP/$filename.zip
       	echo "$filename decompiling resources"
		$APKTOOL d ./apk/$filename.apk 
		#mkdir -pv ./$DIR_RESULT/$filename #maybe for an error you need this :)))
		echo "moving $filename to $DIR_RESULT"
		mv ./$filename ./$DIR_RESULT
		echo "$filename unziping..."
		unzip ./$DIR_TEMP/$filename.zip  -d ./$DIR_TEMP/$filename/

    for dexClasses in ./${DIR_TEMP}/${filename}/classes*.dex
    do
        echo "$filename decompiling jar"
        ${DEX2JAR} ${dexClasses}
        #classes* stands for classes15-error.zip and classes15-dex2jar.jar
        mv ./classes* ./${DIR_RESULT}/${filename}
    done

    fi
done
rm -r ./$DIR_TEMP/