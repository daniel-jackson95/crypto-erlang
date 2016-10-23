require_relative 'tess'
require_relative 'transposition/transposition'
require_relative 'utility'

def cipher_text
	"MIEHPAEDBEMINMINRIIDDLAPNEIHIIDAFTVNAPSLHSNNIEYFOANCELRTKASTSTBLSEPAEAKDRCSTIWSWSIEEFDPTUEASEMNWULFASSNSLETOINRDIWXNUAAWRDDTMOLRISEADEDNEEAOEVRWOECEANMMAMVEGSSURLVDUSCSRTNLETXDCDDTTAINEHEENGOORSCNRFUENFRLSSUHHTOAFERFAEALOAHHOEODGHBOHAOTCSEEASAUNHSHDEEEHSIATTVYEEIFOOLUDEDBADAUHUFROEOEERPHADOCDORTONBUTECLFEDINOONOEIIMAIYENGOTVORTFEKWIEHEREHIHEEWDPMANECOOTHRHUAELSDHREHRRNSSOLIRYUDIHDEYRFFESCTSEEURRCHETDHHDAMNOSBNADDINNNRORWLNTEOOOEONMWHNBAIHEEECTENAPROXITNENRWHACTLHMNRLEATIADOCAOUIEUECRIWHEHEOTSHAONSTRBMNIFSRTEOHAURRWITOODRSYHPVTEFNASNCHHMOOTIMENNISSEDTLOTYEMETPORVDCDLCENETEYWFCTCRANDESDAGXMHASEOETONNLTOOECHSHKDEHNMNDVTOHREDATMTNPSACULYDWOROAFOUCDRMGHOATEHRRSNIUOWEIAYEINLONNCEERSTDROIRESDARFESLTWVNOEAANANIANONWSLPOAAAONENTNLSRNIGESLFROTUIAFOLTOTAGAENMOEOERSHTEBRDIOMREECISSLEAOEONEEHDETFITICLHNITRAFLJDHEHERDNAEAEAHLEESNUTFCLEDEENCYG"
end

def start
	init_tess 8

	ct = cipher_text
	key_length = 6

	#try all the index positions
	#[0, 1, 2, 3, 4, 5]
	possible_positions = [0,1,2,3,4,5]

	perm = possible_positions.permutation.to_a #product(possible_positions)

	column_orders = []

	for i in 0...perm.length do 
		plain_text_cols = get_columns_from_index_positions ct, perm[i]

		#Plantext is constructed from the letters in order of each column
		plain_text = get_plain_text_from_cols plain_text_cols

		wfl = get_word_freq_length(plain_text)

		puts "WFL [#{wfl}] WordOrder #{perm[i]}" if wfl > 0

		column_orders << [perm[i], wfl] if wfl > 0
	end

	# POTENTIAL COLUMN ORDERINGS:
	# puts "Potential column orders:"
	# for i in 0...column_orders.length do 
	# 	puts column_orders[i].to_s
	# end

	puts "Trying the most probably index ordering:"
	puts get_plain_text_from_cols(get_columns_from_index_positions(ct, [1,0,2,5,4,3]))
end


def test
	init_tess 8

	#The plaintext is written row-wise across 6 columns
	#The ciphertext is formed by reading out successive columns in an artbitrary order
	# (Which you must figure out to decipher the message)
	# Hint: look for common pairs of letters, such as 'th'


end




start 
# test



