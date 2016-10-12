-module(caesar).
-export([single_char/2, start/2, dox/1]).

single_char(Char, Offset) ->
	CharValue = hd(Char),
	NewValue = CharValue + Offset,
	NewChar = [NewValue],
	
	% LOWER CASE CHARS
	% a == 97
	% z == 122
	LowerCase = ((CharValue >= 97) and (CharValue =< 122)),
	
	% UPPERCASE CHARS
	% A == 65
	% Z == 90
	UpperCase = ((CharValue >= 65) and (CharValue =< 90)),

	if
		LowerCase ->
			if 
				NewValue < 97 ->
					NewModValue = NewValue + 26;
				NewValue > 122 ->
					NewModValue = NewValue - 26;
				true ->
					NewModValue = NewValue
			end;
		UpperCase ->
			if
				NewValue < 65 ->
					NewModValue = NewValue + 26;
				NewValue > 90 ->
					NewModValue = NewValue - 26;
				true ->
					NewModValue = NewValue
			end;
		true ->
			NewModValue = NewValue
	end,	
	%NewChar = io:format("~c", [NewValue]),
	%NewChar = integer_to_binary(NewValue, 255),
	%io:fwrite("Old: " ++ integer_to_list(CharValue) ++ "(" ++ [CharValue] ++ ")\n"),
	%io:fwrite("New: " ++ integer_to_list(NewValue) ++ "(" ++ [NewValue] ++ ")\n"),
	%io:fwrite("NewModValue: " ++ integer_to_list(NewModValue) ++ "(" ++ [NewModValue] ++ ")\n").
	[NewModValue].
start([S|[]], Offset, Decrypted) ->
	single_char([S], Offset);
start([S|Tail], Offset, Decrypted) ->
	single_char([S], Offset) ++ start(Tail, Offset, Decrypted).
start(Str, Offset) ->
	start(Str, Offset, []).
dox(Offset) -> %Exercise 1
	start("GWHKOGWADCGGWPZSHCHVWBYCTFSHIFBWBUHCHVSJWQOFOUSOBUSZGKWTSTSZHOZACGHOGWTGVSVORPSSBVCIBRSRIDHVOHVWZZZWYSOGQCFBSRHVWBUPMHVCGSHCVSFGIDSFTWBSQZSFWQGWBBCQSBHZMOGHVSGZWUVHVORPSSBWBTZWQHSRWHKOGGCASKVOHIBTCFHIBOHSHVOHGVSVORSBQCIBHSFSRHVSGCBGOBRBCHHVSTOHVSFKVCRSGDWHSVWGBOFFCKBSGGKOGTOFZSGGGHOFQVSROBRWFCBSRHVOBHVSMOBRVORHCHVSTIZZHVSUWTHCTQVOFWHMOGGVSOUOWBHVCIUVHCTVSFRIGHMPCCHGGVSOZACGHDWHWSRHVCGSVOPWZWASBHGTCFHVSEIWNNWBUHCKVWQVHVSMVORPSSBGIPXSQHSROBRTSZHVCKVCDSZSGGZWTSKOGTCFHVSWFCKBSFOVGVSGOWRGHWZZGWUVWBUWBDWHMCTVSFGSZTHVSMRWRBHYBCKHVOHWKCFSHVCGSCJSFHVSFCIUVSGHDOFHCTHVSFCORHCGOJSHVSGSDFSHHMCBSGVSPCIUVHTCFASBCHVSMRWRBCHYBCKWHOBRHVSMRWRBHHVWBYHVOHVSQVCGSHVSQCZCIFCAMDFSHHMTFCQYBCVCKQCIZRHVSMWTHVSMVORYBCKBDSFVODGHVSMKCIZRBCHVOJSQOFSRTCFHVSMRCBHQOFSAIQVTCFVWADCCFHVWBUHVSBGVSUFWSJSRTCFHVSPSZCJSRAOBKVCGSQCBJSBHWCBOZGHOBROFRCTXIRUSASBHVORQOIGSRVSF", Offset).
