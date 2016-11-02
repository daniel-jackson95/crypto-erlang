require_relative '../tess'
require_relative '../utility'
require_relative '../substitution/substitution'
require 'colorize'

$which_ct = 2
def cipher_text
	#{}"GYJ|ZYGDRPYDTY|ZY|DRDTTZXY|ZRYMOJYMGYTECJZYGMRYJ|ZYGLMMRCKHY|ZY|DXYMKAZYRZAZCFZXYT|ZYXCXYGMRYMKZYPMPZKJYECAJORZYN|DJYPCH|JY|DFZYBZZKYJ|ZYRZTOLJYCGYT|ZY|DXYBZZKYGRZZYJMYDAAZEJYJ|ZYMGGZRYIOTJYPDXZY|ZRYMGYBZCKHYJ|ZYPMKCZXYDLZATYNCGZYCJYNMOLXY|DFZYLCGJZXY|ZRYAMPELZJZLQYMOJYMGYTOBIZAJCMKYKMJYMKLQYJMY|ZRYERZTZKJYMEERZTTCFZYZPELMQZRYBOJYJMYDYN|MLZYNMRLXYN|MYTZZPZXYJMYXZTECTZY|ZRYBOJYKMYKMYT|ZYTDCXYBRZDJ|LZTTLQYCYAMOLXYKMJY|DFZYPDRRCZXY|CPYKMNY|ZYCTYTMYOKELZDTDKJYJMYPZYJ|DJYFZRQYKCH|JYT|ZYBZHDKYDKYDEEZDLCKHYLZJJZRYJMYALDRZYAMKAZDLCKHYGRMPY|CPY|ZRY|DRXT|CETYDKXYDTTORCKHY|CPYMGY|ZRYOKXQCKHYDGGZAJCMKYDKQYMKZYN|MY|DXYBZZKYCKYDYEMTCJCMKYJMYRZDXYBZJNZZKYJ|ZYLCKZTYNMOLXY|DFZYTZZKYJ|DJYDJYJ|ZYBDAUYMGY|ZRYHRZDJYLMFZYNDTYTMPZYPMKTJRMOTYGZDRYDLPMTJYDYXZTEZRDJCMKYDTYJMYTMPZYTZARZJYAMKJCKHZKACZTYN|CA|YNZRZYKMJYXCTALMTZXYBOJYDHDCKYT|ZYXCXYKMJYGCKCT|Y"
	if $which_ct == 0 #Mine
		"SBD|UQN|FGRD|UD|GUD|OKKQ|DUIN|FGHRPG|FGK|NUAM|LRSFUIQD|HW|FGKIS|OHQQKFD|WVUMMKN|DAUSFVC|IQFH|FGKIS|WULKD|UQN|FGKIS|ESUMMKSD|LVRQP|UOHRF|FGKA|FH|EKUSIDHAKQKDD|FGKC|VIYKN|UVV|FGID|UWFKSQHHQ|IQ|AKAHSIKD|HW|PSKKQ|DRQQC|SHAUQFIL|FUVOHFGUCD|CHR|LUQ|DKK|U|PVKUA|HW|U|GIVV|EIFGIQ|U|WKE|AIVKD|H|WSHHA|YUVVKC|WSHA|GKSK|EGKQ|FID|WIQK|DUIN|AUSIUQ|UG|LUQ|CHR|DUIN|FKDD|UEUBK|FH|FGK|QKE|YUVRK|HW|FGID|VHLUVIFC|DH|FGK|FEH|WHSLKD|EKSK|UF|EHSB|GKSK|UD|KYKSCEGKSK|FGK|IQGKSKQF|EIVV|FH|KQZHC|UQN|FGK|LISLRADFUQFIUV|EIVV|UPUIQDF|KQZHCAKQF|AUSIUQD|EIVV|GUN|U|AKFGHN|HW|UDDIDFIQP|IFDKVW|OC|FUBIQP|WSHA|GKS|MHLBKF|UD|FGK|UWFKSQHHQ|EHSK|HQ|U|MIQF|OHFFVK|LHSBKN|EIFG|EGIFK|SUP|WSHA|EGILG|DGK|IQYIFKN|FKDD|FH|NSIQB|FKDDD|RQUDDIDFKN|MHEKS|HW|NSKUAIQP|GHEKYKS|OKIQP|KQHRPG|WHS|GKS|DROVIAUFIHQ|UF|MSKDKQF|DGK|NKLVIQKN|KXLKMF|FGK|AKSKDF|DIM|UQN|FGKQ|AUSIUQ|FHHB|U|MRVV|W"
	elsif $which_ct == 1 #Jamies
		"GYJ|ZYGDRPYDTY|ZY|DRDTTZXY|ZRYMOJYMGYTECJZYGMRYJ|ZYGLMMRCKHY|ZY|DXYMKAZYRZAZCFZXYT|ZYXCXYGMRYMKZYPMPZKJYECAJORZYN|DJYPCH|JY|DFZYBZZKYJ|ZYRZTOLJYCGYT|ZY|DXYBZZKYGRZZYJMYDAAZEJYJ|ZYMGGZRYIOTJYPDXZY|ZRYMGYBZCKHYJ|ZYPMKCZXYDLZATYNCGZYCJYNMOLXY|DFZYLCGJZXY|ZRYAMPELZJZLQYMOJYMGYTOBIZAJCMKYKMJYMKLQYJMY|ZRYERZTZKJYMEERZTTCFZYZPELMQZRYBOJYJMYDYN|MLZYNMRLXYN|MYTZZPZXYJMYXZTECTZY|ZRYBOJYKMYKMYT|ZYTDCXYBRZDJ|LZTTLQYCYAMOLXYKMJY|DFZYPDRRCZXY|CPYKMNY|ZYCTYTMYOKELZDTDKJYJMYPZYJ|DJYFZRQYKCH|JYT|ZYBZHDKYDKYDEEZDLCKHYLZJJZRYJMYALDRZYAMKAZDLCKHYGRMPY|CPY|ZRY|DRXT|CETYDKXYDTTORCKHY|CPYMGY|ZRYOKXQCKHYDGGZAJCMKYDKQYMKZYN|MY|DXYBZZKYCKYDYEMTCJCMKYJMYRZDXYBZJNZZKYJ|ZYLCKZTYNMOLXY|DFZYTZZKYJ|DJYDJYJ|ZYBDAUYMGY|ZRYHRZDJYLMFZYNDTYTMPZYPMKTJRMOTYGZDRYDLPMTJYDYXZTEZRDJCMKYDTYJMYTMPZYTZARZJYAMKJCKHZKACZTYN|CA|YNZRZYKMJYXCTALMTZXYBOJYDHDCKYT|ZYXCXYKMJYGCKCT|Y"
	elsif $which_ct == 2 #Burbleys
		"J|YJMTJOP|PJOOG|EVSJ|PZZ|QMPJ|PZZ|QMPJ|ODJ|OMVY|HMXVSI|DJT|DMSY|VS|PDJ|VEKMPVJSUJ|ZA|M|KJTOZS|HDZOJ|PZTPWTJO|UMWOJ|JXJTG|VSOPMSP|PZ|OJJE|MS|DZWT|YZSP|UZEJ|UQZOJ|PZ|EJ|MSIJQ|SZ|GZW|EWOP|SZP|LJJK|MHMG|CWP|YZSP|GZW|QZXJ|EJ|EG|YJMT|HVAJ|CJUMWOJ|V|DMXJ|CJJS|OZ|KWQQJY|YZHS|CG|VQQSJOO|GZW|MTJ|SZP|OZ|AVULQJ|V|ME|UZEJ|ZS|KWTKZOJ|AZT|GZW|EG|EZPDJT|MSY|AMPDJT|HVQQ|HJQUZEJ|GZW|SZH|GJO|Z|GJO|GJO|CWP|V|OMG|V|OMG|VP|VO|PZZ|QMPJ|ODJ|OJJEJY|PZ|AJJQ|QVLJ|M|AWIVPVXJ|VS|M|YTJME|HDZ|PTVJO|PZ|EZXJ|MHMG|CWP|UMSSZP|YZSP|GZW|LSZH|MQQ|YZSP|GZW|LSZH|VP|GJP|DZH|YZ|GZW|UZEJ|DJTJ|VA|GZW|YZ|SZP|LSZH|V|VSNWVTJY|DJTJ|MSY|PDJTJ|MSY|V|AZWSY|PDJ|HMG|V|HMVPJY|MSY|HMVPJY|AZT|GZW|ODJ|HJSP|ZS|DJT|PZSJO|OWYYJSQG|TJOWEVSI|PDJVT|ZQY|AQWPG|KMPDZO|CWP|GZW|YVY|SZP|UZEJ|MSY|V|HTZPJ|PZ|GZW|MSY|GZW|YVY|SZP|UZEJ|DJ|LJKP|ZS|OMGVSI|GZW|HZWQY|SJXJT|UZEJ|MSG|EZTJ|MSY|PDMP|V|HMO|M|A"
	end
