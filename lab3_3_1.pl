%  Define a predicate divisor(X, Y, D) meaning "D is the biggest divisor of both X and Y" and working like in the example below. 
% You can use the Euclid algorithm to determine the biggest common divisor of X and Y.

gcd(X,0) :- X.
gcd(X,Y) :- Y =\= 0, Z = Y, Y = X mod Z, gcd(Z,y).
divisor(X,Y,D) -: D is gcd(X,Y).