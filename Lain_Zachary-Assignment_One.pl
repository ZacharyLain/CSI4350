% Question 1
% Complete the following exercise in terms of the given relations parent(X,Y), female(X) and male(X) .

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

% Question 2
%