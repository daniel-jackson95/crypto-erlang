require_relative 'tess'
require_relative 'caesar/caesar'

def letter_analysis(str)
	letters = Hash.new(0)

	for i in 0...str.length do
		letters[str[i]] += 1
	end

	Hash[letters.sort_by{|k,v| v}.reverse]
end

def exercise1_ciphertext
	"GWHKOGWADCGGWPZSHCHVWBYCTFSHIFBWBUHCHVSJWQOFOUSOBUSZGKWTSTSZHOZACGHOGWTGVSVORPSSBVCIBRSRIDHVOHVWZZZWYSOGQCFBSRHVWBUPMHVCGSHCVSFGIDSFTWBSQZSFWQGWBBCQSBHZMOGHVSGZWUVHVORPSSBWBTZWQHSRWHKOGGCASKVOHIBTCFHIBOHSHVOHGVSVORSBQCIBHSFSRHVSGCBGOBRBCHHVSTOHVSFKVCRSGDWHSVWGBOFFCKBSGGKOGTOFZSGGGHOFQVSROBRWFCBSRHVOBHVSMOBRVORHCHVSTIZZHVSUWTHCTQVOFWHMOGGVSOUOWBHVCIUVHCTVSFRIGHMPCCHGGVSOZACGHDWHWSRHVCGSVOPWZWASBHGTCFHVSEIWNNWBUHCKVWQVHVSMVORPSSBGIPXSQHSROBRTSZHVCKVCDSZSGGZWTSKOGTCFHVSWFCKBSFOVGVSGOWRGHWZZGWUVWBUWBDWHMCTVSFGSZTHVSMRWRBHYBCKHVOHWKCFSHVCGSCJSFHVSFCIUVSGHDOFHCTHVSFCORHCGOJSHVSGSDFSHHMCBSGVSPCIUVHTCFASBCHVSMRWRBCHYBCKWHOBRHVSMRWRBHHVWBYHVOHVSQVCGSHVSQCZCIFCAMDFSHHMTFCQYBCVCKQCIZRHVSMWTHVSMVORYBCKBDSFVODGHVSMKCIZRBCHVOJSQOFSRTCFHVSMRCBHQOFSAIQVTCFVWADCCFHVWBUHVSBGVSUFWSJSRTCFHVSPSZCJSRAOBKVCGSQCBJSBHWCBOZGHOBROFRCTXIRUSASBHVORQOIGSRVSF"
end

def cipher_decrypt cipher_text, key
	plain_text = ""

	# A = 65
	# Z = 90

	for i in 0...cipher_text.length do
		new_v = cipher_text[i].ord - key

		new_v += 26 if new_v < 65
		new_v -= 26 if new_v > 90

		plain_text += new_v.chr
	end

	plain_text
end

def word_frequency_count
	# word_freq = tess27wordfrequency

	words = { "YOLO" =>  5, "SWAG" => 3, "THE" => 8 }

	# swag = 2, the = 5, yolo = 3
	cipher_text = "THESWAGTHESWAGYOLOTHEYOLOTHEYOLOTHE"

	puts 'word freq'

	count = 0
	index = 0
	while true
		
	end

end

def start
	init_tess 5

	letter_frequency = letter_analysis exercise1_ciphertext

	common_letter = letter_frequency.to_a.at(0)

	key = get_key(common_letter[0], 'E')

	decrypted_text = caesar_decrypt exercise1_ciphertext, key

	# word_frequency = get_word_freq_length decrypted_text
	# puts word_frequency
	puts decrypted_text
end

def get_key cipher_text, wanted_character
	ct_v = cipher_text.ord - 65
	wc_v = wanted_character.ord - 65

	diff = ct_v - wc_v 

	diff += 26 if diff < 0

	diff + 65
end

start