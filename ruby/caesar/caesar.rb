
def caesar_cipher text, key, is_encryption
	cipher_text = ""
	key_value = key.ord - 65

	for i in 0...text.length do 
		text_value = text[i].ord - 65
		cipher_value = text_value + key_value if is_encryption
		cipher_value = text_value - key_value if !is_encryption
		cipher_value += 26 if cipher_value < 0
		cipher_value -= 26 if cipher_value > 25
		cipher_text += (cipher_value+65).chr
	end

	cipher_text
end
def caesar_encrypt plain_text, key
	caesar_cipher plain_text, key, true
end
def caesar_decrypt cipher_text, key
	caesar_cipher cipher_text, key, false
end