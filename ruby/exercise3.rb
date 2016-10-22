require_relative 'tess'
require_relative 'vigenere/vigenere'

def cipher_text
	"XXIGYVNVZCTPRWCHJCTASIWEMMCNQPWPOHMEMMDIUWFZRQRWQWKMCZWBILNOTCHIOEMMWLWLYCFUUDMIDYKJNVQYBDFVHWQZUXWHPDGMQUVPXXWHHSFQFYMXTVGNNCXIGNQPDAHIXOZXOAJTSAHCCDMMKYWENVOHMFUAHURCXEWNQZZBOFRRMBWNFLXVCQFPIVSMMLDBVOADIIMWJXJIBXJYLMZFXZPMRNQZZOVNOFQTMUCSJZTLXXFLWMCLSKSVDENVHLDOJLWHWZBIMOYZSPSLCSJQBXXZWUWFTXFQRMVLWQOHJYIBVYAPXBGYNXJLHIPFJAGNQLYACGNEMQBAMPKQBCCPBIGUOZTBTIAEMMMXROSWHZXCHMOHHCJUOLTDZXCHQPWQBNQPGMRWQLRJSLOCNLOSYLXASXBLYCFXJJYWAIACTEKUBEMMRUHTXPOFURNDSQJJNAVUUWXIMSNDNAVUUWQMHGHDJTTGJCWGVCVTHIBHXEMMZJREXPSDNLQWIMUJUIBNNOBQHBQPWPCNOLHMHICSJXWFUZBBVUCYNOVNXYMMOLRYLWBYXQYPSICSJZUCAWXAWAQSNABUVPNVVYADQMSJRNFVHVNLWBCFNEFVMVXODPOPNSNUPOCXJGSNRENAOQAZSOHIQTRIBXVLDSWFUSNUKBNYMMYHXHXWASQPFZHIXZCFWRWZBEVIVTIGSNQTSSWPNSJIFXWPBACNQTXUCLWTSOGUROIIWLHXFVQLRNPIGBNDFBRIFYYWPLNLPNOMCYJFHXJJBQHBJCNLRFRYLOOTNCTCBXDATVHBNXZVQBRYLUSHJYIUOCMDSWKDDDYEVIVT"
end
def key_from_string key_str 
	str = ""
	for i in 0...key_str.length do 
		str += (key_str[i].ord + 65).chr
	end
	str
end
def start
	init_tess 9
	#plain_text = vigenere_decrypt cipher_text, [[FIND THE KEY]]

	columns = 6
	most_frequent_letters = 3 #5 - make it the max of [e] and [t]
	top_letters_of_e = 1 #3
	top_letters_of_t = 1

	letter_frequencies = {'E': 3, 'T': 1}
	letter_frequencies_max_value = 3


	# Get most common letters
	# Permute the letters (E: 3, T:1 = 4) [4 ^ 6 = 4096]

	cipher_text_split_cols = split_string_into_cols cipher_text, columns
	cipher_text_split_cols_freq = []
	cipher_shift_permutations = []
	for i in 0...columns do 
		cipher_text_split_cols_freq[i] = split_string_by_letter_frequency cipher_text_split_cols[i], letter_frequencies_max_value
	end

	for i in 0...columns do 
		cipher_shift_permutations[i] = []
		#[0] = [T, E, F, G]
		#[1] = [E, O, A, B]

		col = cipher_text_split_cols_freq[i]

		puts "COL [#{col}]"

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

	# for j in 0...cipher_shift_permutations.length do 
	# 	puts "CSP [#{j}] = #{cipher_shift_permutations[j]}"
	# end


	head, *rest = cipher_shift_permutations
	perm = head.product(*rest)

	ct = cipher_text

	potential_keys = []

	for i in 0...perm.length do 
		puts "#{i}/#{perm.length}" if i % 100 == 0

		key = key_from_string(perm[i])
		decrypted = vigenere_decrypt ct, key

		wdf = get_word_freq_length decrypted

		

		if wdf > 1
			puts "wfl: [#{key}: #{wdf}]" 

			potential_keys << [key, wdf]
		end
	end

	puts "Potential keys: "
	for j in 0...potential_keys.length do 
		puts "#{potential_keys[j]}"
	end
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

def test
	test_str = "ACIOWKPOAKLSUAAENDDODODODODODUDRWHDBDADDKWDWWENJASKBXCJKZXBKJDBSKJFSKASKLDASNK"
	cols = 2

	test_str_cols = split_string_into_cols test_str, cols
	puts test_str_cols
	test_str_cols_freq = split_string_by_letter_frequency test_str_cols[0], 3
	for i in 0...test_str_cols_freq.length do 
		puts test_str_cols_freq[i][0] + ': '+test_str_cols_freq[i][1].to_s
	end

end

start