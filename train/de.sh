#! /bin/sh
pip3 install -U esupar pytokenizations
test -d UD_German-HDT || git clone --depth=1 https://github.com/UniversalDependencies/UD_German-HDT
for F in train dev test
do cat UD_German-HDT/*-$F*.conllu > $F.conllu
done
python3 -m esupar.train bert-base-german-cased KoichiYasuoka/bert-base-german-upos .
exit 0
