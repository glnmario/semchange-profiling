# Grammatical Profiling for Semantic Change Detection

This is the repository for the CoNLL-2021 paper "Grammatical Profiling for Semantic Change Detection" by Mario Giulianelli, Andrey Kutuzov, and Lidia Pivovarova.

- `stanza_process.py` produces parsed CONLL files from raw texts;
- `collect_ling_stats.py` reads a CONLL file and dumps frequencies for morphological and syntax properties of the target words into JSON files;
- `compare_ling.py` produces TSV files with binary and graded change predictions from two JSON files;
- `merge.py` reads two JSON files (e.g. with morphological and syntax properties) and produces averaged predictions.

Use `eval.py` to evaluate the resulting TSVs with regards to gold scores (in the `test_data_truth` subdirectory).

The repository will be populated with more instructions and results soon.

