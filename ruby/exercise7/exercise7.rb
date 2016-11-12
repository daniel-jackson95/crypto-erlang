require_relative '../tess'
require_relative '../utility'
require_relative '../substitution/substitution'
require 'colorize'
 
def cipher_text
	"SBD|UQN|FGRD|UD|GUD|OKKQ|DUIN|FGHRPG|FGK|NUAM|LRSFUIQD|HW|FGKIS|OHQQKFD|WVUMMKN|DAUSFVC|IQFH|FGKIS|WULKD|UQN|FGKIS|ESUMMKSD|LVRQP|UOHRF|FGKA|FH|EKUSIDHAKQKDD|FGKC|VIYKN|UVV|FGID|UWFKSQHHQ|IQ|AKAHSIKD|HW|PSKKQ|DRQQC|SHAUQFIL|FUVOHFGUCD|CHR|LUQ|DKK|U|PVKUA|HW|U|GIVV|EIFGIQ|U|WKE|AIVKD|H|WSHHA|YUVVKC|WSHA|GKSK|EGKQ|FID|WIQK|DUIN|AUSIUQ|UG|LUQ|CHR|DUIN|FKDD|UEUBK|FH|FGK|QKE|YUVRK|HW|FGID|VHLUVIFC|DH|FGK|FEH|WHSLKD|EKSK|UF|EHSB|GKSK|UD|KYKSCEGKSK|FGK|IQGKSKQF|EIVV|FH|KQZHC|UQN|FGK|LISLRADFUQFIUV|EIVV|UPUIQDF|KQZHCAKQF|AUSIUQD|EIVV|GUN|U|AKFGHN|HW|UDDIDFIQP|IFDKVW|OC|FUBIQP|WSHA|GKS|MHLBKF|UD|FGK|UWFKSQHHQ|EHSK|HQ|U|MIQF|OHFFVK|LHSBKN|EIFG|EGIFK|SUP|WSHA|EGILG|DGK|IQYIFKN|FKDD|FH|NSIQB|FKDDD|RQUDDIDFKN|MHEKS|HW|NSKUAIQP|GHEKYKS|OKIQP|KQHRPG|WHS|GKS|DROVIAUFIHQ|UF|MSKDKQF|DGK|NKLVIQKN|KXLKMF|FGK|AKSKDF|DIM|UQN|FGKQ|AUSIUQ|FHHB|U|MRVV|W"
end

$found_word = false
$ct
$minimum_substitution_alphabet_length

def exercise7b_start
	#Initialise Tess system
	init_tess 7
	
	#Save the ciphertext to a variable instead of calling it everytime
	$ct = cipher_text

	###DEFAULTS
	#The lower the minimum word size, the deeper the search can go and it can take much longer time
	word_length_minimum = 5
	#Can finish early if there are enough letters in the substitution alphabet (Used for some ciphertexts which don't have all the characters)
	$minimum_substitution_alphabet_length = 23


	#Find the letter frequency of the whole ciphertext
	letter_frequency = letter_analysis $ct
	#Assume that most frequent is a space, and that second frequent is an E. This solver fails if either is false...
	initial_substitution_alphabet = {letter_frequency[0][0] => "|", letter_frequency[1][0] => "E"}

	#Set a global splitter item 
	#Word splitter is the space character which is used to seperate words in my ciphertext (Also the first item in the letter analysis)
	$tess_splitter = letter_frequency[0][0]


	#Split the ciphertext instead words to be used for analysis
	ct_split = $ct.split $tess_splitter
	ct_split_words = []
	ct_split.each do |ct_word|
		word_length = ct_word.length

		#Skip the word if it's not of the minimum length we want to check for
		next if word_length < word_length_minimum
		ct_split_words << ct_word
	end	

	#Get the final substitution alphabet... easier said than done
	final_substitution_alphabet = find_subst_with_word_analysis ct_split_words, initial_substitution_alphabet

	#Get the plaintext from the substitution alphabet - assuming we have found one and the program is not indefinitely running...
	plaintext = substitution_cipher cipher_text, final_substitution_alphabet, false

	#Print the output
	puts "Exercise7 plaintext:"
	puts plaintext[0...30]

end

