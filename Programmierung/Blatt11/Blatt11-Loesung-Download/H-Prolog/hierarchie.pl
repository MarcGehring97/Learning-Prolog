% Teilaufgabe a)
person(jgi).
person(dcl).
person(sdo).
person(nlo).
person(dme).
person(fme).
person(jdr).
person(fru).
person(fai).
person(ner).
person(mus).

hatRang(jgi, professor).
hatRang(dcl, assistent).
hatRang(sdo, assistent).
hatRang(nlo, assistent).
hatRang(dme, assistent).
hatRang(fme, assistent).
hatRang(jdr, hiwi).
hatRang(fru, hiwi).
hatRang(fai, student).
hatRang(ner, student).
hatRang(mus, student).

% Teilaufgabe b)
% ?- hatRang(X, assistent).
% Ausgabe:
% X = dcl ;
% X = sdo ;
% X = nlo ;
% X = dme ;
% X = fme.

% Teilaufgabe c)
bossVon(X, Y) :- hatRang(X, professor), hatRang(Y, assistent).
bossVon(X, Y) :- hatRang(X, assistent), hatRang(Y, hiwi).
bossVon(X, Y) :- hatRang(X, hiwi), hatRang(Y, student).

% Teilaufgabe d)
% ?- bossVon(X, _).
% Ausgabe:
% X = jgi ;
% X = jgi ;
% X = jgi ;
% X = jgi ;
% X = jgi ;
% X = dcl ;
% X = dcl ;
% X = sdo ;
% X = sdo ;
% X = nlo ;
% X = nlo ;
% X = dme ;
% X = dme ;
% X = fme ;
% X = fme ;
% X = jdr ;
% X = jdr ;
% X = jdr ;
% X = fru ;
% X = fru ;
% X = fru ;
% false.

%Teilaufgabe e)
hatGleichenRang(X,Y) :- person(X), person(Y), hatRang(X,R), hatRang(Y,R).

% Teilaufgabe f)
vorgesetzt(B, S) :- bossVon(B, S).
vorgesetzt(B, S) :- bossVon(B, X), vorgesetzt(X, S).

