#! /bin/bash

LANG=russian
THR=${1}

for feat in morph
do
    python3 compare_ling.py --input1 features/${LANG}/corpus1_${feat}.json --input2 features/${LANG}/corpus2_${feat}.json -s 2step -af1 data/features/russian/corpus1_synt.json -af2 data/features/russian/corpus2_synt.json -f 5 --output results/${LANG}1_${feat}_${THR}
    python3 compare_ling.py --input1 features/${LANG}/corpus2_${feat}.json --input2 features/${LANG}/corpus3_${feat}.json -s 2step -af1 data/features/russian/corpus2_synt.json -af2 data/features/russian/corpus3_synt.json -f 5 --output results/${LANG}2_${feat}_${THR}
    python3 compare_ling.py --input1 features/${LANG}/corpus3_${feat}.json --input2 features/${LANG}/corpus1_${feat}.json -s 2step -af1 data/features/russian/corpus3_synt.json -af2 data/features/russian/corpus1_synt.json -f 5 --output results/${LANG}3_${feat}_${THR}
done

