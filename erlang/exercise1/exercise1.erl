-module(exercise1).
-export([start/0]).

cipher_text()->
	"GWHKOGWADCGGWPZSHCHVWBYCTFSHIFBWBUHCHVSJWQOFOUSOBUSZGKWTSTSZHOZACGHOGWTGVSVORPSSBVCIBRSRIDHVOHVWZZZWYSOGQCFBSRHVWBUPMHVCGSHCVSFGIDSFTWBSQZSFWQGWBBCQSBHZMOGHVSGZWUVHVORPSSBWBTZWQHSRWHKOGGCASKVOHIBTCFHIBOHSHVOHGVSVORSBQCIBHSFSRHVSGCBGOBRBCHHVSTOHVSFKVCRSGDWHSVWGBOFFCKBSGGKOGTOFZSGGGHOFQVSROBRWFCBSRHVOBHVSMOBRVORHCHVSTIZZHVSUWTHCTQVOFWHMOGGVSOUOWBHVCIUVHCTVSFRIGHMPCCHGGVSOZACGHDWHWSRHVCGSVOPWZWASBHGTCFHVSEIWNNWBUHCKVWQVHVSMVORPSSBGIPXSQHSROBRTSZHVCKVCDSZSGGZWTSKOGTCFHVSWFCKBSFOVGVSGOWRGHWZZGWUVWBUWBDWHMCTVSFGSZTHVSMRWRBHYBCKHVOHWKCFSHVCGSCJSFHVSFCIUVSGHDOFHCTHVSFCORHCGOJSHVSGSDFSHHMCBSGVSPCIUVHTCFASBCHVSMRWRBCHYBCKWHOBRHVSMRWRBHHVWBYHVOHVSQVCGSHVSQCZCIFCAMDFSHHMTFCQYBCVCKQCIZRHVSMWTHVSMVORYBCKBDSFVODGHVSMKCIZRBCHVOJSQOFSRTCFHVSMRCBHQOFSAIQVTCFVWADCCFHVWBUHVSBGVSUFWSJSRTCFHVSPSZCJSRAOBKVCGSQCBJSBHWCBOZGHOBROFRCTXIRUSASBHVORQOIGSRVSF".

shift_letter(Letter, KeyValue)->
	LetterValue = hd(Letter),
	NewValue = LetterValue + KeyValue,

	if
		NewValue > 90 ->
			[NewValue - 26];
		NewValue < 65 ->
			[NewValue + 26];
		true ->
			[NewValue]		
	end.

caesar_decrypt([Head|[]], Key)->
	shift_letter([Head], Key);
caesar_decrypt([Head|Tail], Key)->
	shift_letter([Head], Key) ++ caesar_decrypt(Tail, Key).

% debug_print([{X,Y}|[]])->
% 	io:fwrite("[{"++integer_to_list(X)++","++integer_to_list(Y)++"}]\n");
% debug_print([{X,Y}|Tail])->
% 	io:fwrite("[{"++integer_to_list(X)++","++integer_to_list(Y)++"}]\n"),
% 	debug_print(Tail).


countWordsInString(Text, Matcher) ->
	countWordsInString(Text, Matcher, 0).
countWordsInString(Text, Matcher, Count) ->
	Pos = string:str(Text, Matcher),
	if 
		Pos > 0 ->
			countWordsInString(string:substr(Text, Pos + 1), Matcher, Count + 1);
		true ->
			Count
	end.


testLoop(Index, FinishIndex, CipherText, Matcher) ->
	testLoop(Index, FinishIndex, CipherText, Matcher, []).

testLoop(Index, FinishIndex, CipherText, Matcher, Array) ->
	PlainText = caesar_decrypt(CipherText, Index),
	Count = countWordsInString(PlainText, Matcher),

	Tuple = {Index, Count},
	if 
		Index < FinishIndex ->
			testLoop(Index + 1, FinishIndex, CipherText, Matcher, [Tuple | Array]);
		true ->
			[Tuple | Array]
	end.

get_first_elem([{A,B}|_]) ->
	{A,B}.

start()->
	CipherText = cipher_text(),



	Array = testLoop(0, 25, CipherText, "THE"),
	SortedArray = lists:reverse(lists:keysort(2, Array)),

	{KeyR, _} = get_first_elem(SortedArray),

	PlainTextReal = caesar_decrypt(CipherText, KeyR),
	PlainText30 = string:sub_string(PlainTextReal, 1, 30),
	io:fwrite("Key ["++integer_to_list(KeyR)++"]:\n"++PlainText30++"\n"),

	ok.



