% find the working directory with pwd.
% change the working directory in Prolog with working_directory(CWD, '/Users/Marc/Desktop/RWTH/RWTH Courses/Programmierung/Blatt12').
% then use [blatt12].
% reload with called [blatt12]. again => important to stay lower case

% A3 
% a)
userDefinedList(nil).
userDefinedList(cons(_, X)) :- userDefinedList(X).

% b)
% prologDefinedList([]).
% prologDefinedList([_|X]) :- prologDefinedList(X).

asPrologList([], nil).
asPrologList([A|X], cons(A, Y)) :- asPrologList(X, Y).

% asPrologList([1,2,3], cons(1, cons(2, cons(3, nil)))).

% c)

% reduce both X and Y until one equals 0 => Z is reduced simultaneously and gets increased back once either X or Y equal 0
maximum(X, 0, X).
maximum(0, Y, Y).
maximum(s(X), s(Y), s(Z)) :- maximum(X, Y, Z).

% compare X to every element in XS with maximum => X should be at least as large as every element in XS
maximumList([Y|[]], X) :- maximum(X, Y, X).
maximumList([Y|XS], X) :- maximum(X, Y, X), maximumList(XS, X).

/*
maximumList([s(0), s(s(0)), s(0), 0, s(s(s(0)))], X).  
-> maximumList([s(0)|[s(s(0)), s(0), 0, s(s(s(0)))]], X). 
-> maximum(X, s(0), X), maximumList([s(s(0))|[s(0), 0, s(s(s(0)))]], X).
-> maximum(X, s(0), X), maximum(X, s(s(0)), X), maximumList([s(0))|[0, s(s(s(0)))]], X).
-> maximum(X, s(0), X), maximum(X, s(s(0)), X), maximum(X, s(0), X), maximumList([0|[s(s(s(0)))]], X).
-> maximum(X, s(0), X), maximum(X, s(s(0)), X), maximum(X, s(0), X), maximum(X, 0, X), maximumList([s(s(s(0)))|[]], X).
-> maximum(X, s(0), X), maximum(X, s(s(0)), X), maximum(X, s(0), X), maximum(X, 0, X), maximum(X, s(s(s(0)))), X).
-> X = s(s(s(0))) 
*/

% d)

remove([X|XS], X, XS).
remove([Y|YS], X, [Y|XS]) :- remove(YS, X, XS).

/* 
remove([s(0), s(s(0)), s(0), 0, s(s(s(0)))], s(0), XS).
-> remove([s(0), [s(s(0)), s(0), 0, s(s(s(0)))]], s(0), [s(s(0)), s(0), 0, s(s(s(0)))]]).
remove([s(s(0)), s(0), 0, s(s(s(0)))], s(0), XS).
-> remove([s(s(0)), [s(0), 0, s(s(s(0)))]], s(0), [s(s(0))|XS]).
-> remove([s(0), 0, s(s(s(0)))], s(0), XS).
-> remove([s(0), [0, s(s(s(0)))]], s(0), XS).
-> remove([s(0), [0, s(s(s(0)))]], s(0), [0, s(s(s(0)))]).
-> remove([s(0), [0, s(s(s(0)))]], s(0), [s(s(0)), 0, s(s(s(0)))]).
*/

% e)

% YS is XS in descending order
% append Y in front of YS => Y is the maximum of XS that gets removed from XS
sortList([X|[]], [X]).
sortList(XS, [Y|YS]) :- maximumList(XS, Y), remove(XS, Y, ZS), sortList(ZS, YS).

/* 
sortList([s(0), s(s(0)), s(0), 0, s(s(s(0)))], YS).
-> sortList([s(0), s(s(0)), s(0), 0, s(s(s(0)))], [s(s(s(0)))|YS]).
-> sortList([s(0), s(s(0)), s(0), 0], [s(s(0))|YS]).
-> sortList([s(0), s(0), 0], [s(0)|YS]).
-> sortList([s(0), 0], [s(0)|YS]).
-> YS = [0]
*/

% f)

