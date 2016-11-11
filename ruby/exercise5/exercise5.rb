require_relative '../tess'
require_relative '../transposition/transposition'
require_relative '../utility'

def exercise5_ciphertext
	"TOOAGSSEDSCASNIHEROTERARRAGHNPPHETAVNEIIEFTSSHNGQWSWVPSMLSTEESGGMOBEONIPSTOAINIOEETNDEFTEHEHDARRXUNIOYEGSYHUITTCLOSBWEOTHRFYUHAEAALTSELOYCTHNOHEANNEDIEEDHCEOVNNSMEWFACHUHHEIESEDWHSDGAAEUAPTTTOOHFCEGRNSDEHOLEHAIRUESOEXPDLFOSHHAEGNEOHLRTOHAOOOWMSPEGDYLAHAADUOOAITWEDCDIHEERRHETNWEGTTASIADETIEELDNTULAASAELSRLBHHHIONETTSEEESDHEXOLERSOMTEFTVHDLTDTAMTRHTRAEATOTEGKTSOIPIAOSNWRENSAGUUCSSDRHTRZERTHEIRIMTRTHIKSFTNTORTWLENHNISDINTIAADLIEEORSTHIYLDTIEITYFTWEFNAHIHHIIORWDHGIMETHNDDMWFHNAEHERNRNROOOAERGANHNLCPNOEIIEERTIAVSSCOHSHEOIYEHOHFIHEPDIEWNWNTGTVFNPYSRPNPFEEVEAIHNSSEATTARATNATIRILWIEMRADOBHEOEKIOTACIDAPDEIHTDMWYSWUCDTGDEAAGVSCCDOHSPEFPERAEAQNNHHETOINERROLSOEHEAEIIADRKBSOOAORIITDTEDPORNEHSTTHSNHSEALNDNIORDSRIAOTNLWAYENITOSMNIASEASFAIHTHENPRRMEPEOTUETSRAREENETUOGIIROUNGREOREARSACTLNNRWOERISFRRMRTAMNLEIWOGNANOHEIWEBNNAHETLUIAPOMFNAOEELSHLNG"
end

def try_key_of_length columns 
	#Get the amount of letters per column
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
	#Setup tess to use words of length 8 or above
	init_tess 8

	#Column lengths from 4 up to 8
	key_lengths = (4..8).to_a

	#Setup the key word frequency length hash
	key_wfl = Hash.new

	#For all key lengths do 
	for i in 0...key_lengths.length do
		#Calculate the wfl from the key length that is in i
		key_wfl[key_lengths[i].to_s] = try_key_of_length(key_lengths[i])
	end

	#Sort in order
	key_wfl = key_wfl.sort_by{|k, v| v}.reverse

	#The plaintext is the text with the highest word frequency length score
	plaintext = key_wfl[0][1][1]

	#Outpout the plaintext
	puts "Exercise5 plaintext:"
	puts plaintext[0...30]
end