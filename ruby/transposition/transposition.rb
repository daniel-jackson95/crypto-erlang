
def get_index_position_from_key key 
	letter_indexes = []
	for i in 0...key.length do 
		letter_indexes[i] = key[i].ord-65
	end

	letter_indexes_ordered = []
	index_pos = 0

	while(letter_indexes.length > 0)
		letter_index_min = letter_indexes.index(letter_indexes.min)
		break if letter_indexes.min > 999

		letter_indexes[letter_index_min] = 99999

		letter_indexes_ordered[letter_index_min] = index_pos
		index_pos += 1
	end

	letter_indexes_ordered
end

def get_columns_from_index_positions cipher_text, index_positions
	plain_text_cols = []
	columns = index_positions.length
	letters_per_col = cipher_text.length / columns

	for i in 0...index_positions.length do 
		index_pos = index_positions[i]
		plain_text_cols[i] = cipher_text[(index_pos*letters_per_col)...((index_pos+1)*letters_per_col)]
	end

	plain_text_cols
end

def get_plain_text_from_cols plain_text_cols
	plain_text = ""
	letters_per_col = plain_text_cols[0].length
	columns = plain_text_cols.length

	total_letters = letters_per_col * columns

	puts "LPC  = [#{letters_per_col}]"
	puts "COLS = [#{columns}]"
	puts "TLS  = [#{total_letters}]"

	puts plain_text_cols.to_s

	for i in 0...total_letters do 
		puts "[#{i / columns}][#{i % columns}]"
		plain_text += plain_text_cols[i % columns][i / columns]
	end

	# for i in 0...letters_per_col do 
	# 	for j in 0...columns do 
	# 		plain_text += plain_text_cols[j][i]
	# 	end
	# end

	plain_text
end