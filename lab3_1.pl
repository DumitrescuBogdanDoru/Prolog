% Define a predicate abs(X, Y), that computes Y as the absolute value of X.

absolute(X, Y) :- (X>=0, Y is X, !);
                Y is -X.
               