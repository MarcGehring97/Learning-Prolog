% Teilaufgabe a)
blau(sonnalm).
blau(vorkogel).
blau(arbiskogel).
blau(plattenalm).
blau(wiesenalm).
rot(isskogel).
schwarz(teufeltal).

start(sonnalm).
start(teufeltal).

endetIn(sonnalm, vorkogel).
endetIn(sonnalm, arbiskogel).
endetIn(vorkogel, isskogel).
endetIn(arbiskogel, plattenalm).
endetIn(plattenalm, wiesenalm).
endetIn(teufeltal, wiesenalm).
endetIn(isskogel, tal).
endetIn(wiesenalm, tal).

% Teilaufgabe b)
% ?- endetIn(X, wiesenalm).
% Ausgabe:
% X = plattenalm ;
% X = teufeltal.

% Teilaufgabe c)
gleicherStartpunkt(X, Y) :- start(X), start(Y).
gleicherStartpunkt(X, Y) :- endetIn(Z, X), endetIn(Z, Y).

% Teilaufgabe d)
erreichbar(X,Y) :- endetIn(X,Y).
erreichbar(X,Z) :- endetIn(X,Y), erreichbar(Y,Z).

% Teilaufgabe e)
moeglicheSchlusspiste(S,S) :- endetIn(S,tal).
moeglicheSchlusspiste(X,S) :- erreichbar(X,S), endetIn(S,tal).

% Teilaufgabe f)
treffpisten(X,Y,T) :- erreichbar(X,T), erreichbar(Y,T), T \= tal.

% Teilaufgabe g)
anfaengerGeeignet(X) :- blau(X), endetIn(X, tal).
anfaengerGeeignet(X) :- blau(X), endetIn(X, Y), anfaengerGeeignet(Y).