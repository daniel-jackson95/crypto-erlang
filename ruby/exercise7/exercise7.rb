require_relative '../tess'
require_relative '../utility'
require_relative '../substitution/substitution'
require 'colorize'

$which_ct = 2
$ct
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

$oo = -500

def find_subst_alphabet_in_tess cipher_text_word, subst, ct_split_words
	# CTW = 'TUVAPIDTF'
	# Subst = {"T"="E"}

	$oo += 1


	
	puts "CipherWord [#{cipher_text_word}]".cyan
	return subst if $oo >= 2500

	regex_matcher = ""
	is_new_word = false

	for i in 0...cipher_text_word.length do 
		word = cipher_text_word[i]

		if subst.key?word 
			regex_matcher += "#{subst[word]}"
		else
			regex_matcher += "[A-Z]"
			is_new_word = true
		end
	end

	return unless is_new_word

	tess_matching_words = get_matching_words_from_tess regex_matcher, cipher_text_word.length

	puts "Matching words:\n[#{tess_matching_words}]".red

	potential_subst = []
	for i in 0...tess_matching_words.length do 
		word = tess_matching_words[i]

		new_subst = get_subst_from_potential_word word, cipher_text_word, subst
		puts "New subst [#{word}] [#{new_subst}]"
		#TRY word in the subst
		# find_subst_alphabet_in_tess word, subst
		#find a word which

		potential_subst << new_subst unless new_subst == {}

		return subst if $oo >= 5000
	end

	potential_subst	
end

def is_word_contained_in_subst word, subst
	for i in 0...word.length do
		# puts "WORD[#{i}] [#{word[i]}]"
		return true unless subst.key?word[i]
	end
	return false
end

def check_for_words_which_arent_in_subst ct_split_words, new_subst
	words = []
	for i in 0...ct_split_words.length do 
		word = ct_split_words[i]
		# puts "WORD [#{word}]"
		if is_word_contained_in_subst word, new_subst
			# puts "[#{ct_split_words[i]}] is not contained in [{new_subst}]"
			words << word
		end
	end

	# puts "Words which aren't in subst (#{words.to_s})"
	words
end

$pp = 0
def find_subst_with_word_analysis ct_split_words, subst
	$pp += 1

	return subst if $pp == 2500

	words = check_for_words_which_arent_in_subst(ct_split_words, subst).sort_by{|k,v| k.length}.reverse
	# word = words[0]
	# puts "WORD [#{word}]"

	return subst if words.length == 0

	for w in 0...words.length do 
		word = words[w]

		potential_subst = find_subst_alphabet_in_tess(word, subst, {})
		for i in 0...potential_subst.length do 
			sb3 = subst.clone ###### ERM?
			new_subst = potential_subst[i].merge(sb3)
			pt = substitution_cipher $ct, new_subst

			puts "new_subst.length [#{new_subst.length}]"

			puts "$pp [#{$pp}]\n#{pt}"

			new_pot_subst = find_subst_with_word_analysis ct_split_words, new_subst
			puts "NEW_POT_SUBST [#{new_pot_subst}]"
		end
	end

	puts "End of FSWWA [#{subst}]"
	subst
end

