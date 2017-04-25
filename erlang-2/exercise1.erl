-module(exercise1).
-export([start/0]).
-compile([{nowarn_unused_function}]).

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

characterFrequenciesStart() ->
	[0.08167,0.01492,0.02782,0.04253,0.12702,0.02228,0.02015,0.06094,0.06966,0.00153,0.00772,0.04025,0.02406,0.06749,0.07507,0.01929,0.00095,0.05987,0.06327,0.09056,0.02758,0.00978,0.02360,0.00150,0.01974,0.00074].

characterFrequencies([Head|Tail], N) ->
	if
		N > 0 ->
			characterFrequencies(Tail, N - 1);
		true ->
			Head			
	end.

getCharacterFrequency(N) ->
	characterFrequencies(characterFrequenciesStart(), N).


chiSquaredLetterLoop(Letter, FinishLetter, PlainText, Value) ->
	Expected = string:len(PlainText) * getCharacterFrequency(hd(Letter) - 65),
	Frequency = countWordsInString(PlainText, Letter),

	FreqMinusExpected = Frequency - Expected,
	ChiSquared = (FreqMinusExpected * FreqMinusExpected) / Expected,
	% io:fwrite("Letter: ["++Letter++"] {"++integer_to_list(hd(Letter) - 65)++"} FME - ["++float_to_list(FreqMinusExpected, [{decimals, 5}])++"]\n"),


	if
		Letter == FinishLetter ->
			Value + ChiSquared;
		true ->
			chiSquaredLetterLoop([hd(Letter)+1], FinishLetter, PlainText, Value + ChiSquared)
	end.

chiSquared(PlainText) ->
	%For each letter [A -> Z]
	%% Expected amount of letters [PlainText.length * characterFrequency[letter]]
	chiSquaredLetterLoop("A", "Z", PlainText, 0).

keyLoop(Index, FinishIndex, CipherText, Array) ->
	PlainText = caesar_decrypt(CipherText, Index),
	ChiSquared = chiSquaredLetterLoop("A", "Z", PlainText, 0),
	io:fwrite("With a key of ["++integer_to_list(Index)++"] - ["++float_to_list(ChiSquared, [{decimals, 5}])++"]\n"),
	% ChiSquared = "64254325.f",
	Tuple = {Index, ChiSquared},
	if 
		Index < FinishIndex ->
			keyLoop(Index + 1, FinishIndex, CipherText, [Tuple | Array]);
		true ->
			[Tuple | Array]
	end.

start()->
	CipherText = cipher_text(),

	% Array = testLoop(0, 25, CipherText, "THE"),
	% SortedArray = lists:reverse(lists:keysort(2, Array)),

	% {KeyR, _} = get_first_elem(SortedArray),

	% PlainTextReal = caesar_decrypt(CipherText, KeyR),
	% PlainText30 = string:sub_string(PlainTextReal, 1, 30),
	% io:fwrite("Key ["++integer_to_list(KeyR)++"]:\n"++PlainText30++"\n\n"),


	% CharFreqA = getCharacterFrequency(0),
	% io:fwrite("Character Frequency A: ["++float_to_list(CharFreqA, [{decimals, 5}])++"]\n"),
	% CharFreqB = getCharacterFrequency(1),
	% io:fwrite("Character Frequency B: ["++float_to_list(CharFreqB, [{decimals, 5}])++"]\n"),
	% CharFreqZ = getCharacterFrequency(25),
	% io:fwrite("Character Frequency Z: ["++float_to_list(CharFreqZ, [{decimals, 5}])++"]\n\n"),

	% ChiSquareValueKey0 = chiSquared(CipherText),
	% io:fwrite("For a key of 0 chi-squared: ["++float_to_list(ChiSquareValueKey0, [{decimals, 5}])++"]\n"),

	Array = keyLoop(0, 25, CipherText, []),
	SortedArray = lists:keysort(2, Array),

	{Key, ChiSq} = get_first_elem(SortedArray),
	io:fwrite("Key ["++integer_to_list(Key)++"] ChiSquared ["++float_to_list(ChiSq, [{decimals, 5}])++"]\n"),

	PlainTextNew = caesar_decrypt(CipherText, Key),
	io:fwrite("With key ["++integer_to_list(Key)++"] PlainText:\n"++PlainTextNew++"\n"),

	ok.



