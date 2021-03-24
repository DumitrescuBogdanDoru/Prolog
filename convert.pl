% Define a predicate for converting an arithmetic expression that uses the +, -, * and
% / operators into a binary tree that has operators as non-terminal nodes and operands
% as leaves. It should have the generic form converting(Expression, Tree), meaning
% "Converting the arithmetic expression Expression leads to the binary tree called Tree "
% and should work bidirectionally:

converting(Expression,tree(Expression,null,null)) :- number(Expression).
converting(X+Y,tree(+,Left,Right)) :- converting(X,Left),converting(Y,Right).
converting(X-Y,tree(-,Left,Right)) :- converting(X,Left),converting(Y,Right).
converting(X*Y,tree(*,Left,Right)) :- converting(X,Left),converting(Y,Right).
converting(X/Y,tree(/,Left,Right)) :- converting(X,Left),converting(Y,Right).