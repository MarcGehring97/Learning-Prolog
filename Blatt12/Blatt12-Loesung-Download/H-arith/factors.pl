factors(X,Y) :- X > 0, factorsHelp(X,1,Y).

factorsHelp(X,X,[X]).
factorsHelp(X,N,[N|T]) :-  N < X, 0 is X mod N, 
                            Y is N + 1, factorsHelp(X,Y,T).
factorsHelp(X,N,T) :- N < X, A is X mod N, A > 0, Y is N + 1, factorsHelp(X,Y,T).