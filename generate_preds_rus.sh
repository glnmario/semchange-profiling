#! /bin/bash

LANG=russian
THR=${1}

for feat in morph synt
do
    python3 compare_ling.py --input1 ../../data/features/${LANG}/corpus1_${feat}.json --input2 ../../data/features/${LANG}/corpus2_${feat}.json --output results/${LANG}1_${feat}_${THR} --threshold ${THR} --separation yes
    python3 compare_ling.py --input1 ../../data/features/${LANG}/corpus2_${feat}.json --input2 ../../data/features/${LANG}/corpus3_${feat}.json --output results/${LANG}2_${feat}_${THR} --threshold ${THR} --separation yes
    python3 compare_ling.py --input1 ../../data/features/${LANG}/corpus3_${feat}.json --input2 ../../data/features/${LANG}/corpus1_${feat}.json --output results/${LANG}3_${feat}_${THR} --threshold ${THR} --separation yes
done

for n in 1 2 3
do
    python3 merge.py -i1 results/${LANG}${n}_morph_${THR}_graded.tsv -i2 results/${LANG}${n}_synt_${THR}_graded.tsv > results/${LANG}${n}_graded_${THR}.tsv
done
