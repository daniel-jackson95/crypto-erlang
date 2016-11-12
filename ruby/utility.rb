#This function provides letter analysis on a string
def letter_analysis(str)
	letters = Hash.new(0)

	#Tally up the count of letters in a string
	for i in 0...str.length do
		letters[str[i]] += 1
	end

	#Return the array sorted by largest value first 
	letters.sort_by{|k,v| v}.reverse
end

#This function gets a key from a string
def key_from_string key_str 
	#Start with an empty string
	str = ""
	#For each element in the key string
	for i in 0...key_str.length do 
		str += (key_str[i].ord + 65).chr
	end
	str
end

#Returns a new substituion alphabet based on an existing one but only if a potential word matching the cipher_word 
def get_subst_from_potential_word potential_word, cipher_word, existing_subst
	subst = existing_subst.clone
	for i in 0...cipher_word.length do 
		letter = cipher_word[i]
		if subst.key?letter
			#If the substitution alphabet key for the cipher_word is different than the potential word, it is a clash and should be dismissed		
			if subst[cipher_word[i]] != potential_word[i]
				return {}
			end
		end

		#Add in a new substitution key and value
		subst[cipher_word[i]] = potential_word[i]
	end
	subst
end

# This gets the most common letter frequency for a set amount of columns in a ciphertext
def get_cipher_text_letter_frequency cipher_text, columns, most_frequent_letters
	#Get the split columns
	split_cols = split_string_into_cols cipher_text, columns

	#Setup frequency and permutation arrays
	cipher_text_split_cols_freq = []
	cipher_shift_permutations = []
	for i in 0...columns do 
		cipher_text_split_cols_freq[i] = split_string_by_letter_frequency split_cols[i], most_frequent_letters
	end
	cipher_text_split_cols_freq
end

#Return a permutation of letter frequency converted split text
def get_key_permutations split_text_letter_freq, letter_frequencies
	cipher_shift_permutations = []
	#For each letter frequency
	for i in 0...split_text_letter_freq.length do 
		#Create a new array inside this array
		cipher_shift_permutations[i] = []

		#Get the column of data by the letter frequency
		col = split_text_letter_freq[i]

		#Start the shift index based on each letter frequency
		shift_index = 0
		letter_frequencies.each do |k,v|
			for j in 0...v do 
				shift_value = col[j][0].ord - k.to_s.ord
				shift_value += 26 if shift_value < 0
				cipher_shift_permutations[i][shift_index] = shift_value

				shift_index += 1
			end
		end
	end

	#Return a list of all permuted keys
	cipher_shift_permutations
end

# This finds the most frequent letters in a string 
def split_string_by_letter_frequency str, cols
	#Get the letter frequency of a string
	letter_freqs = str.chars.group_by(&:chr).map { |k, v| [k, v.size] }.sort_by {|k,v| v}.reverse

	#For each column set the letter frequencies
	freqs = []
	for i in 0...cols do 
		freqs[i] = letter_freqs[i]
	end
	freqs
end

# Splits a string into a set of columns 
def split_string_into_cols str, cols
	str_cols = Array.new(cols)

	#Setup the columns
	for i in 0...cols do
		str_cols[i] = ""
	end

	#Append the string data into each column
	for i in 0...str.length do 
		str_cols[ i % cols ] += str[i] 
	end

	str_cols
end
