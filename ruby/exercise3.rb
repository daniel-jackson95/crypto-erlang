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
	top_letters_of_e = 3
	top_letters_of_t = 1

	cipher_text_cols = split_string_into_cols cipher_text, columns
	cipher_text_cols_frequency = []
	cipher_permutation_of_shifts = []
	for i in 0...columns do 
		cipher_text_cols_frequency[i] = split_string_by_letter_frequency cipher_text_cols[i], most_frequent_letters
		cipher_permutation_of_shifts[i] = []
	end

	puts cipher_text_cols_frequency.length
	for i in 0...columns do 
		cipher_permutation_of_shifts[i] = []

		col = cipher_text_cols_frequency[i]
		for j in 0...top_letters_of_e do 
			shift_to_e = col[j][0].ord - 'E'.ord
			shift_to_e += 26 if shift_to_e < 0
			cipher_permutation_of_shifts[i][j] = shift_to_e

			# puts "Turn [#{col[j][0]}] into [E] -> Shift by [#{shift_to_e}, #{(shift_to_e+65).chr}]"
		end

		for j in 0...top_letters_of_t do 
			shift_to_t = col[j][0].ord - 'T'.ord
			shift_to_t += 26 if shift_to_t < 0
			cipher_permutation_of_shifts[i][top_letters_of_e + j] = shift_to_t
			# puts "Turn [#{col[j][0]}] into [T] -> Shift by [#{shift_to_t}, #{(shift_to_t+65).chr}]"
		end
	end

	head, *rest = cipher_permutation_of_shifts
	perm = head.product(*rest)

	# puts "head: #{head}"
	# puts "rest: #{rest}"
	# puts "perm: #{perm} [#{perm.length}]"

	# perm5 = perm[0...5]

	# puts "perm5: #{perm5}"
	# puts "perm5[0]: #{perm5[0]}"
	# puts "perm5[0]key: #{key_from_string(perm5[0])}"

	ct = cipher_text

	puts "Decrypting and analysing #{perm.length}"
	for i in 0...perm.length do 
		puts "#{i}/#{perm.length}" if i % 100 == 0

		# puts vigenere_decrypt cipher_text, "FIOAAA"
		decrypted = vigenere_decrypt ct, key_from_string(perm[i])

		wdf = get_word_freq_length decrypted

		puts "wfl: [#{key_from_string(perm[i])}: #{wdf}]" if wdf > 1
	end
	puts 'Decryption complete'



	# puts cipher_permutation_of_shifts

	# puts (cipher_permutation_of_shifts.length * cipher_permutation_of_shifts[0].length).to_s

	# cipher_permutation_of_shifts[0].each do |n1| 
	# 	cipher_permutation_of_shifts[1].each do |n2|
	# 		cipher_permutation_of_shifts[2].each do |n3|
	# 			cipher_permutation_of_shifts[3].each do |n4|
	# 				cipher_permutation_of_shifts[4].each do |n5|
	# 					cipher_permutation_of_shifts[5].each do |n6|
	# 						puts "[#{(n1+65).chr},#{(n2+65).chr},#{(n3+65).chr},#{(n4+65).chr},#{(n5+65).chr},#{(n6+65).chr}]"
	# 					end
	# 				end
	# 			end
	# 		end
	# 	end
	# end
	#[
		#[
			#[0] -> 'N'
			#[1] -> frequency
		#]
		#[
			#[0] -> 'X'
		#]
	#]

	# [A, B]
	# [C, D]
	# [E, F]

	#{ACE, ACF, ADE, ADF, BCE, BCF, BDE, BDF}

	# test

	# puts 'decrypted: '
	puts get_word_freq_length vigenere_decrypt cipher_text, "FIOUJL"
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