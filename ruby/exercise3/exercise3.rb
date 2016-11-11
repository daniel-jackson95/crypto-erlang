require_relative '../tess'
require_relative '../vigenere/vigenere'
require_relative '../utility'

def exercise3_ciphertext
	"XXIGYVNVZCTPRWCHJCTASIWEMMCNQPWPOHMEMMDIUWFZRQRWQWKMCZWBILNOTCHIOEMMWLWLYCFUUDMIDYKJNVQYBDFVHWQZUXWHPDGMQUVPXXWHHSFQFYMXTVGNNCXIGNQPDAHIXOZXOAJTSAHCCDMMKYWENVOHMFUAHURCXEWNQZZBOFRRMBWNFLXVCQFPIVSMMLDBVOADIIMWJXJIBXJYLMZFXZPMRNQZZOVNOFQTMUCSJZTLXXFLWMCLSKSVDENVHLDOJLWHWZBIMOYZSPSLCSJQBXXZWUWFTXFQRMVLWQOHJYIBVYAPXBGYNXJLHIPFJAGNQLYACGNEMQBAMPKQBCCPBIGUOZTBTIAEMMMXROSWHZXCHMOHHCJUOLTDZXCHQPWQBNQPGMRWQLRJSLOCNLOSYLXASXBLYCFXJJYWAIACTEKUBEMMRUHTXPOFURNDSQJJNAVUUWXIMSNDNAVUUWQMHGHDJTTGJCWGVCVTHIBHXEMMZJREXPSDNLQWIMUJUIBNNOBQHBQPWPCNOLHMHICSJXWFUZBBVUCYNOVNXYMMOLRYLWBYXQYPSICSJZUCAWXAWAQSNABUVPNVVYADQMSJRNFVHVNLWBCFNEFVMVXODPOPNSNUPOCXJGSNRENAOQAZSOHIQTRIBXVLDSWFUSNUKBNYMMYHXHXWASQPFZHIXZCFWRWZBEVIVTIGSNQTSSWPNSJIFXWPBACNQTXUCLWTSOGUROIIWLHXFVQLRNPIGBNDFBRIFYYWPLNLPNOMCYJFHXJJBQHBJCNLRFRYLOOTNCTCBXDATVHBNXZVQBRYLUSHJYIUOCMDSWKDDDYEVIVT"
end
def exercise3_start
	#Initialize the tess file with words of length 9 or above
	init_tess 9

	#Key is known to have 6 columns
	columns = 6

	#Make assumptions that 'E' will be in the top 3 or 'T' will be in the top character for each column
	letter_frequencies = {'E': 3, 'T': 1}
	#Finds the highest value out of all the assumed characters e.g. This would be 3 as {'E': 3}
	letter_frequencies_max_value = letter_frequencies.max_by{|k,v| v}[1]

	#Get the letter frequencies of multiple columns
	exercise3_ciphertext_split_cols_freq = get_cipher_text_letter_frequency exercise3_ciphertext, columns, letter_frequencies_max_value
	#Create a permutation of all the possible keys from the top letter frequencies
	cipher_shift_permutations = get_key_permutations exercise3_ciphertext_split_cols_freq, letter_frequencies

	#Ruby's way of Cartesian Product
	head, *rest = cipher_shift_permutations
	perm = head.product(*rest)

	#Set the ciphertext to a variable so that it doesn't have to call the function a lot of a times (slight optimization)
	ct = exercise3_ciphertext

	#Create a blank array for all the potential keys
	potential_keys = []

	for i in 0...perm.length do 
		print "#{i}/#{perm.length}\r" if i % 50 == 0

		#Get the key from the permutation of possible keys
		key = key_from_string(perm[i])
		#Find the potential plaintext
		decrypted = vigenere_decrypt ct, key

		#Find the word frequency length (if the word appears in tess it returns it's length - a way of measuring word scores)
		wfl = get_word_freq_length decrypted

		#If the word frequency length is greater than 0 (it's a word in tess27) then add the key to a potential key array
		potential_keys << [key, wfl] if wfl > 0
	end

	#Sort the potential keys by the 'wfl', so higher values appear first
	potential_keys = potential_keys.sort_by{|k,v| v}.reverse

	#Get the plaintext from the first potential key 
	plaintext = vigenere_decrypt exercise3_ciphertext, potential_keys[0][0]

	#Print out the first 30 characters of the plaintext 
	puts "Exercise3 plaintext:"
	puts plaintext[0...30]
end