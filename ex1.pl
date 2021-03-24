% Consider having the father relationship, defined like this: father(X, Y) means: "X is the father of Y ". 
% Create a knowledge base containing about eight father facts. Now, define the following relationships using the father relationship:
% 1. child(X, Y), meaning: "X is the child of Y"
% 2. brother(X, Y), meaning: "X is the brother of Y"
% 3. nephew(X, Y), meaning: "X is the nephew of Y"
% 4. grandchild(X, Y), meaning: "X is the grandchild of Y" 
% 5. predecessor(X, Y), meaning: "X is the predecessor of Y"


father(adam,child1).
father(adam,child2).
father(adam,child3).
father(child1,child11).
father(child2,child21).
father(child3,child31).
father(child3,child32).
father(child3,child33).

child(X,Y) :- father(Y,X).
brother(X,Y) :- father(Z,X),father(Z,Y),not(X=Y).
nephew(X,Y) :- brother(Z,Y),father(Z,X).
grandchild(X,Y) :- father(Y,Z),father(Z,X).
predecessor(X,Y) :- father(X,Y);(father(X,Z),predecessor(Z,Y)).