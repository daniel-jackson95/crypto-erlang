
def vigenere_encrypt plain_text, key
	#Create a blank cipher_text
	cipher_text = ""

	#Loop over every character in the plaintext
	for i in 0...plain_text.length do
		#Get the plaintext character index between [0-25]
		char_value = plain_text[i].ord - 65
		#Get the current key index by mod the plaintext character index with the key index
		key_index = i % key.length
		#Get the value of the key 
		key_value = key[ i % key.length ].ord - 65
		
		#Find the new value of the char plus key values and convert to ASCII
		new_value = (char_value + key_value) % 26 + 65

		#Add the new new value to the ciphertext as a char (chr)
		cipher_text += new_value.chr
	end

	#Return the ciphertext
	cipher_text
end
def vigenere_decrypt cipher_text, key
	plain_text = ""
	#Loop over all the ciphertext characters
	for i in 0...cipher_text.length do 
		#Get the ciphertext letter 
		char_value = cipher_text[i].ord - 65
		#Get the key letter value
		key_value = key[ i % key.length ].ord - 65

		#Find the new value and mod it and return as ASCII
		new_value = ((char_value - key_value) + 26) % 26 + 65

		#Add the decrypted char to the plaintext
		plain_text += new_value.chr
	end

	#Return the plaintext
	plain_text
end