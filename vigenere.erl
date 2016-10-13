-module(vigenere).
-export([exercise2/0, get_char_position/1, vigenereCipher/2, vtest/0, vtest2/0]).

% A = 65   == Cipher 0
% Z = 90   == Cipher 25

% A B C   with KEY = BCC = 1 2 2
% 0 1 2        =>          1 3 4 => BDE

% ABCABCABC  KEY = BD = 13
% 012012012           = 143325145  
% 131313131
% 143325143
% BEDDCFBED

int_to_char(I)->
	[I + 65].

get_char_position(C)->
	Value = hd(C),
	Value - 65.

vigenereCipher_recursive([PT_head|[]],[Key_head|_])->
	PT_value = get_char_position([PT_head]),
	Key_value = get_char_position([Key_head]),
	Value = PT_value - Key_value,
	if
		Value > 25 ->
			NewValue = Value - 26;
		Value < 0 ->
			NewValue = Value + 26;
		true ->
			NewValue = Value
	end,
	int_to_char(NewValue);
vigenereCipher_recursive([PT_head|PT_tail],[Key_head|Key_tail])->
	PT_value = get_char_position([PT_head]),
	Key_value = get_char_position([Key_head]),
	Value = PT_value - Key_value,
	if
		Value > 25 ->
			NewValue = Value - 26;
		Value < 0 ->
			NewValue = Value + 26;
		true ->
			NewValue = Value
	end,
	int_to_char(NewValue) ++ vigenereCipher_recursive(PT_tail, Key_tail ++ [Key_head]).

vigenereCipher(PlainText, Key)->
	%KeyLength = string:len(Key),
	%KeyLength.
	vigenereCipher_recursive(PlainText, Key).
exercise2_plaintext()->
	"BWGESSXZWWBVZPZQMOLPDMLAKOKMLV".
exercise2_key()->
	"TESSOFTHEDURBERVILLES".
exercise2()->
	PlainText = exercise2_plaintext(),
	Key = exercise2_key(),
	vigenereCipher(PlainText, Key).

vtest()-> %BDE
	vigenereCipher("ABCABCBBBB", "BCC").
vtest2()-> %expected "BEDDCFBED"
	vigenereCipher("ABCABCABC", "BD").
