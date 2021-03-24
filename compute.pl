% Consider a binary tree having operators (addition, subtraction, multiplication and divi-
% sion) as non-terminal nodes and operands as leaves. Define a predicate that computes
% the value of such a tree, applying each operator to its two operands (the value of the
% left subtree of the operator and the value of the right subtree of the operator). For
% example, the object tree(+, tree(7, null, null), tree(*, tree(4, null, null),
% tree(3, null, null))) would be equivalent with the expression 7+4*3. Computing the
% value of the tree must end up with 19:

compute(null,0) :- !.
compute(tree(Root,null,null),Root).
compute(tree(+,Left,Right),Result) :- compute(Left,Result1),compute(Right,Result2),Result is Result1+Result2.
compute(tree(-,Left,Right),Result) :- compute(Left,Result1),compute(Right,Result2),Result is Result1-Result2.
compute(tree(*,Left,Right),Result) :- compute(Left,Result1),compute(Right,Result2),Result is Result1*Result2.
compute(tree(/,Left,Right),Result) :- compute(Left,Result1),compute(Right,Result2),Result is Result1/Result2.