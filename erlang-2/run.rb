

exercise = ARGV[0].to_i

if exercise > 0 && exercise < 8

	puts "Running exercise #{exercise}"

	exec("erlc exercise#{exercise}.erl && erl -noshell -s exercise#{exercise} start -s init stop")
end



# puts "Chi squared:"


# (0...26).each do |i|
# 	char = (65 + i).chr
# 	puts "#{i} - #{char} - #{character_frequencies[i]}"
# end

# a_times = cipher_text.scan(/a/).length
# puts "A appears #{a_times} times"

# chi_squared_value = 0

# ('a'..'z').each do |i|
# 	key = i
# 	char_frequency = cipher_text.scan(/#{i.chr}/).length

# 	expected = cipher_length * character_frequencies[(i.ord - 97)]

# 	freq_minus_expected = char_frequency - expected

# 	chi_squared = (freq_minus_expected * freq_minus_expected) / expected

# 	chi_squared_value += chi_squared

# 	puts "Key [#{key}] [#{char_frequency}] [#{expected}] chi-squared[#{chi_squared}]"

# end


# puts "For key [0] chi-squared: [#{chi_squared_value}]"

def chi_squared plaintext
	chi_squared_value = 0
	plaintext_length = plaintext.length

	# puts "chi squared [#{plaintext}]"

	('A'..'Z').each do |i|
		char_frequency = plaintext.scan(/#{i.chr}/).length


		#Expected amount of letters
		expected = plaintext_length * $character_frequencies[(i.ord - 65)]

		#Frequency of letters minus the expected
		freq_minus_expected = char_frequency - expected

		#Chi squared value for [i as char] [so [i=0, char='a']
		chi_squared = (freq_minus_expected * freq_minus_expected) / expected

		#Add the value
		chi_squared_value += chi_squared

		puts "[#{i.chr}] [#{chi_squared_value}]"
	end

	chi_squared_value
end


def caesar_cipher text, key_value, is_encryption
	#Setup the new cipher/plain text
	final_text = ""

	for i in 0...text.length do 
		text_value = text[i].ord - 65 #Get the letter ASCII value minus 65 to convert to [0-25]
		new_value = text_value + key_value if is_encryption #If it's encryption add the value
		new_value = text_value - key_value if !is_encryption #If it's decryption minus the value
		new_value += 26 if new_value < 0 #If it was decryption we need to add a 26 if it's less
		new_value -= 26 if new_value > 25 #If it was encryption we might need to minus 26 if it's more
		final_text += (new_value+65).chr #Add the new value to the cipher/plain text by adding 'A' back to the [0-25] value
	end

	#Return the cipher/plain text
	final_text
end
def caesar_encrypt plaintext, key
	caesar_cipher plaintext, key, true
end
def caesar_decrypt ciphertext, key
	caesar_cipher ciphertext, key, false
end


# cipher_text = "aoljhlzhyjpwolypzvulvmaollhysplzaruvduhukzptwslzajpwolyzpapzhafwlvmzbizapabapvujpwolypudopjolhjoslaalypuaolwshpualeapzzopmalkhjlyahpuubtilyvmwshjlzkvduaolhswohila"
cipher_text = "GWHKOGWADCGGWPZSHCHVWBYCTFSHIFBWBUHCHVSJWQOFOUSOBUSZGKWTSTSZHOZACGHOGWTGVSVORPSSBVCIBRSRIDHVOHVWZZZWYSOGQCFBSRHVWBUPMHVCGSHCVSFGIDSFTWBSQZSFWQGWBBCQSBHZMOGHVSGZWUVHVORPSSBWBTZWQHSRWHKOGGCASKVOHIBTCFHIBOHSHVOHGVSVORSBQCIBHSFSRHVSGCBGOBRBCHHVSTOHVSFKVCRSGDWHSVWGBOFFCKBSGGKOGTOFZSGGGHOFQVSROBRWFCBSRHVOBHVSMOBRVORHCHVSTIZZHVSUWTHCTQVOFWHMOGGVSOUOWBHVCIUVHCTVSFRIGHMPCCHGGVSOZACGHDWHWSRHVCGSVOPWZWASBHGTCFHVSEIWNNWBUHCKVWQVHVSMVORPSSBGIPXSQHSROBRTSZHVCKVCDSZSGGZWTSKOGTCFHVSWFCKBSFOVGVSGOWRGHWZZGWUVWBUWBDWHMCTVSFGSZTHVSMRWRBHYBCKHVOHWKCFSHVCGSCJSFHVSFCIUVSGHDOFHCTHVSFCORHCGOJSHVSGSDFSHHMCBSGVSPCIUVHTCFASBCHVSMRWRBCHYBCKWHOBRHVSMRWRBHHVWBYHVOHVSQVCGSHVSQCZCIFCAMDFSHHMTFCQYBCVCKQCIZRHVSMWTHVSMVORYBCKBDSFVODGHVSMKCIZRBCHVOJSQOFSRTCFHVSMRCBHQOFSAIQVTCFVWADCCFHVWBUHVSBGVSUFWSJSRTCFHVSPSZCJSRAOBKVCGSQCBJSBHWCBOZGHOBROFRCTXIRUSASBHVORQOIGSRVSF"
cipher_length = cipher_text.length
$character_frequencies = [0.08167,0.01492,0.02782,0.04253,0.12702,0.02228,0.02015,0.06094,0.06966,0.00153,0.00772,0.04025,0.02406,0.06749,0.07507,0.01929,0.00095,0.05987,0.06327,0.09056,0.02758,0.00978,0.02360,0.00150,0.01974,0.00074]
# $character_frequencies = [0.082,0.015,0.028,0.043,0.127,0.022,0.020,0.061,0.070,0.002,0.008,0.040,0.024,0.067,0.075,0.019,0.001,0.060,0.063,0.091,0.0278,0.010,0.024,0.002,0.020,0.001]

puts "Chi squared results:"

chi_squared_results = []
(0...26).each do |i|
	plain_text = caesar_decrypt(cipher_text, i)

	# puts plain_text

	chi_squared_result = chi_squared plain_text
	chi_squared_results[i] = chi_squared_result

	puts "Key [#{i}] chi-squared: [#{chi_squared_results[i]}] - #{plain_text[0...30]}"
end









