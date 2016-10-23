

def substitution_decrypt cipher_text, substitution_alphabet
	
end


def test
	subst = Hash.new

	subst['A'] = 'E'
	subst['B'] = 'O'
	subst['O'] = 'P'

	test_str = "ABBOA"

	for i in 0...test_str.length do 
		chr = test_str[i]
		puts "[#{chr}] -> [#{subst[chr]}]"
	end


	plaintext = "MEETMEINSTLOUIS"

	subst = Hash.new
	cipher = "YBLSHXIJNWDCOPRUGKZFTVAMEQ"

	for i in 0...26 do
		subst[(i+65).chr] = cipher[i]
	end

	subst.each do |k,v|
		puts "[#{k}] -> [#{v}]"
	end


	plain_text_new = ""

	for i in 0...plaintext.length do 
		plain_text_new += subst[plaintext[i]]
	end

	puts "New plaintext: [#{plain_text_new}]"

end

test