end

$found_word = false
$ct
def exercise7b_start
	#Initialise Tess system
	init_tess 7
	
	#Save the ciphertext to a variable instead of calling it everytime
	$ct = cipher_text

	###DEFAULTS
	word_length_minimum = 6


	#Initial thoughts based on letter analysis
	# initial_substitution_alphabet = {"|"=>"|", "K"=>"E", "F"=>"T"}
	# word_splitter = "|"

	letter_frequency = letter_analysis $ct
	initial_substitution_alphabet = {letter_frequency[0][0] => "|", letter_frequency[1][0] => "E"}
	word_splitter = letter_frequency[0][0]

	$tess_splitter = word_splitter


	#Split the ciphertext instead words to be used for analysis
	ct_split = $ct.split word_splitter
	ct_split_words = []
	ct_split.each do |ct_word|
		word_length = ct_word.length
		next if word_length < word_length_minimum
		ct_split_words << ct_word
	end	

	final_substitution_alphabet = find_subst_with_word_analysis ct_split_words, initial_substitution_alphabet



end

## 1
def find_subst_with_word_analysis split_words, substitution_alphabet
	return substitution_alphabet if $found_word
	words = words_which_arent_in_substitution_alphabet(split_words, substitution_alphabet).sort_by{|k,v| k.length}.reverse  ## Call 2
	return substitution_alphabet if words.length == 0

	puts "[find_subst_with_word_analysis]".cyan
	puts "Words which aren't complete in the substituion alphabet:".blue + "\n#{words}\n".yellow

	for i in 0...words.length do 
		word = words[i]
		puts "Checking word: ".blue+word.green

		potential_substitution_alphabets = find_substitution_alphabets_in_tess word, substitution_alphabet ## Call 4
		for j in 0...potential_substitution_alphabets.length do 
			new_substitution_alphabet = potential_substitution_alphabets[j].merge(substitution_alphabet)
			# puts "new_substitution_alphabet = [#{new_substitution_alphabet}]"

			plaintext = substitution_cipher $ct, new_substitution_alphabet
			puts "plaintext:\n#{plaintext}"


			###ToDo:
			### Check all words in the plaintext which are whole and if any are not in tess then skip to the next alphabet
			whole_words_in_pt = get_whole_words_in_pt $ct, new_substitution_alphabet
			puts "whole_words_in_pt:\n#{whole_words_in_pt}"
			count_of_non_whole_words = count_non_words_in_array whole_words_in_pt, new_substitution_alphabet
			puts "count_of_non_whole_words:\n#{count_of_non_whole_words}"

			break if count_of_non_whole_words > 2


			new_potential_substitution_alphabet = find_subst_with_word_analysis split_words, new_substitution_alphabet
			return new_potential_substitution_alphabet if $found_word

			unless new_potential_substitution_alphabet == {}
				new_potential_substitution_alphabet_length = new_potential_substitution_alphabet.length
				next if new_potential_substitution_alphabet_length < 24
				puts "Size of new_potential_substitution_alphabet [#{new_potential_substitution_alphabet_length}]".red

				count_of_non_words = count_non_words_in_plaintext plaintext
				puts "Count of non words [#{count_of_non_words}]".green

				$found_word = true
				return new_potential_substitution_alphabet if count_of_non_words <= 2
			end

		end
	end

	return substitution_alphabet