def exercise7_start
	init_tess 5

	$ct = cipher_text

	# test_str = "ABBOA"
	# subst = {'A'=>'E', 'B'=>'O', 'O'=>'P'}
	# sbust_reversed = {'E'=>'A', 'O'=>'B', 'P'=>'O'}


	# puts "test_str = [#{test_str}]"
	# ciphertext = substitution_cipher test_str, subst
	# puts "Ciphertext = [#{ciphertext}]"

	# plaintext = substitution_cipher ciphertext, sbust_reversed
	# puts "Plaintext = [#{plaintext}]"


	jgr2_subst = {"Y"=>" ", "Z"=>"E"}
	jgr2_splitter = "Y"

	subst = {"|"=>" ", "K"=>"E", "F"=>"T"}
	splitter = "|"

	letter_frequency = letter_analysis $ct
	puts "LF [0] = [#{letter_frequency[0]}]"
	puts "LF [1] = [#{letter_frequency[1]}]"

	subst = {letter_frequency[0][0] => " ", letter_frequency[1][0] => "E"}
	splitter = letter_frequency[0][0]


	subst = {"|" => " ", "Z"=>"E"}
	# subst = jgr2_subst
	# splitter = jgr2_splitter

	# subst = {"L"=>"C", "I"=>"I", "S"=>"R", "R"=>"U", "A"=>"M", "D"=>"S", 
	# 	"T"=>"T", "U"=>"A", "Q"=>"N", "V"=>"L", "|"=>" ", "K"=>"E", "F"=>"T",
	# 	"P"=>"G", "W"=>"F", "N"=>"D", "C"=>"Y", "H"=>"O", "M"=>"P", "O"=>"B", "B"=>"K",
	# 	"Y"=>"V","E"=>"W","G"=>"H", "Z"=>"J", "X"=>"X"}

	#EYESCEGESE
	#S=>R
	#RR

	#{'|'=>' ','K'=>'E', 'F'=>'T'}
	#{'|'=>' ', 'K'=>'E', 'F'=>'T', 'U'=>'O', 'G'=>'H'}
	#, 'F'=>'T', 'G'=>'H', 'Q'=>'N'}#, 'H'=>'N', 'W'=>'S', 'D'=>'O', 'U'=>'A'}

	# text_letter_analysis = letter_analysis cipher_text
	# puts "letter analysis:\n#{text_letter_analysis}"



	### Split the cipher text by the space to find all the words
	ct_split = $ct.split(splitter)
	ct_length = Hash.new(0)
	ct_split_words = []
	ct_split.each do |ct_word|
		word_length = ct_word.length

		next if word_length < 3

		ct_length[word_length] += 1
		ct_split_words << ct_word
		# ct_split_words[ct_word] += 1
	end	
	# puts "CT SPLIT WORDS #{ct_split_words}"
	# ct_split_words = ct_split_words.sort_by{|k,v| k.length}
	# # ct_split_words.each {|k,v| puts "Length of [#{k}] x [#{v.length}]"} #Debug print

	ct_length = ct_length.sort_by{|k,v| k}
	ct_length.each do |k,v|
		# puts "Length of [#{k}] x [#{v}]"
	end

	puts "CTSPLIT [#{ct_split_words.length}]"

	# for i in 0...10 do 
	# 	break
	# 	max_length = ct_split_words.max_by(&:length)
	# 	puts "MaxLength Word {#{max_length} - #{max_length.length}}"

	# 	new_ct_split_words = ct_split_words.reject{|e| e==max_length}
	# 	puts "CTSPLIT [#{new_ct_split_words.length}]"
	# 	puts "subst [#{subst}]"
	# 	# new_subst = find_subst_alphabet_in_tess max_length, subst, new_ct_split_words
	# 	puts "subst [#{subst}]"
	# end					


	new_subst = find_subst_with_word_analysis ct_split_words, subst
	puts "new_subst: [#{new_subst.to_s}]"


	#Get initial words in ct_split_words which aren't in our cipher text
	initial_words = check_for_words_which_arent_in_subst(ct_split_words, subst).sort_by{|k,v| k.length}.reverse
	# puts "Initial words: [#{initial_words.to_s}]"

	#First word to try
	initial_word = initial_words[0]

	#Get words <----
	#Get word in words
	#Get potential subst [find_subst_alphabet(word, subst)]
		##For each potential subst
		#Get new subst by merging
		#Show Plaintext from new subst

		#Get new words [check_for_words] <-----



	return "STOP"
	potential_subst = find_subst_alphabet_in_tess("LISLRADFUQFIUV", subst, {})#ct_split_words)#.merge(subst)
	for i in 0...potential_subst.length do 
		puts "Trying potential subst: [#{potential_subst[i].to_s}]"

		new_subst = potential_subst[i].merge(subst)

		pt = substitution_cipher $ct, new_subst
		puts "Plaintext:\n#{pt}"





		words = check_for_words_which_arent_in_subst ct_split_words, new_subst

		words = words.sort_by{|k,v| k.length}.reverse
		puts "WORRRRDS [#{words.to_s}]"

		new_word_to_find = words[0]
		puts "New word to find [#{new_word_to_find}]"

		potential_subst_2 = find_subst_alphabet_in_tess(new_word_to_find, new_subst, {})

		puts "PS2 [#{potential_subst_2}]"

		for j in 0...potential_subst_2.length do 
			puts "Trying [2] Potential subst2: [#{potential_subst_2[j].to_s}]"
			new_subst_2 = potential_subst_2[j].merge(new_subst)

			pt_2 = substitution_cipher $ct, new_subst_2
			puts "Plaintext2:\n#{pt_2}"


			words_3 = check_for_words_which_arent_in_subst ct_split_words, new_subst_2
			words_3 = words_3.sort_by{|k,v| k.length}.reverse
			new_word_3 = words_3[0]

			ps3 = find_subst_alphabet_in_tess(new_word_3, new_subst_2, {})
			for k in 0...ps3.length do 
				new_subst_3 = ps3[k].merge(new_subst_2)
				pt_3 = substitution_cipher $ct, new_subst_3
				puts "Plaintext3:\n#{pt_3}"


			end
		end

		# ct_split_words = ct_split_words.sort_by{|k,v| k.length}
		# # ct_split_words.each {|k,v| puts "Length of [#{k}] x [#{v.length}]"} #Debug print
	end
	# new_pt = substitution_cipher ct, new_subst




	# max_length = ct_split_words.max_by{|k,v| k.length}[0].length
	# puts "MaxLength [#{max_length}]"


	# word = ct_split_words.select{|k,v| k.length == max_length}
	# puts "Word [#{word}]"

	# ct_split_words.delete(word[0])
	# puts "Delted word"

	# puts ct_split_words.to_a.to_s

	# word_length_max = ct_length.max[0]
	# puts word_length_max
	# puts ct_split_words.to_s

	# word =  ct_split_words.select{|k,v| k == 14}
	# puts word

	# ct_split_words.delete(word.to_s)
	# puts ct_split_words.to_s

	#Iteration process
	# max_word_length = ct_split_words.max[0]
	# word = ct_split_words[0][0]
	# puts "Max word length: [#{max_word_length}] [#{word}]"

	# # puts ct_split_words
	# ct_split_words.delete(1)
	# puts ct_split_words.to_s

	# max_word_length = ct_split_words.max[0]
	# puts "Max word length: [#{max_word_length}]"
	#End of Iteration process

	# plain_text = substitution_cipher cipher_text, subst
	# puts plain_text

	# pt_split = plain_text.split(' ')
	
	# pt_split_words = Hash.new(0)
	# pt_split.each do |str|
	# 	puts str
	# end








	return "x"

	plain_text_split = plain_text.split(' ')
	pts_length = Hash.new(0)
	words = Hash.new(0)

	plain_text_split.each do |str|
		str = str.gsub(/\e\[([;\d]+)?m/, '') #decolorize string
		pts_length[str.length] += 1
		if pts_length[str.length] == 1
			words[str.length] = []
		end
		words[str.length] << str
	end

	pts_length = pts_length.sort_by{|k,v| k}
	pts_length.each do |k,v|
		puts "Length of [#{k}] x [#{v}]"
	end

	word_length_max = pts_length.max[0]
	puts "Words [length=#{word_length_max}] [#{words[word_length_max]}]"

	tess_27_words = get_words_of_length word_length_max

	for i in 0...words[word_length_max].length 
		cipher_word = words[word_length_max][i]

		# Get all of the potential words 
		potential_words_which_fit = does_tess_contain_word cipher_word, subst
		for i in 0...potential_words_which_fit.length do
			potential_word = potential_words_which_fit[i] 
			new_subst = get_subst_from_potential_word(potential_word, cipher_word).merge(subst)

			puts "Word [#{potential_word}] subst[#{new_subst.to_s}]"

			new_pt = substitution_cipher cipher_text, new_subst

			puts "NEW PLAINTEXT:\n#{new_pt}\n"
		end
	end

	puts "WORDS WHICH FIT [#{potential_words_which_fit.to_s}]"
	
	

	# puts "Tess27Words [#{tess_27_words}]"

	# puts words[pts_length.max[0]]

	# puts plain_text
end