% base case
flattenConsecutive([[A|[]]|[]], [A]).
% skipping empty lists
flattenConsecutive([X, []|XS], Z) :- flattenConsecutive([X|XS], Z).
flattenConsecutive([[], X|XS], Z) :- flattenConsecutive([X|XS], Z).
% when the first list has at least 2 elements
flattenConsecutive([[A, A|X]|XS], Z) :- flattenConsecutive([[A|X]|XS], Z).
flattenConsecutive([[A, B|X]|XS], [A|Z]) :- flattenConsecutive([[B|X]|XS], Z).
% at the intersection of two consecutive lists => when the first list has one element left
flattenConsecutive([[A|[]], [A|X]|XS], Z) :- flattenConsecutive([[A|X]|XS], Z).
flattenConsecutive([[A|[]], [B|X]|XS], [A|Z]) :- flattenConsecutive([[B|X]|XS], Z).

% flattenConsecutive([[1, 1, 3, 2], [], [2, 4]], X). 
% solution depends on the order of the predicates 
% => the pattern of the second flattenConsecutive matches, as well as for some later flattenConsecutives

% g)

% tree/2 => hat Konstante v/0 und Funktion children/n als Argumente => children/n ist beispielsweise eine Liste von trees

% h)

flattenConsecutiveTree(tree(V, []), V).
flattenConsecutiveTree(tree(V1, [tree(V2, Children2)|Children1]), Res) :- append(Res1, Res2, Res), flattenConsecutiveTree(tree(V2, Children2), Res1), flattenConsecutiveTree(tree(V1, Children1), Res2).

/*
flattenConsecutiveTree(tree([1, 2, 3], [tree([], [tree([3], []), tree([3, 7], [])]), tree([], []), tree([7, 15], [tree([7, 7], [])])]), X).
flattenConsecutiveTree(tree([1, 2, 3], [tree([], [tree([3], []), tree([3, 7], [])])|tree([], []), tree([7, 15], [tree([7, 7], [])])], X)
V1 = [1, 2, 3]; V2 = []
-> 1.
-> flattenConsecutiveTree(tree([], [tree([3], []), tree([3, 7], [])]), Res1)
-> flattenConsecutiveTree(tree([], [tree([3], [])|[tree([3, 7], [])]]), Res1)
V1 = []; V2 = [3]; Children1 = [tree([3, 7], [])]; Children2 = []
-> 1.1
-> flattenConsecutiveTree(tree([3], [], Res1') => Res1' = [3]
-> 1.2 
-> flattenConsecutiveTree(tree([], [tree([3, 7], [])]), Res2').
-> flattenConsecutiveTree(tree([], [tree([3, 7], [])|[]]), Res2').
V1 = []; V2 = [3, 7]; Children1 = []; Children2 = []
-> 1.2.1 => Res1'' = [3, 7], Res2'' = [] => Res'' = [3, 7] = Res2' => Res' = [3, 7] = Res1
-> ...
*/

append([], [], []).
append([X|[]], [], [X]).
append([], [Y|[]], [Y]).
append([X, X|XS], YS, Res) :- append([X|XS], YS, Res).
append([X1, X2|XS], YS, [X1|Res]) :- append([X2|XS], YS, Res).
append([X|[]], [X|YS], Res) :- append([], [X|YS], Res).
append([X|[]], [Y|YS], [X|Res]) :- append([], [Y|YS], Res).
append([], [Y, Y|YS], Res) :- append([], [Y|YS], Res).
append([], [Y1, Y2|YS], [Y1|Res]) :- append([], [Y2|YS], Res).

/*
append([1, 2, 2, 3], [3, 4, 4, 4], X).
-> append([1, 2|[2, 3]], [3, 4, 4, 4], [1|X]). -> append([2, 2, 3], [3, 4, 4, 4], X).
-> append([2, 2|[3]], [3, 4, 4, 4], X). -> append([2, 3], [3, 4, 4, 4], X).
-> append([2, 3|[]], [3, 4, 4, 4], [2|X]). -> append([3], [3, 4, 4, 4], X).
-> append([3|[]], [3|[4, 4, 4]], X). -> append([], [3, 4, 4, 4], X).
-> ...
*/

