#! /bin/bash

# First, we read a CONLL file and dumps frequencies
# for morphological and syntax properties
# of the target words into JSON files

TARGET=${1}  # List of target words, one per line
CONLL0=${2}  # Earlier corpus, processed into CONLL format
CONLL1=${3}  # Later corpus, processed into CONLL format

OUTJSONS=output/jsons
mkdir -p ${OUTJSONS}

OUTSEPARATE=output/tsv
mkdir -p ${OUTSEPARATE}

echo "Extracting grammatical profiles..."
python3 collect_ling_stats.py -i ${CONLL0} -t ${TARGET} -o ${OUTJSONS}/corpus0 &
python3 collect_ling_stats.py -i ${CONLL1} -t ${TARGET} -o ${OUTJSONS}/corpus1
echo "Done extracting grammatical profiles"

# Now, we produce separate change predictions based on morphological and syntactic profiles

echo "Producing morphological predictions..."
python3 compare_ling.py --input1 ${OUTJSONS}/corpus0_morph.json --input2 ${OUTJSONS}/corpus1_morph.json --output ${OUTSEPARATE}/morph --filtering 5 --separation 2step

echo "Producing syntactic predictions..."
python3 compare_ling.py --input1 ${OUTJSONS}/corpus0_synt.json --input2 ${OUTJSONS}/corpus1_synt.json --output ${OUTSEPARATE}/synt --filtering 5 --separation yes
echo "Separate morphological and syntactic predictions produced"

# Finally, we merge them into averaged predictions 
# (for binary and graded change detection tasks)

for task in binary graded
do
    echo "Producing averaged predictions for ${task}..."
    python3 merge.py -i1 ${OUTSEPARATE}/morph_${task}.tsv -i2 ${OUTSEPARATE}/synt_${task}.tsv > output/${task}.tsv
done

#echo "Averaged predictions produced and saved in the outputs/ directory"