end

## 2
def words_which_arent_in_substitution_alphabet split_words, substitution_alphabet
	words = []
	for i in 0...split_words.length do 
		word = split_words[i]
		words << word if word_is_not_contained_in_substiution_alphabet word, substitution_alphabet ## Call 3
	end
	words
end

## 3
def word_is_not_contained_in_substiution_alphabet word, substitution_alphabet
	# puts "[word_is_not_contained_in_substiution_alphabet]".cyan
	# puts "substitution_alphabet:\n#{word}-#{substitution_alphabet}"
	for l in 0...word.length do
		return true unless substitution_alphabet.key?word[l]
	end
	return false
end

## 4
def find_substitution_alphabets_in_tess ciphertext, substitution_alphabet
	regex_matcher = ""

	for i in 0...ciphertext.length do 
		word = ciphertext[i]

		if substitution_alphabet.key?word 
			regex_matcher += "#{substitution_alphabet[word]}"
		else
			regex_matcher += "[A-Z]"
		end
	end

	return {} if regex_matcher.length == ciphertext.length


	matching_plaintext_words = get_matching_words_from_tess regex_matcher, ciphertext.length

	potential_substitutions = []
	for i in 0...matching_plaintext_words.length do 
		matching_word = matching_plaintext_words[i]

		new_substitution_alphabet = get_subst_from_potential_word matching_word, ciphertext, substitution_alphabet
		# puts "New Substitution alphabet [#{new_substitution_alphabet}]".cyan

		potential_substitutions << new_substitution_alphabet unless new_substitution_alphabet == {}
	end
	
	puts "\n"
	potential_substitutions
end