## 1
def find_subst_with_word_analysis split_words, substitution_alphabet
	#If a word is found from a previous or future (weird but it's like git branches being ahead) function call, then return the current substitution alphabet
	return substitution_alphabet if $found_word
	words = words_which_arent_in_substitution_alphabet(split_words, substitution_alphabet).sort_by{|k,v| k.length}.reverse  ## Call 2
	#If there are no words found, then return the substitution alphabet we have
	return substitution_alphabet if words.length == 0 

	#For each word that we found in the substitution alphabet
	for i in 0...words.length do 
		word = words[i]

		#Find substitution alphabets which match this specific word
		potential_substitution_alphabets = find_substitution_alphabets_in_tess word, substitution_alphabet 4

		for j in 0...potential_substitution_alphabets.length do 
			#Find the new substitution alphabet that each potentional substitution alpahbet produces
			new_substitution_alphabet = potential_substitution_alphabets[j].merge(substitution_alphabet)

			#Get the plaintext from the new alphabet
			plaintext = substitution_cipher $ct, new_substitution_alphabet, true

			#Check the amount of whole words in the plaintext (This would not work if we didn't know that all words would exist in tess27)
			whole_words_in_pt = get_whole_words_in_pt $ct, new_substitution_alphabet
			count_of_non_whole_words = count_non_words_in_array whole_words_in_pt, new_substitution_alphabet

			#If there are more than 2 dodgy words, throw it away
			break if count_of_non_whole_words > 2


			#Find a new substitution alphabet with the new alphabet (Call this function again, but with an updated alphabet)
			new_potential_substitution_alphabet = find_subst_with_word_analysis split_words, new_substitution_alphabet
			return new_potential_substitution_alphabet if $found_word

			unless new_potential_substitution_alphabet == {}
				new_potential_substitution_alphabet_length = new_potential_substitution_alphabet.length

				#If the new alphabet is less than the minimum we want to search for then don't finish yet
				next if new_potential_substitution_alphabet_length < $minimum_substitution_alphabet_length

				#Find the amount of non words again to check if we return yet or keep searching
				count_of_non_words = count_non_words_in_plaintext plaintext

				#If we have found a solution then kill the tree
				$found_word = true
				return new_potential_substitution_alphabet if count_of_non_words <= 2
			end

		end
	end

	#This should be the final alphabet on the first call of this function
	return substitution_alphabet
end

#This function finds words which are not completed words in the alphabet - it's like matching word [THE] but only having T and H map to a letter, so 'THE' would be a word not in the alphabet
def words_which_arent_in_substitution_alphabet split_words, substitution_alphabet
	words = []
	for i in 0...split_words.length do 
		word = split_words[i]
		words << word if word_is_not_contained_in_substiution_alphabet word, substitution_alphabet ## Call 3
	end
	words
end

#This just checks if a word is not contained in the alphabet
def word_is_not_contained_in_substiution_alphabet word, substitution_alphabet
	for l in 0...word.length do
		return true unless substitution_alphabet.key?word[l]
	end
	return false
end

#Finds an alphabet in tess that matches the words
def find_substitution_alphabets_in_tess ciphertext, substitution_alphabet

	#Create an empty regex
	regex_matcher = ""

	for i in 0...ciphertext.length do 
		word = ciphertext[i]

		#If the key is in the alphabet, then just add the letter
		if substitution_alphabet.key?word 
			regex_matcher += "#{substitution_alphabet[word]}"
		else
			#But if the letter is not in the alphabet then add in a regex for any letter
			regex_matcher += "[A-Z]"
		end
	end

	#If the regex is the same size as the ciphertext, then all letters map to another letter, so just end now
	return {} if regex_matcher.length == ciphertext.length


	#Find matching plaintext words from the regex
	matching_plaintext_words = get_matching_words_from_tess regex_matcher, ciphertext.length

	#Finds all potential substitutions for the matching words
	potential_substitutions = []
	for i in 0...matching_plaintext_words.length do 
		matching_word = matching_plaintext_words[i]

		#Check if the matching word can contain any alphabets for other words
		new_substitution_alphabet = get_subst_from_potential_word matching_word, ciphertext, substitution_alphabet

		#If the word can create other words, add it to the array
		potential_substitutions << new_substitution_alphabet unless new_substitution_alphabet == {}
	end

	#Return all potential substitution alphabets which match the word regex
	potential_substitutions
end