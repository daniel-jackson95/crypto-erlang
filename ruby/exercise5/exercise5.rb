require_relative '../tess'
require_relative '../transposition/transposition'
require_relative '../utility'


def exercise5_ciphertext
	"TOOAGSSEDSCASNIHEROTERARRAGHNPPHETAVNEIIEFTSSHNGQWSWVPSMLSTEESGGMOBEONIPSTOAINIOEETNDEFTEHEHDARRXUNIOYEGSYHUITTCLOSBWEOTHRFYUHAEAALTSELOYCTHNOHEANNEDIEEDHCEOVNNSMEWFACHUHHEIESEDWHSDGAAEUAPTTTOOHFCEGRNSDEHOLEHAIRUESOEXPDLFOSHHAEGNEOHLRTOHAOOOWMSPEGDYLAHAADUOOAITWEDCDIHEERRHETNWEGTTASIADETIEELDNTULAASAELSRLBHHHIONETTSEEESDHEXOLERSOMTEFTVHDLTDTAMTRHTRAEATOTEGKTSOIPIAOSNWRENSAGUUCSSDRHTRZERTHEIRIMTRTHIKSFTNTORTWLENHNISDINTIAADLIEEORSTHIYLDTIEITYFTWEFNAHIHHIIORWDHGIMETHNDDMWFHNAEHERNRNROOOAERGANHNLCPNOEIIEERTIAVSSCOHSHEOIYEHOHFIHEPDIEWNWNTGTVFNPYSRPNPFEEVEAIHNSSEATTARATNATIRILWIEMRADOBHEOEKIOTACIDAPDEIHTDMWYSWUCDTGDEAAGVSCCDOHSPEFPERAEAQNNHHETOINERROLSOEHEAEIIADRKBSOOAORIITDTEDPORNEHSTTHSNHSEALNDNIORDSRIAOTNLWAYENITOSMNIASEASFAIHTHENPRRMEPEOTUETSRAREENETUOGIIROUNGREOREARSACTLNNRWOERISFRRMRTAMNLEIWOGNANOHEIWEBNNAHETLUIAPOMFNAOEELSHLNG"
end

def try_key_of_length columns 
	letters_per_col = exercise5_ciphertext.length / columns

	#Setup transposition index positions
	index_positions = []
	columns.times {|i| index_positions[i] = i}

	#Get the ciphertext in the correct columns
	plain_text_cols = get_columns_from_index_positions exercise5_ciphertext, index_positions

	#Plantext is constructed from the letters in order of each column
	plain_text = get_plain_text_from_cols plain_text_cols

	#Return the WFL
	[get_word_freq_length(plain_text), plain_text]
end

def exercise5_start
	init_tess 8

	key_lengths = (4..8).to_a
	key_wfl = Hash.new

	for i in 0...key_lengths.length do
		key_wfl[key_lengths[i].to_s] = try_key_of_length(key_lengths[i])
	end

	key_wfl = key_wfl.sort_by{|k, v| v}.reverse

	puts "Most probable plaintext using column length of [#{key_wfl[0][0]}] with a wfl[#{key_wfl[0][1][0]}]:\n#{key_wfl[0][1][1]}"
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
