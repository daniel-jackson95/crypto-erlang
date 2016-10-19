def char_to_int char
	char.ord - 65
end
def int_to_char char_value
	
end
def test	
	puts 'Arrays: [A,B] [C,D] [E,F]'
	puts 'Expected [A,C,E] [A,C,F] [A,D,E] [A,D,F] [B,C,E] [B,C,F] [B,D,E] [B,D,F]'

	a1 = ['A', 'B', 'X']
	a2 = ['C', 'D']
	a3 = ['E', 'F']
	a4 = ['G', 'H']

	arrays = [a1, a2, a3, a4]

	head, *rest = arrays

	puts 'Permutation:'
	perms = head.product(*rest)
	for i in 0...perms.length do
		puts "#{perms[i]}"
	end
end

test