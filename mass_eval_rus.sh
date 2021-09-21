#! /bin/bash

LANG=russian
THR=${1}

for nr in 1 2 3
do
echo "Pair" ${nr}

    for feat in morph synt
    do
	echo "Evaluating ${feat}"
	python3 ../eval.py results/${LANG}${nr}_${feat}_${THR}_graded.tsv results/${LANG}${nr}_${feat}_${THR}_graded.tsv ../../test_data_truth/task2/${LANG}${nr}.txt  ../../test_data_truth/task2/${LANG}${nr}.txt
    done

    echo "Evaluating averaged"
    python3 ../eval.py results/${LANG}${nr}_graded_${THR}.tsv results/${LANG}${nr}_graded_${THR}.tsv ../../test_data_truth/task2/${LANG}${nr}.txt ../../test_data_truth/task2/${LANG}${nr}.txt

done