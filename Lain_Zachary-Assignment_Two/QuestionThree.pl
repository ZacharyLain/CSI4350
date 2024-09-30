% Question 3

:- discontiguous title/2, publishedBy/2, author/2, publishedIn/2, person/2.

% Facts
% title(Classifier,Title).
% publishedBy(Classifier,Publisher).
% author(Person,Classifier).
% publishedIn(Classifier,Year).
% person(Firstname,Lastname).

% DB Values
% Book 1
title("QA76.642.C39", "Parallel Algorithms").
publishedBy("QA76.642.C39", "CRC Press").
author(person(henri, casanova), "QA76.642.C39").
author(person(arnaud, legrand), "QA76.642.C39").
author(person(yves, robert), "QA76.642.C39").
publishedIn("QA76.642.C39", 2008).

% Book 2
title("QA76.73.C15", "Introduction to C Programming").
publishedBy("QA76.73.C15", "Pearson").
author(person(kernighan, brian), "QA76.73.C15").
author(person(ritchie, dennis), "QA76.73.C15").
publishedIn("QA76.73.C15", 1988).

% Book 3
title("QA76.758.L36", "Operating Systems Concepts").
publishedBy("QA76.758.L36", "Wiley").
author(person(silberschatz, abraham), "QA76.758.L36").
author(person(galvin, peter), "QA76.758.L36").
publishedIn("QA76.758.L36", 2009).

% Book 4
title("QA76.88.A58", "Artificial Intelligence: A Modern Approach").
publishedBy("QA76.88.A58", "Prentice Hall").
author(person(norvig, peter), "QA76.88.A58").
author(person(russell, stuart), "QA76.88.A58").
publishedIn("QA76.88.A58", 2016).

% Book 5
title("QA76.54.P11", "Computer Architecture: A Quantitative Approach").
publishedBy("QA76.54.P11", "Morgan Kaufmann").
author(person(patterson, david), "QA76.54.P11").
author(person(hennessy, john), "QA76.54.P11").
publishedIn("QA76.54.P11", 2011).

% Book 6
title("QA76.345.T67", "Types and Programming Languages").
publishedBy("QA76.345.T67", "MIT Press").
author(person(pierce, benjamin), "QA76.345.T67").
publishedIn("QA76.345.T67", 2002).

% Book 7
title("QA76.73.R55", "The Rust Programming Language").
publishedBy("QA76.73.R55", "No Starch Press").
author(person(klabnik, steve), "QA76.73.R55").
author(person(nichols, carol), "QA76.73.R55").
publishedIn("QA76.73.R55", 2018).

% Book 8
title("QA76.731.S57", "The Art of Computer Programming").
publishedBy("QA76.731.S57", "Addison-Wesley").
author(person(knuth, donald), "QA76.731.S57").
publishedIn("QA76.731.S57", 1997).

% Book 9
title("QA76.89.D64", "Introduction to Machine Learning").
publishedBy("QA76.89.D64", "MIT Press").
author(person(alpaydin, ethem), "QA76.89.D64").
publishedIn("QA76.89.D64", 2014).

% Book 10
title("QA76.54.G67", "Computer Networks").
publishedBy("QA76.54.G67", "Prentice Hall").
author(person(tanenbaum, andrew), "QA76.54.G67").
author(person(wetherall, david), "QA76.54.G67").
publishedIn("QA76.54.G67", 2010).

% Book 11
title("QA76.78.H23", "Compilers: Principles, Techniques, and Tools").
publishedBy("QA76.78.H23", "Pearson").
author(person(aho, alfred), "QA76.78.H23").
author(person(lam, monica), "QA76.78.H23").
author(person(sethi, ravi), "QA76.78.H23").
author(person(ullman, jeffrey), "QA76.78.H23").
publishedIn("QA76.78.H23", 2006).

% Book 12
title("QA76.75.F65", "Clean Code").
publishedBy("QA76.75.F65", "Prentice Hall").
author(person(martin, robert), "QA76.75.F65").
publishedIn("QA76.75.F65", 2008).

% Book 13
title("QA76.34.D65", "Introduction to Automata Theory, Languages, and Computation").
publishedBy("QA76.34.D65", "Pearson").
author(person(hopcroft, john), "QA76.34.D65").
author(person(motwani, rajeev), "QA76.34.D65").
author(person(ullman, jeffrey), "QA76.34.D65").
publishedIn("QA76.34.D65", 2007).

% Book 14
title("QA76.54.D89", "The C Programming Language").
publishedBy("QA76.54.D89", "Prentice Hall").
author(person(kernighan, brian), "QA76.54.D89").
author(person(ritchie, dennis), "QA76.54.D89").
publishedIn("QA76.54.D89", 1988).

% Book 15
title("QA76.642.E44", "Algorithms Unlocked").
publishedBy("QA76.642.E44", "MIT Press").
author(person(cormen, thomas), "QA76.642.E44").
publishedIn("QA76.642.E44", 2013).

%
%
%

% a.
% Author is related to title through classifier, get classifier, check if there are 2 authors, X cannot be Y.
% Used once so that repeats did not appear https://www.swi-prolog.org/pldoc/man?predicate=once/1
multi_authored(Title) :- title(Classifier,Title), once((author(AuthorOne,Classifier), author(AuthorTwo,Classifier),  AuthorOne \= AuthorTwo)).

% b.
% Related through classifier, get classifier by title then check if person is the author of classifier
author_title(Person,Title) :- title(Classifier, Title), author(Person, Classifier).

% c.
% Related through classifier, get classifiers by author then check year published by classifier
author_year(Person,Year) :- author(Person,Classifier), publishedIn(Classifier,Year).

% d.
% Related through classifier, get classifier by title then get year with classifier, check if year is >= 2017
new_book(Title) :- title(Classifier,Title), publishedIn(Classifier,Year), Year >= 2017.

% e.
% Related through classifier, if both people are distinct, and they are the author of same classifier then they are co-authors
coauthor(Person1,Person2) :- author(Person1,Classifier), author(Person2,Classifier), Person1 \= Person2.
