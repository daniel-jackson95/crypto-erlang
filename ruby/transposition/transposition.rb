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

	for i in 0...total_letters do 
		plain_text += plain_text_cols[i % columns][i / columns]
	end

	plain_text
end