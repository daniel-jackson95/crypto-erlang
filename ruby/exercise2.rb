require_relative 'tess'
require_relative 'vigenere/vigenere'

def cipher_text
	"BWGESSXZWWBVZPZQMOLPDMLAKOKMLV"
end
def key
	"TESSOFTHEDURBERVILLES"
end
def start
	puts vigenere_decrypt cipher_text, key
end

start