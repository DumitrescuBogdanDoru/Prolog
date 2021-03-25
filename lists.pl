/*
1. Define a predicate for inserting elements in a list. Its generic form will be inserting(Item
, List , NewList) meaning "Inserting the item called Item in the list called List leads
to a new list called NewList ". It must provide all possible solutions, like in the example
below:
?- inserting(1,[2,3],Result).
Result = [1,2,3] ;
Result = [2,1,3] ;
Result = [2,3,1] ;
false.
*/

inserting(Item, [], [Item]):-!.
inserting(Item, List, [Item|List]).
inserting(Item,[Head|Tail],[Head|NewTail]) :- inserting(Item, Tail, NewTail).

/*
2. Define a predicate that removes a single occurrence of an item from a list, providing all
possible solutions. This predicate should match the behavior presented below:
?- deleting-one(1,[1,2,1],Result).
Result = [2,1] ;
Result = [1,2] ;
false.
*/

deleting-one(Item,[Item|Tail],Tail).
deleting-one(Item,[Head|Tail],[Head|NewTail]) :- deleting-one(Item,Tail,NewTail).

/*
3. Define a predicate that removes all occurrences of an item from a list. This predicate
should match the behavior presented below:
?- deleting-all(1,[1,2,3,1],Result).
Result = [2,3] ;
false.
*/

deleting-all(Item,[Item],[]).
deleting-all(Item,[Item|Tail],NewTail) :- deleting-all(Item,Tail,NewTail).
deleting-all(Item,[Head|Tail],[Head|NewTail]):- Head =\= Item, deleting-all(Item,Tail,NewTail).

/*
4. Create a list containing all integers within a given range.
?- range(2,8,Result).
Result = [2,3,4,5,6,7,8] ;
false.
*/

range(X,Y,[]) :- Y < X.
range(X,X,[X]).
range(X,Y,[X|Tail]) :- Y > X, X1 is X+1, range(X1,Y,Tail).

/*
5. Define a predicate that rotates a list towards right for a number of times.
?- rotate([1,5,4,6,2,3],1,Result).
Result = [3,1,5,4,6,2] ;
false.
?- rotate([1,5,4,6,2,3],3,Result).
Result = [6,2,3,1,5,4] ;
false.
*/

last_el([_|Tail], X):-
	append(_,[X],Tail).

rotate(List, 0, List):-!.
rotate(List, D, Rez):-
	NewD is D-1,
	append(HeadList,[LastEl],List),
	append([LastEl], HeadList, RotatedList),
	rotate(RotatedList, NewD, Rez).

/*
6. Flatten a nested list structure like in the examples below. There is a predefined predicate
called flatten that does exactly the same thing. However, you are not allowed to use
it in your implementation. HINT: You can use the predefined predicates is_list and
append.
?- flatten-list([1,2,3,[4,[5,6,7],8],9],Result).
Result = [1,2,3,4,5,6,7,8,9] ;
false.
*/

flatten_list([X],[X]):-!.
flatten_list([Head|Tail],R) :-
	is_list(Head),flatten_list(Head,R1),flatten_list(Tail,R2),append(R1,R2,R);
	flatten_list(Tail,R1),append([Head],R1,R),!.

/*
7. Define a predicate that reverses a list. There is a predefined predicate called reverse
that does exactly the same thing. However, you are not allowed to use it in your imple-
mentation.
?- inverting([3,4,2,5,1],Result).
Result = [1,5,2,4,3] ;
false.
*/

inverting([],[]):-!.
inverting([Head|Tail],Rez) :-
	inverting(Tail,R1),
	append(R1,[Head],Rez).

/*
8. Define a predicate that duplicates the elements of a list in the manner presented below:
?- duplicate([1,2,3],Result).
Result = [[1,1],[2,2],[3,3]] ;
false.
*/

duplicate([],[]).
duplicate([Head],Result) :- append([[Head,Head]],[],Result),!.
duplicate([Head|Tail],Result) :- duplicate(Tail,Result1),
                                append([[Head,Head]],Result1,Result).