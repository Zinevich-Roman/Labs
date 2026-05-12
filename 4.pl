bool(0). bool(1).
% Полный перебор 
solve_naive(X1, X2, X3) :-
    bool(X1), bool(X2), bool(X3),
    ( (X1=:=1, X2=:=1, X3=:=0) ; (X1=:=0, X2=:=1, X3=:=1) ).
% Оптимизированный перебор
solve_opt(X1, 1, X3) :-
    bool(X1), bool(X3),
    X1 =\= X3.
