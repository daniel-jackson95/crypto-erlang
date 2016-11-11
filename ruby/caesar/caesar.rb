def caesar_cipher text, key_value, is_encryption
	#Setup the new cipher/plain text
	final_text = ""

	for i in 0...text.length do 
		text_value = text[i].ord - 65 #Get the letter ASCII value minus 65 to convert to [0-25]
		new_value = text_value + key_value if is_encryption #If it's encryption add the value
		new_value = text_value - key_value if !is_encryption #If it's decryption minus the value
		new_value += 26 if new_value < 0 #If it was decryption we need to add a 26 if it's less
		new_value -= 26 if new_value > 25 #If it was encryption we might need to minus 26 if it's more
		final_text += (new_value+65).chr #Add the new value to the cipher/plain text by adding 'A' back to the [0-25] value
	end

	#Return the cipher/plain text
	final_text
end
def caesar_encrypt plain_text, key
	caesar_cipher plain_text, key, true
end
def caesar_decrypt cipher_text, key
	caesar_cipher cipher_text, key, false
end