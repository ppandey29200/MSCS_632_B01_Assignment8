% --- Basic Relationships ---
parent(john, mary).
parent(john, mike).
parent(susan, mary).
parent(susan, mike).

parent(mary, tom).
parent(mary, anna).
parent(bob, tom).
parent(bob, anna).

parent(mike, jake).
parent(lisa, jake).

male(john).
male(bob).
male(mike).
male(tom).
male(jake).

female(susan).
female(mary).
female(lisa).
female(anna).

% --- Derived Relationships ---

% Child (inverse of parent)
child(X, Y) :- parent(Y, X).

% Grandparent
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Sibling (same parent, not the same person)
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Cousin (their parents are siblings)
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

% Descendant (recursive)
descendant(X, Y) :- parent(Y, X).
descendant(X, Y) :- parent(Y, Z), descendant(X, Z).

% --- Sample Queries via Initialization ---

:- initialization(main).

main :-
    writeln('--- Family Tree Query Results ---'),

    writeln('\nChildren of john:'),
    findall(Child, child(Child, john), Children1),
    writeln(Children1),

    writeln('\nSiblings of mary:'),
    findall(Sib, sibling(mary, Sib), Siblings1),
    writeln(Siblings1),

    writeln('\nIs tom a cousin of jake?'),
    ( cousin(tom, jake) -> writeln('Yes') ; writeln('No') ),

    writeln('\nGrandparents of jake:'),
    findall(GP, grandparent(GP, jake), GPs),
    writeln(GPs),

    writeln('\nDescendants of john:'),
    findall(D, descendant(D, john), Desc),
    writeln(Desc),

    halt.
