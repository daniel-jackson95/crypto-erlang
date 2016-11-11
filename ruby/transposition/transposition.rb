#This turns a ciphertext into columns
def get_columns_from_index_positions cipher_text, index_positions
	#Setup data for transposition
	plain_text_cols = []
	columns = index_positions.length
	letters_per_col = cipher_text.length / columns

	#For each index position set the column data
	for i in 0...index_positions.length do 
		#Index pos is set because it is used multiple times
		index_pos = index_positions[i]
		#Set the new plaintext columns to be a section of the ciphertext
		plain_text_cols[i] = cipher_text[(index_pos*letters_per_col)...((index_pos+1)*letters_per_col)]
	end

	#Return the columns
	plain_text_cols
end

#Turns a set of columns into plaintext
def get_plain_text_from_cols plain_text_cols
	#Setup data from 
	plain_text = ""
	letters_per_col = plain_text_cols[0].length
	columns = plain_text_cols.length

	#2d array = w * h [w: columns, h: letters per column] 
	total_letters = letters_per_col * columns

	#For each letter in the columns
	for i in 0...total_letters do 
		#Basically adding parts of a 2D array of letters in a different order
		plain_text += plain_text_cols[i % columns][i / columns]
	end

	#Returns the plaintext
	plain_text
end