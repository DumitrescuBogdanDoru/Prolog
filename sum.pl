% Define a predicate that adds all the keys of a binary tree. It should have the generic
% form add(Tree, S) meaning "The sum of all keys in the tree called Tree is S ".

add(null,S) :- S is 0,!.
add(tree(Root,Left,Right),S) :- add(Left,S1),
                                add(Right,S2),
                                S is S1+S2+Root.