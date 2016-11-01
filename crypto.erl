-module(crypto).
-export([start/1, charv/1, caeser/2]).

start(N) ->
	Str = "abcdef",
	io:format("~w", "a"),
	X = N * N,
	Y = X - 3,
	Y.
charv(C) ->
	Letter = hd(C),
	io:fwrite("The letter character is: ["),
	io:fwrite(integer_to_list(Letter)),
	io:fwrite("]"), 	
	if
		Letter == 97 ->
			a;
		Letter == 122 ->
			z;
		true ->
			'not sure'
	end.

caeser(Char, Offset) ->
	Value = hd(Char),
	NewValue = Offset,
	%io:fwrite("Old: ["+Char+"]"),
	io:fwrite("New: [new]").
