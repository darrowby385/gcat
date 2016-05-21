# gcat.rb
# a simple script to count nucleotides and codons in a gene sequence

path = ARGV.first
file = open(path)

# strip all whitespace and numerals
sequence = file.read.gsub(/\s+/, "")
sequence.gsub!(/[0-9]/, "")

nucleotides = sequence.length
codons = nucleotides / 3

unless nucleotides % 3 != 0
	puts "The sequence (#{path}) contains #{nucleotides} nucleotides, and #{codons} codons."
else
	puts "LOOK OUT! The sequence (#{path}) contains an incomplete triplet!"
	puts "#{nucleotides} nucleotides and #{codons} complete codons were counted."
end
