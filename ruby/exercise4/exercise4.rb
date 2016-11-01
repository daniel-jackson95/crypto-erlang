require_relative '../tess'
require_relative '../vigenere/vigenere'
require_relative '../utility'

def exercise4_ciphertext
	"VSAZYFTSHFKPROTOMGDPROTNZAUPXPHCDGBPJVDODLZXEEIQBULPJJLALGVKJBJPGWPOWVBHRGJIFTUGDHAPYFJDZLHQCFDCSZHIDPIPDNLOPCEZXLOLLHXPRZLEREWKMWHTRZJDDGUIPFNAQUPPVUXWSLLPJUEKJSAQYJIPHELTRTQBSWYARSAWMVPQNBIPGWUTYFDKTLPKKIUSNGKPKIQPRZLPVFCACDLXJUIKKAAXIZIDDCUBNIESSGOFKUEWGSPOJCHAZVAEKIQPLGTBEUEBDNLKZOWSGWUQYFBEFZAXEEJDDVHOBOUORSYBJPURDFSVSBBWMULAKIQPSZLZFOIPQSPKKPVZZQHKUUXARMZMVOIANXUFXIJJDMAORMYVDWHZYPJDDJSBRWYJFSIPFMKPDELKKBBHHTLOKZYPHKAEVOJDZLAEVQBEFZALWCUEMYHIZWUXDUVJVTQPSWURRUUZSGPQJMUWRLWLJTYXKWKFDFDOHGUPJIUDZVULWFQNNXAEVTXWCGDPYFHONDLFUFQODWTBUUEXDLVPYVDIZFRFEEENQSAEVSJDZLJLCEQYBJLQZPDYZDSBUUXAVGYIUXXEBZZLKFHNHTSBZOJDDEHPJJIONMUCFSCECSIIVFLAMHPQZBRHDAUFKTKJHLZLEUXARWSLEFBUGASIJBDZCSSBJIUNPMPBJDUJSYSFUFMWRGMXGJUYDOPQYUXADDLJVOJOGWTLMFTEMZLOWMUTTGBPROTOSWHIKIOBHYBOVCUYZELXEJDPDYYXCQQNSGMQYFIYDFLXKUYIDKOBIXXELKPZRMVWMUFTFVBZHFABETYBXFHQLSQH"
end

def exercise4_start
	init_tess 9

	columns = 8 #Assume 8 ### Need a better solution for checking words
	letter_frequencies = {'E': 3}
	letter_frequencies_max_freq = letter_frequencies.max_by{|k,v| v}[1]

	cipher_text_split_cols_freq = get_cipher_text_letter_frequency exercise4_ciphertext, columns, letter_frequencies_max_freq
	cipher_shift_permutations = get_key_permutations cipher_text_split_cols_freq, letter_frequencies

	head, *rest = cipher_shift_permutations
	perm = head.product(*rest)

	potential_keys = []

	for i in 0...perm.length do 
		print "#{i}/#{perm.length}\r" if i % 1 == 0

		key = key_from_string(perm[i])
		decrypted = vigenere_decrypt exercise4_ciphertext, key

		wfl = get_word_freq_length decrypted

		potential_keys << [key, wfl] if wfl > 0
	end

	potential_keys = potential_keys.sort_by{|k,v| v}.reverse

	puts "Potential keys: "
	for j in 0...potential_keys.length do 
		puts "[#{potential_keys[j][0]}] word_freq_score: #{potential_keys[j][1]}"
	end

	if potential_keys.length > 0
		puts "Trying key [#{potential_keys[0][0]}]:"
		puts vigenere_decrypt exercise4_ciphertext, potential_keys[0][0]
	end
end