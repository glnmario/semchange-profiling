# Grammatical Profiling for Semantic Change Detection

This is the repository for the CoNLL-2021 paper ["Grammatical Profiling for Semantic Change Detection"](https://aclanthology.org/2021.conll-1.33/) by Mario Giulianelli, Andrey Kutuzov, and Lidia Pivovarova.

The `full_profiling_pipeline.sh` script can be used right out of the box.

Run the script as

`./full_profiling_pipeline.sh TARGETS CORPUS0 CORPUS1`

- `TARGETS` is a list of target words, one per line
- `CORPUS0` and `CORPUS1` are your earlier and later corpora,
tagged and parsed into the [CoNLL-U format](https://universaldependencies.org/format.html).
Any tagger and parser of your choice can be used (_UDPipe_ and _Stanza_ come to mind immediately).

The script will process your CONLL-U files and generate morphosyntax-based predictions of graded and binary semantic change for each target word.
Find the aggregated change scores as predicted by our algorithm in the `output` directory.
The script already uses the best hyperparameters from the paper.

Do not forget to first install dependencies:

`pip3 install -r requirements.txt`

In case you are interested, the `output/tsv` directory contains separate predictions from morphological and syntax features.

## More details

- `stanza_process.py` produces parsed CONLL files from raw texts using _Stanza_;
- `collect_ling_stats.py` reads a CONLL file and dumps frequencies for morphological and syntax properties of the target words into JSON files;
- `compare_ling.py` produces TSV files with binary and graded change predictions from two JSON files;
- `merge.py` reads two JSON files (e.g. with morphological and syntax properties) and produces combined predictions.

Use `eval.py` to evaluate the resulting TSVs with regards to gold scores.

The raw profiles (feature counts) from the paper are in the `/features` directory.

