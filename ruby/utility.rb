def char_to_int char
	char.ord - 65
end
def int_to_char char_value
	(char_value + 65).chr
end

def letter_analysis(str)
	letters = Hash.new(0)

	for i in 0...str.length do
		letters[str[i]] += 1
	end

	letters.sort_by{|k,v| v}.reverse
end
def key_from_string key_str 
	str = ""
	for i in 0...key_str.length do 
		str += (key_str[i].ord + 65).chr
	end
	str
end

def get_subst_from_potential_word potential_word, cipher_word, existing_subst
	subst = existing_subst.clone
	for i in 0...cipher_word.length do 
		letter = cipher_word[i]
		if subst.key?letter
			if subst[cipher_word[i]] != potential_word[i]
				return {}
			end
		end

		subst[cipher_word[i]] = potential_word[i]
	end
	subst
end

def get_cipher_text_letter_frequency cipher_text, columns, most_frequent_letters
	split_cols = split_string_into_cols cipher_text, columns
	cipher_text_split_cols_freq = []
	cipher_shift_permutations = []
	for i in 0...columns do 
		cipher_text_split_cols_freq[i] = split_string_by_letter_frequency split_cols[i], most_frequent_letters
	end
	cipher_text_split_cols_freq
end

def get_key_permutations split_text_letter_freq, letter_frequencies
	cipher_shift_permutations = []
	for i in 0...split_text_letter_freq.length do 
		cipher_shift_permutations[i] = []

		col = split_text_letter_freq[i]

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
	cipher_shift_permutations
end

def split_string_by_letter_frequency str, cols
	letter_freqs = str.chars.group_by(&:chr).map { |k, v| [k, v.size] }.sort_by {|k,v| v}.reverse

	freqs = []
	for i in 0...cols do 
		freqs[i] = letter_freqs[i]
	end
	freqs
end
def split_string_into_cols str, cols
	str_cols = Array.new(cols)

	for i in 0...cols do
		str_cols[i] = ""
	end

	for i in 0...str.length do 
		str_cols[ i % cols ] += str[i] 
	end

	str_cols
end
