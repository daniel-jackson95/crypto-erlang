require_relative 'tess'
require_relative 'transposition/transposition'
require_relative 'utility'


def cipher_text
	"TOOAGSSEDSCASNIHEROTERARRAGHNPPHETAVNEIIEFTSSHNGQWSWVPSMLSTEESGGMOBEONIPSTOAINIOEETNDEFTEHEHDARRXUNIOYEGSYHUITTCLOSBWEOTHRFYUHAEAALTSELOYCTHNOHEANNEDIEEDHCEOVNNSMEWFACHUHHEIESEDWHSDGAAEUAPTTTOOHFCEGRNSDEHOLEHAIRUESOEXPDLFOSHHAEGNEOHLRTOHAOOOWMSPEGDYLAHAADUOOAITWEDCDIHEERRHETNWEGTTASIADETIEELDNTULAASAELSRLBHHHIONETTSEEESDHEXOLERSOMTEFTVHDLTDTAMTRHTRAEATOTEGKTSOIPIAOSNWRENSAGUUCSSDRHTRZERTHEIRIMTRTHIKSFTNTORTWLENHNISDINTIAADLIEEORSTHIYLDTIEITYFTWEFNAHIHHIIORWDHGIMETHNDDMWFHNAEHERNRNROOOAERGANHNLCPNOEIIEERTIAVSSCOHSHEOIYEHOHFIHEPDIEWNWNTGTVFNPYSRPNPFEEVEAIHNSSEATTARATNATIRILWIEMRADOBHEOEKIOTACIDAPDEIHTDMWYSWUCDTGDEAAGVSCCDOHSPEFPERAEAQNNHHETOINERROLSOEHEAEIIADRKBSOOAORIITDTEDPORNEHSTTHSNHSEALNDNIORDSRIAOTNLWAYENITOSMNIASEASFAIHTHENPRRMEPEOTUETSRAREENETUOGIIROUNGREOREARSACTLNNRWOERISFRRMRTAMNLEIWOGNANOHEIWEBNNAHETLUIAPOMFNAOEELSHLNG"
end

def start
	init_tess 8

	ct = cipher_text

	columns = 7 #[4, 5, 6, 7, 8]
	letters_per_col = ct.length / columns

	index_positions = [] #[0, 1, 2, 3]
	for i in 0...columns do 
		index_positions[i] = i
	end

	plain_text_cols = []
	for i in 0...columns do 
		index_pos = index_positions[i]
		plain_text_cols[i] = ct[(index_pos*letters_per_col)...((index_pos+1)*letters_per_col)]
		# puts "PTC[#{i}] = [#{plain_text_cols[i]}]"
	end

	plain_text_cols_orientated = []
	plain_text = ""
	for i in 0...letters_per_col do
		# puts "LPC [#{i}]"
		str = ""
		for j in 0...columns do 
			# puts "PTC [#{j}] = [#{plain_text_cols[j]}] L=[#{plain_text_cols[j].length}]"
			str += plain_text_cols[j][i]
		end
		plain_text_cols_orientated[i] = str 
		plain_text += str
	end

	puts "Plain text:\n[#{plain_text}]"

end


def test
	init_tess 6

	cipher_text = "OIHGUAFITSEOTPTNIEEIESEESNVNEPEGNTTNBHONTNBFISHGTHOETTTEIDENNENISINIDRDNHETGHIHB"
	key = "GREENPEACE"
	#      7 10 3 4 8 9 5 1 2 6 - key_position

	#      6 9  2 3 7 8 4 0 1 5 - key_position correctly started at [0]
	#      0 1  2 3 4 5 6 7 8 9 - index

	#transposition.rb - get the letter index positions from a key [A comes before B etc.]
	index_positions = get_index_position_from_key key

	#we know the amount of columns 
	columns = 10
	#how many letters are in each column
	letters_per_col = cipher_text.length / columns
	puts "LPC [#{letters_per_col}]"


	#The plaintext is now in the correct column positions
	plain_text_cols = get_columns_from_index_positions cipher_text, index_positions

	plain_text = get_plain_text_from_cols plain_text_cols


	#plain_text_cols = 10 rows x 8 cols 
	#plain_text_cols_orientated = needs to become 10 cols an 8 rows

	# plain_text_cols_orientated = []
	# plain_text = ""

	# for i in 0...letters_per_col do 
	# 	str = ""
	# 	for j in 0...columns do 
	# 		str += plain_text_cols[j][i]
	# 	end
	# 	plain_text_cols_orientated[i] = str
	# 	plain_text += str
	# end

	#print out the plain_text [Hopefully it's the correct one]
	puts "Plain text:\n[#{plain_text}]"	

	#Also print the WFL
	puts get_word_freq_length plain_text
end


# start
test


