% Факты
fruit(peach). fruit(apple).
color(peach, yellow). color(orange, orange). color(apple, red).
likes(mary, peach). likes(mary, corn). likes(mary, apple).

% Правила: Бет любит то, что любит Мэри, если это фрукт и он красный.
likes(beth, X) :- likes(mary, X), fruit(X), color(X, red).
% Бет любит то, что любит Мэри, если это кукуруза.
likes(beth, X) :- likes(mary, X), X = corn.
