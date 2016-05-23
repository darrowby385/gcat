# gcat.rb
# a simple ruby script for counting nucleotides and codons in a gene sequence

# Obtain path to file from user
if File.exists?(ARGV.first.to_s)
	path = ARGV.first
else
	if ARGV.first != nil
		print "File not found. "
	end
	until File.exists?(path.to_s)
		print "Enter path to file: "
		path = STDIN.gets.chomp
		unless File.exists?(path.to_s)
			print "File not found. "
		end
	end
end

# open file
gene = open(path).read

# strip everything other than nucleotide symbols (always returns gene-like value)
fullstrip = gene.gsub(/[^GCATU]/i, "")
# strip only digits and whitespace (only returns gene-like value if there isn't other crap)
quickstrip = gene.gsub(/[0-9\s]/, "")

# compare quickstrip with fullstrip to determine if the file is a gene sequence or something else
if fullstrip != quickstrip
	contaminant = quickstrip.gsub(/[gcatu]/i, "")
	puts "Sorry, that file doesn't look like a gene sequence.\nThe following contaminant characters were found:\n#{contaminant}"
	exit
else
	# count nucleotides and codons
	nucleotides = quickstrip.length
	codons = nucleotides / 3
end

# print results unless incomplete triplet is found
unless nucleotides % 3 != 0
	puts "The sequence (#{path}) contains #{nucleotides} nucleotides, and #{codons} codons."
else
	# print results alongside warning re: incomplete triplet
	puts "LOOK OUT! The sequence (#{path}) contains an incomplete triplet!"
	puts "#{nucleotides} nucleotides and #{codons} complete codons were counted."
end
