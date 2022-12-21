squares(1, [1]).
squares(N, [NN,T2|R]) :- N > 1, 
                         T is N - 1, 
                         squares(T, [T2|R]), 
                         NN is T2 + 2*T + 1.