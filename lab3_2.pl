% Define a predicate fibonacci(N, F), which computes F as the Nth Fibonacci number

fibonacci(0,0) :- !.
fibonacci(1,1) :- !.
fibonacci(N,F) :- N>1,
                Nnew is N-1,
                Nnew2 is N-2,
                fibonacci(Nnew,Fnew),
                fibonacci(Nnew2,Fnew2),
                F is Fnew+Fnew2.