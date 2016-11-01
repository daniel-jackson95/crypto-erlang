require_relative '../tess'
require_relative '../vigenere/vigenere'

## Exercise 2 ciphertext
def exercise2_ciphertext
	"BWGESSXZWWBVZPZQMOLPDMLAKOKMLV"
end

## Exercise 2 key
def exercise2_key
	"TESSOFTHEDURBERVILLES"
end

## Start the vigenere decryption process
def exercise2_start
	#Output the plaintext from using the ciphertext and key
	puts vigenere_decrypt exercise2_ciphertext, exercise2_key
end