% Teilaufgabe a)
istUnterkunft(wh).
istUnterkunft(bh).
istUnterkunft(sh).
istUnterkunft(ph).
istUnterkunft(jh).
istUnterkunft(fb).

hatEinenStern(ph).
hatZweiSterne(sh).
hatDreiSterne(jh).
hatVierSterne(wh).
hatFuenfSterne(bh).
hatFuenfSterne(fb).

% Teilaufgabe b)
% ?- hatFuenfSterne(X).
% Ausgabe:
% X = bh ;
% X = fb.

% Teilaufgabe c)
hatEinenSternWeniger(X, Y) :- hatEinenStern(X), hatZweiSterne(Y).
hatEinenSternWeniger(X, Y) :- hatZweiSterne(X), hatDreiSterne(Y).
hatEinenSternWeniger(X, Y) :- hatDreiSterne(X), hatVierSterne(Y).
hatEinenSternWeniger(X, Y) :- hatVierSterne(X), hatFuenfSterne(Y).

% Teilaufgabe d)
% ?- hatEinenSternWeniger(_, Y).
% Ausgabe:
% Y = sh ;
% Y = jh ;
% Y = wh ;
% Y = bh ;
% Y = fb.

% Teilaufgabe e)
hatWenigerSterne(X, Y) :- hatEinenSternWeniger(X, Y).
hatWenigerSterne(X, Y) :- hatEinenSternWeniger(X, Z), hatWenigerSterne(Z, Y).

