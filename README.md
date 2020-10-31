List of words and there deifinition in json format.

code to extract words to json is modified from [fluhus/gostuff ][repo] repo 

Database is of version 3.1

### Steps to get words list

1. Download database only version from link below

https://wordnet.princeton.edu/download/current-version

2. Extract words list in current repo
`$ tar -xf <downloaded-database-file>`

3. Edit wordnet2json/main.go for any modified filename changes and run.
 `$ go run wordnet2json/main.go`

4. Extract only `words and gloss` from json.

  `$ gzip -dc wordnet.json.gz | jq '.. | select(type != "null") | {word: .word?, gloss:.gloss?}' > test.json`

5. use sed to modify json file
  `$ sed -i '1s/^/\]' test.json`
  `$ sed -i -e '$a\]' test.json`
  `$ sed -i 's/^}/}\,' test.json`






### Citation

Princeton University "About WordNet." [WordNet](https://wordnet.princeton.edu/). Princeton University. 2010.

[repo]: [https://github.com/fluhus/gostuff/tree/master/nlp/wordnet]






