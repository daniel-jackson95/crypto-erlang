require_relative '../tess'
require_relative '../transposition/transposition'
require_relative '../utility'

def exercise6_ciphertext
	"MIEHPAEDBEMINMINRIIDDLAPNEIHIIDAFTVNAPSLHSNNIEYFOANCELRTKASTSTBLSEPAEAKDRCSTIWSWSIEEFDPTUEASEMNWULFASSNSLETOINRDIWXNUAAWRDDTMOLRISEADEDNEEAOEVRWOECEANMMAMVEGSSURLVDUSCSRTNLETXDCDDTTAINEHEENGOORSCNRFUENFRLSSUHHTOAFERFAEALOAHHOEODGHBOHAOTCSEEASAUNHSHDEEEHSIATTVYEEIFOOLUDEDBADAUHUFROEOEERPHADOCDORTONBUTECLFEDINOONOEIIMAIYENGOTVORTFEKWIEHEREHIHEEWDPMANECOOTHRHUAELSDHREHRRNSSOLIRYUDIHDEYRFFESCTSEEURRCHETDHHDAMNOSBNADDINNNRORWLNTEOOOEONMWHNBAIHEEECTENAPROXITNENRWHACTLHMNRLEATIADOCAOUIEUECRIWHEHEOTSHAONSTRBMNIFSRTEOHAURRWITOODRSYHPVTEFNASNCHHMOOTIMENNISSEDTLOTYEMETPORVDCDLCENETEYWFCTCRANDESDAGXMHASEOETONNLTOOECHSHKDEHNMNDVTOHREDATMTNPSACULYDWOROAFOUCDRMGHOATEHRRSNIUOWEIAYEINLONNCEERSTDROIRESDARFESLTWVNOEAANANIANONWSLPOAAAONENTNLSRNIGESLFROTUIAFOLTOTAGAENMOEOERSHTEBRDIOMREECISSLEAOEONEEHDETFITICLHNITRAFLJDHEHERDNAEAEAHLEESNUTFCLEDEENCYG"
end

def exercise6_start
	#Setup tess to use words of length 6 or above
	init_tess 6

	#Column amount is given as 6
	key_length = 6

	#try all the index positions
	#[0, 1, 2, 3, 4, 5]
	possible_positions = [0,1,2,3,4,5]

	#Permutation of all the possible positions of the columns
	perm = possible_positions.permutation.to_a

	#Set the ciphertext to a variable so it doesn't have to call a function every time
	ct = exercise6_ciphertext

	#Setup the key word frequency length array
	key_wfl = []

	for i in 0...perm.length do 
		#I do this... because ruby is apparently really slow with strings and it takes forever
		# so this is to show progress that the program is still running		
		print "#{i}/#{perm.length}\r" if i % 50 == 0

		#Get the column orderings from the specific permutation
		plain_text_cols = get_columns_from_index_positions ct, perm[i]

		#Plantext is constructed from the letters in order of each column
		plain_text = get_plain_text_from_cols plain_text_cols

		#Gets the word frequency length score
		wfl = get_word_freq_length(plain_text)

		#If the word frequency score is above 0 it can be a potential key
		key_wfl << [perm[i], wfl] if wfl > 0
	end

	#Sort by highest wfl
	key_wfl = key_wfl.sort_by{|k,v| v}.reverse

	#Plaintext is most probably the highest scoring wfl item
	plaintext = get_plain_text_from_cols(get_columns_from_index_positions(exercise6_ciphertext, key_wfl[0][0]))

	#Output the plaintext
	puts "Exercise6 plaintext:"
	puts plaintext[0...30]
end