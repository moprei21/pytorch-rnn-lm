#! /bin/bash

scripts=`dirname "$0"`
base=$scripts/..

data=$base/data

mkdir -p $data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

# download a different interesting data set!

mkdir -p $data/trump

mkdir -p $data/trump/raw

wget https://ocw.mit.edu/ans7870/6/6.006/s08/lecturenotes/files/t8.shakespeare.txt
mv t8.shakespeare.txt $data/trump/raw

# preprocess slightly

cat $data/trump/raw/t8.shakespeare.txt | python $base/scripts/preprocess_raw.py > $data/trump/raw/t8.shakespeare.cleaned.txt

# tokenize, fix vocabulary upper bound

cat $data/trump/raw/t8.shakespeare.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" > \
    $data/trump/raw/t8.shakespeare.preprocessed.txt

# split into train, valid and test

head -n 500 $data/trump/raw/t8.shakespeare.preprocessed.txt > $data/trump/valid.txt
head -n 1000 $data/trump/raw/t8.shakespeare.preprocessed.txt | tail -n 500 > $data/trump/test.txt
tail -n 3260 $data/trump/raw/t8.shakespeare.preprocessed.txt > $data/trump/train.txt
