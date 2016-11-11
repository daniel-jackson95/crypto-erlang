require_relative '../caesar/caesar'
require_relative '../utility'
require_relative '../tess'


## This is the ciphertext for exercise 1
def exercise1_ciphertext
	"GWHKOGWADCGGWPZSHCHVWBYCTFSHIFBWBUHCHVSJWQOFOUSOBUSZGKWTSTSZHOZACGHOGWTGVSVORPSSBVCIBRSRIDHVOHVWZZZWYSOGQCFBSRHVWBUPMHVCGSHCVSFGIDSFTWBSQZSFWQGWBBCQSBHZMOGHVSGZWUVHVORPSSBWBTZWQHSRWHKOGGCASKVOHIBTCFHIBOHSHVOHGVSVORSBQCIBHSFSRHVSGCBGOBRBCHHVSTOHVSFKVCRSGDWHSVWGBOFFCKBSGGKOGTOFZSGGGHOFQVSROBRWFCBSRHVOBHVSMOBRVORHCHVSTIZZHVSUWTHCTQVOFWHMOGGVSOUOWBHVCIUVHCTVSFRIGHMPCCHGGVSOZACGHDWHWSRHVCGSVOPWZWASBHGTCFHVSEIWNNWBUHCKVWQVHVSMVORPSSBGIPXSQHSROBRTSZHVCKVCDSZSGGZWTSKOGTCFHVSWFCKBSFOVGVSGOWRGHWZZGWUVWBUWBDWHMCTVSFGSZTHVSMRWRBHYBCKHVOHWKCFSHVCGSCJSFHVSFCIUVSGHDOFHCTHVSFCORHCGOJSHVSGSDFSHHMCBSGVSPCIUVHTCFASBCHVSMRWRBCHYBCKWHOBRHVSMRWRBHHVWBYHVOHVSQVCGSHVSQCZCIFCAMDFSHHMTFCQYBCVCKQCIZRHVSMWTHVSMVORYBCKBDSFVODGHVSMKCIZRBCHVOJSQOFSRTCFHVSMRCBHQOFSAIQVTCFVWADCCFHVWBUHVSBGVSUFWSJSRTCFHVSPSZCJSRAOBKVCGSQCBJSBHWCBOZGHOBROFRCTXIRUSASBHVORQOIGSRVSF"
end

## Start the plaintext finding process
def exercise1_start
	#Setup TESS with 8 letter words
	init_tess 8

	#A hash of all the potential keys
	potential_keys = []

	26.times do |i|
		#Get the 'plaintext' from the ciphertext and a shift value
		plain_text = caesar_decrypt exercise1_ciphertext, i

		#Get the word frequency length score
		wfl = get_word_freq_length plain_text

		#Add it to the array if it has a word frequency score
		potential_keys << [i, wfl] if wfl > 0
	end

	#Order by the higher values of word frequency score
	potential_keys = potential_keys.sort_by{|k,v| v}.reverse

	#Get the highest potential key and use it to find a plaintext
	potential_plain_text = caesar_decrypt exercise1_ciphertext, potential_keys[0][0]

	#Print out the most likely plaintext
	puts "Exercise1 plaintext:"
	puts potential_plain_text[0...30]
end