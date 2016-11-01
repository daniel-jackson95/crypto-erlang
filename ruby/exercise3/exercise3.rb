require_relative '../tess'
require_relative '../vigenere/vigenere'
require_relative '../utility'

def exercise3_ciphertext
	"XXIGYVNVZCTPRWCHJCTASIWEMMCNQPWPOHMEMMDIUWFZRQRWQWKMCZWBILNOTCHIOEMMWLWLYCFUUDMIDYKJNVQYBDFVHWQZUXWHPDGMQUVPXXWHHSFQFYMXTVGNNCXIGNQPDAHIXOZXOAJTSAHCCDMMKYWENVOHMFUAHURCXEWNQZZBOFRRMBWNFLXVCQFPIVSMMLDBVOADIIMWJXJIBXJYLMZFXZPMRNQZZOVNOFQTMUCSJZTLXXFLWMCLSKSVDENVHLDOJLWHWZBIMOYZSPSLCSJQBXXZWUWFTXFQRMVLWQOHJYIBVYAPXBGYNXJLHIPFJAGNQLYACGNEMQBAMPKQBCCPBIGUOZTBTIAEMMMXROSWHZXCHMOHHCJUOLTDZXCHQPWQBNQPGMRWQLRJSLOCNLOSYLXASXBLYCFXJJYWAIACTEKUBEMMRUHTXPOFURNDSQJJNAVUUWXIMSNDNAVUUWQMHGHDJTTGJCWGVCVTHIBHXEMMZJREXPSDNLQWIMUJUIBNNOBQHBQPWPCNOLHMHICSJXWFUZBBVUCYNOVNXYMMOLRYLWBYXQYPSICSJZUCAWXAWAQSNABUVPNVVYADQMSJRNFVHVNLWBCFNEFVMVXODPOPNSNUPOCXJGSNRENAOQAZSOHIQTRIBXVLDSWFUSNUKBNYMMYHXHXWASQPFZHIXZCFWRWZBEVIVTIGSNQTSSWPNSJIFXWPBACNQTXUCLWTSOGUROIIWLHXFVQLRNPIGBNDFBRIFYYWPLNLPNOMCYJFHXJJBQHBJCNLRFRYLOOTNCTCBXDATVHBNXZVQBRYLUSHJYIUOCMDSWKDDDYEVIVT"
end
def exercise3_start
	init_tess 9

	columns = 6
	letter_frequencies = {'E': 3, 'T': 1}
	letter_frequencies_max_value = letter_frequencies.max_by{|k,v| v}[1]

	exercise3_ciphertext_split_cols_freq = get_cipher_text_letter_frequency exercise3_ciphertext, columns, letter_frequencies_max_value
	cipher_shift_permutations = get_key_permutations exercise3_ciphertext_split_cols_freq, letter_frequencies

	head, *rest = cipher_shift_permutations
	perm = head.product(*rest)

	ct = exercise3_ciphertext

	potential_keys = []

	for i in 0...perm.length do 
		print "#{i}/#{perm.length}\r" if i % 50 == 0

		key = key_from_string(perm[i])
		decrypted = vigenere_decrypt ct, key

		wfl = get_word_freq_length decrypted

		potential_keys << [key, wfl] if wfl > 0
	end
	# puts "#{perm.length}/#{perm.length}"

	potential_keys = potential_keys.sort_by{|k,v| v}.reverse

	# puts "Potential keys: "
	# for j in 0...potential_keys.length do 
	# 	puts "[#{potential_keys[j][0]}] word_freq_score: #{potential_keys[j][1]}"
	# end

	plaintext = vigenere_decrypt exercise3_ciphertext, potential_keys[0][0]
	puts plaintext
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