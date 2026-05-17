% Вариант 17: Добавить элемент в конец списка
add_tail([], Element, [Element]).
add_tail([Head|Tail], Element, [Head|NewTail]) :-
    add_tail(Tail, Element, NewTail).

% Вариант 7: Определить, являются ли два элемента соседними
% Базовый 
adjacent(X, Y, [X, Y | _]).
% Рекурсия
adjacent(X, Y, [_ | Tail]) :- 
    adjacent(X, Y, Tail).
