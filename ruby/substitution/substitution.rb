#Used to help me manually debug my program by highlighting if a letter has been substituted or not
require 'colorize'

def substitution_cipher cipher_text, substitution_alphabet, color
	#Start off with a plain plaintext
	plain_text = ""

	#For each letter in the ciphertext
	for i in 0...cipher_text.length do 
		
		#If there is a substitution key present
		if substitution_alphabet.key?cipher_text[i]
			#Add the substituted alphabet value (and also make it green for debug)
			plain_text += substitution_alphabet[cipher_text[i]].green if color
			plain_text += substitution_alphabet[cipher_text[i]] unless color
		else
			#If no substitution key, add the ciphertext value back but in red
			plain_text += cipher_text[i].red if color
			plain_text += cipher_text[i] unless color
		end
	end

	#Return a plaintext of mostly red at the start of the program and green near the completed alphabet and plaintext
	plain_text
end