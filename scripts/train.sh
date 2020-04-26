#! /bin/bash

scripts=`dirname "$0"`
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=4
device=""

SECONDS=0

#using emsize:200 and nhid:200 as hyperparameter with lowest text complexity
(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/trump \
        --epochs 40 \
        --emsize 200 --nhid 200 --dropout 0.5 --tied \
        --save $models/model.pt
)

echo "time taken:"
echo "$SECONDS seconds"
