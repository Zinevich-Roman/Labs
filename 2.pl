% Базовый
add_tail([], Element, [Element]).

% Рекурсия
add_tail([Head|Tail], Element, [Head|NewTail]) :-
    add_tail(Tail, Element, NewTail).
