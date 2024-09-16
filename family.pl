gp(X,Y) :- p(X,Z),p(Z,Y).

p(X,Y) :- f(X,Y).
p(X,Y) :- m(X,Y).

f(adam,bill).
f(bill,carl).
m(anne,bill).
m(alice,carl).