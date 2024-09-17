% To compile
% ['Lain_Zachary-Assignment_One.pl'].

% Complete the following exercise in terms of the given relations parent(X,Y), female(X) and male(X).

% Define a mother predicate so that mother(X,Y) says that X is the mother of Y.
mother(X,Y) :- parent(X,Y), female(X).

% Define a father predicate so that father(X,Y) says that X is the father of Y.
father(X,Y) :- parent(X,Y), male(X).

% Define a sister predicate so that sister(X,Y) says that X is a sister of Y. 
% X must be a female, X cannot be Y, X and Y must share a parent
% Used once so that repeats (have same mother and same father) did not appear https://www.swi-prolog.org/pldoc/man?predicate=once/1
sister(X,Y) :- female(X), X \= Y, once((parent(Z,X), parent(Z,Y))).

% Define a grandson predicate so that grandson(X,Y) says that X is a grandson of Y
% X must be male, Y can be male or female, X must have a parent Z whose parent is is Y 
grandson(X,Y) :- male(X), parent(Z,X), parent(Y,Z).

% Define a descendant predicate so that descendant(X,Y) says that X is a descendant of Y.
% X must have some parental lineage which leads to Y
% Base case
descendant(X,Y) :- parent(Y,X).

% Recursive case
descendant(X,Y) :- parent(Y,Z), descendant(X,Z).

% Example
parent(adam,bill).
parent(bill,carl).
parent(bill,mary).
parent(bill,peter).
parent(bill,kathy).
parent(anne,carl).
parent(anne,peter).
parent(anne,mary).
parent(anne,kathy).
male(adam).
male(bill).
male(carl).
male(peter).
female(anne).
female(mary).
female(kathy).

% Setup for the Peanos number questions
nat(0).
nat(s(N)) :- nat(N).

plus(0,X,X) :- nat(X).
plus(s(X),Y,s(Z)) :- plus(X,Y,Z).

mult(0,X,0) :- nat(X).
mult(s(X),Y,Z) :- mult(X,Y,W),plus(Y,W,Z).

% Base case, 0 is even
even(0).

% A number is even if 2 successors after it is even
% 2+2=4 which is even, 4+2=6, etc.
% 1+2=3 which is odd, 3+2=5, etc.
even(s(s(N))) :- even(N).

% Define a binary predicate named divisor such that divisor(X,Y) is true if and only if 
% X is a multiple of Y where X and Y are Peano’s numbers.

% Subtraction rule defined with Peano numbers
subtract(0, Y, Y) :- nat(Y).
subtract(s(X), s(Y), Z) :- subtract(X, Y, Z).

% Divisor definition
% Base case, any number divides zero
divisor(X, 0) :- nat(X).

% Recursive case.
divisor(X, Y) :- subtract(X, Y, Z), divisor(X, Z).