% list
% nil is null
% cons is Head and tail
concat(nil, Xs, Xs).
concat(cons(H,Xs), Ys, cons(H,Zs)) :- concat(Xs, Ys, Zs).

