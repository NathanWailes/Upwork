c:-['family.pro'].

% facts

male('Joe').
male('Bill').
male('Paul').

female('Marie').
female('Helen').
female('Miranda').

parent_of('Joe','Helen').
parent_of('Joe','Bill').
parent_of('Marie','Helen').
parent_of('Marie','Bill').
parent_of('Bill','Mike').
parent_of('Helen','Adam').
parent_of('Paul','Miranda').
parent_of('Miranda','Mike').


% rules
sibling_of(X,S):-parent_of(X,P),parent_of(S,P),X\==S.

brother_of(X,B):-sibling_of(X,B),male(B).

sister_of(X,S):-sibling_of(X,S),female(S).

mother_of(X,M):-parent_of(X,M),female(M).

father_of(X,M):-parent_of(X,M),male(M).

gp_of(X,GP):-parent_of(X,P),parent_of(P,GP).

cousin_of(X,C):-
  gp_of(X,GP),
  gp_of(C,GP),
  X\==C,
  not(sibling_of(X,C)).
