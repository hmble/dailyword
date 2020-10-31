#!/bin/bash

echo "Starting script"
echo "Running go program"
go run wordnet2json/main.go

gzip -dc wordnet.json.gz | jq '.. | select(type != "null") | {word: .word?, gloss:.gloss?}' > wordsonly.json

echo "Running sed"

echo "Deleting first 8 lines"
sed -i '8d' wordsonly.json

echo "Adding [ at start of json"
sed -i '1i[\n' wordsonly.json

echo "Adding ] at end of json"
sed -i -e '$a\]' wordsonly.json

echo "Adding , after } bracket in json"
sed -i 's/^}/}\,/g' wordsonly.json

# https://stackoverflow.com/questions/38649053/replace-the-pattern-on-second-to-last-line-of-a-file
echo "Remove last , from object"
sed -i 'x; ${s/.*/}/;p;x}; 1d' wordsonly.json

echo "Compressing json"
gzip wordsonly.json



