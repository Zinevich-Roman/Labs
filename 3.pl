:- dynamic movie/3.    
:- dynamic showing/2. 
init_db :-
    retractall(movie(_,_,_)), retractall(showing(_,_)),
    assertz(movie(1, 'Дюна', 'Фантастика')),
    assertz(movie(2, 'Бэтмен', 'Боевик')),
    assertz(showing('Киномакс', 1)),
    assertz(showing('СинемаПарк', 2)),
    write('БД инициализирована'), nl.
main :-
    repeat,
    nl, write('управление кинотеатрами'), nl,
    write('1. Загрузка БД'), nl,
    write('2. Список фильмов'), nl,
    write('3. Добавить фильм'), nl,
    write('4. Удалить фильм'), nl,
    write('0. Выйти'), nl,
    write('Ввод: '), read(C), action(C), C == 0, !.
action(1) :- init_db, !.
action(2) :- 
    movie(ID, Title, Genre),
    write('ID: '), write(ID), write(' | Фильм: '), write(Title), write(' | Жанр: '), write(Genre), nl, fail.
action(2) :- !.
action(3) :-
    write('ID: '), read(ID), write('Название: '), read(Name), write('Жанр: '), read(Genre),
    assertz(movie(ID, Name, Genre)), write('Успешно'), nl, !.
action(4) :-
    write('ID для удаления: '), read(ID),
    retractall(movie(ID, _, _)), retractall(showing(_, ID)),
    write('Удалено везде'), nl, !.
action(0) :- write('Работа завершена'), nl, !.
action(_) :- write('Некорректный ввод'), nl, !.
