# gcat
A simple ruby script for counting nucleotides and codons in a gene sequence.

## features
- minimal processing of the sort required to accurately handle sequences copy-pasted from GenBank
- crude(?) screening to reject files that don't appear to be gene sequences
- diagnostic feedback for rejected files
- incomplete triplet detection and warning
- nucleotide and codon counting, obviously!

## to-do
- improve diagnostic feedback for rejected files (currently spits out every instance of every non-nucleotide character: not so good for large files)
- recognition of nucleic acid variety
