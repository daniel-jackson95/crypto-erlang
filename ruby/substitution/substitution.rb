require 'colorize'

def substitution_cipher cipher_text, substitution_alphabet
	plain_text = ""

	for i in 0...cipher_text.length do 
		
		if substitution_alphabet.key?cipher_text[i]
			plain_text += substitution_alphabet[cipher_text[i]].green
		else
			plain_text += cipher_text[i].red
		end
	end

	plain_text
end