% Write a predicate that counts the leaves of a binary tree. A leaf is a node with no
% successors. Write a predicate count_leaves/2 to count them.

count_leaves(null,Count) :- Count is 0,!.
count_leaves(tree(_,null,null),Count) :- Count is 1,!.
count_leaves(tree(_,Right,Left),Count) :- count_leaves(Left,Count1),
                            count_leaves(Right,Count2),
                            Count is Count1+Count2.