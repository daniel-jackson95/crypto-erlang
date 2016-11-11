require_relative '../tess'
require_relative '../vigenere/vigenere'
require_relative '../utility'

def exercise4_ciphertext
	"VSAZYFTSHFKPROTOMGDPROTNZAUPXPHCDGBPJVDODLZXEEIQBULPJJLALGVKJBJPGWPOWVBHRGJIFTUGDHAPYFJDZLHQCFDCSZHIDPIPDNLOPCEZXLOLLHXPRZLEREWKMWHTRZJDDGUIPFNAQUPPVUXWSLLPJUEKJSAQYJIPHELTRTQBSWYARSAWMVPQNBIPGWUTYFDKTLPKKIUSNGKPKIQPRZLPVFCACDLXJUIKKAAXIZIDDCUBNIESSGOFKUEWGSPOJCHAZVAEKIQPLGTBEUEBDNLKZOWSGWUQYFBEFZAXEEJDDVHOBOUORSYBJPURDFSVSBBWMULAKIQPSZLZFOIPQSPKKPVZZQHKUUXARMZMVOIANXUFXIJJDMAORMYVDWHZYPJDDJSBRWYJFSIPFMKPDELKKBBHHTLOKZYPHKAEVOJDZLAEVQBEFZALWCUEMYHIZWUXDUVJVTQPSWURRUUZSGPQJMUWRLWLJTYXKWKFDFDOHGUPJIUDZVULWFQNNXAEVTXWCGDPYFHONDLFUFQODWTBUUEXDLVPYVDIZFRFEEENQSAEVSJDZLJLCEQYBJLQZPDYZDSBUUXAVGYIUXXEBZZLKFHNHTSBZOJDDEHPJJIONMUCFSCECSIIVFLAMHPQZBRHDAUFKTKJHLZLEUXARWSLEFBUGASIJBDZCSSBJIUNPMPBJDUJSYSFUFMWRGMXGJUYDOPQYUXADDLJVOJOGWTLMFTEMZLOWMUTTGBPROTOSWHIKIOBHYBOVCUYZELXEJDPDYYXCQQNSGMQYFIYDFLXKUYIDKOBIXXELKPZRMVWMUFTFVBZHFABETYBXFHQLSQH"
end

def exercise4_start
	#Initialize tess file with words of length 9 or above
	init_tess 9

	#Found by manually analysing the text and assuming that because there are words which are spaced 8n distances away that 8 is the key length
	columns = 8 
	
	#Choose 'E' as in the top 3 characters for each column
	letter_frequencies = {'E': 3}
	letter_frequencies_max_freq = letter_frequencies.max_by{|k,v| v}[1]

	#This gets the letter frequency in a set amount of columns
	cipher_text_split_cols_freq = get_cipher_text_letter_frequency exercise4_ciphertext, columns, letter_frequencies_max_freq
	#Finds the permutation of keys that translate to 'E' in the ciphertext
	cipher_shift_permutations = get_key_permutations cipher_text_split_cols_freq, letter_frequencies

	#Cartesian product Ruby style
	head, *rest = cipher_shift_permutations
	perm = head.product(*rest)

	#Set the ciphertext to a variable so that it doesn't have to call the function a lot of a times (slight optimization)
	ct = exercise4_ciphertext

	#Create a blank array for all the potential keys
	potential_keys = []

	for i in 0...perm.length do 
		#I do this... because ruby is apparently really slow with strings and it takes forever
		# so this is to show progress that the program is still running
		print "#{i}/#{perm.length}\r" if i % 100 == 0

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
	plaintext = vigenere_decrypt ct, potential_keys[0][0]

	#Print out the first 30 characters of the plaintext 
	puts "Exercise4 plaintext:"
	puts plaintext[0...30]
end