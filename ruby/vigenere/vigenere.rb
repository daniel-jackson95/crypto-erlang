
def vigenere_encrypt plain_text, key

	cipher_text = ""
	for i in 0...plain_text.length do
		char_value = plain_text[i].ord - 65
		key_index = i % key.length
		key_value = key[ i % key.length ].ord - 65
		
		new_value = (char_value + key_value) % 26 + 65

		cipher_text += new_value.chr
	end

	cipher_text
end
def vigenere_decrypt cipher_text, key
	plain_text = ""
	for i in 0...cipher_text.length do 
		char_value = cipher_text[i].ord - 65
		key_value = key[ i % key.length ].ord - 65

		new_value = ((char_value - key_value) + 26) % 26 + 65

		plain_text += new_value.chr
	end

	plain_text
end