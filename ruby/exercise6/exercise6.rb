require_relative '../tess'
require_relative '../transposition/transposition'
require_relative '../utility'

def exercise6_ciphertext
	"MIEHPAEDBEMINMINRIIDDLAPNEIHIIDAFTVNAPSLHSNNIEYFOANCELRTKASTSTBLSEPAEAKDRCSTIWSWSIEEFDPTUEASEMNWULFASSNSLETOINRDIWXNUAAWRDDTMOLRISEADEDNEEAOEVRWOECEANMMAMVEGSSURLVDUSCSRTNLETXDCDDTTAINEHEENGOORSCNRFUENFRLSSUHHTOAFERFAEALOAHHOEODGHBOHAOTCSEEASAUNHSHDEEEHSIATTVYEEIFOOLUDEDBADAUHUFROEOEERPHADOCDORTONBUTECLFEDINOONOEIIMAIYENGOTVORTFEKWIEHEREHIHEEWDPMANECOOTHRHUAELSDHREHRRNSSOLIRYUDIHDEYRFFESCTSEEURRCHETDHHDAMNOSBNADDINNNRORWLNTEOOOEONMWHNBAIHEEECTENAPROXITNENRWHACTLHMNRLEATIADOCAOUIEUECRIWHEHEOTSHAONSTRBMNIFSRTEOHAURRWITOODRSYHPVTEFNASNCHHMOOTIMENNISSEDTLOTYEMETPORVDCDLCENETEYWFCTCRANDESDAGXMHASEOETONNLTOOECHSHKDEHNMNDVTOHREDATMTNPSACULYDWOROAFOUCDRMGHOATEHRRSNIUOWEIAYEINLONNCEERSTDROIRESDARFESLTWVNOEAANANIANONWSLPOAAAONENTNLSRNIGESLFROTUIAFOLTOTAGAENMOEOERSHTEBRDIOMREECISSLEAOEONEEHDETFITICLHNITRAFLJDHEHERDNAEAEAHLEESNUTFCLEDEENCYG"
end

def exercise6_start
	init_tess 6

	ct = exercise6_ciphertext
	key_length = 6

	#try all the index positions
	#[0, 1, 2, 3, 4, 5]
	possible_positions = [0,1,2,3,4,5]

	perm = possible_positions.permutation.to_a #product(possible_positions)

	column_orders = []

	for i in 0...perm.length do 
		print "#{i}/#{perm.length}\r"
		plain_text_cols = get_columns_from_index_positions ct, perm[i]

		#Plantext is constructed from the letters in order of each column
		plain_text = get_plain_text_from_cols plain_text_cols

		wfl = get_word_freq_length(plain_text)

		# puts "WFL [#{wfl}] WordOrder #{perm[i]}" if wfl > 0

		column_orders << [perm[i], wfl] if wfl > 0
	end

	column_orders = column_orders.sort_by{|k,v| v}.reverse

	# POTENTIAL COLUMN ORDERINGS:
	# puts "Potential column orders:"
	# for i in 0...column_orders.length do 
	# 	puts column_orders[i].to_s
	# end

	# puts "Trying the most probably index ordering:"
	puts get_plain_text_from_cols(get_columns_from_index_positions(exercise6_ciphertext, column_orders[0][0]))
end


def test
	init_tess 8

	#The plaintext is written row-wise across 6 columns
	#The ciphertext is formed by reading out successive columns in an artbitrary order
	# (Which you must figure out to decipher the message)
	# Hint: look for common pairs of letters, such as 'th'


end

