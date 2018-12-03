#!/bin/bash

tmpdir=$(mktemp -d)
trap "rm -R $tmpdir" 0 2 3 15
cp $1 $tmpdir;
cd $tmpdir;/usr/local/bin/yaml2json $tmpdir/$1 && /usr/local/bin/json-to-plantuml $tmpdir/$1.json > $tmpdir/$1.txt ;
cd $tmpdir;java -jar /usr/local/bin/plantuml.jar $tmpdir/$1.txt > $tmpdir/$1.png && cp $tmpdir/$1.png ~/$1.png
open ~/$1.png;

rm -R ${tmpdir}
