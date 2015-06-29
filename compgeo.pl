%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           MEMBRI GRUPPO PROGETTO                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%    NOME/COG:  Matteo Codogno       (730620)                                  %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                    INIT                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Verifica esistenza di un predicato
verify(P) :- current_predicate(P), !.
verify(T, P, Args) :- current_predicate(T), !, P =.. _, apply(P, Args).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  FILE CSV                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

read_points(Filename, Points) :- nonvar(Filename), !, exists_file(Filename), !,
	not( verify(point/2) ), !,
	csv_read_file(Filename, Points, [separator(0'\t), arity(2), functor(point)]),
	maplist(assert, Points).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  GEOMETRY                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

new_point(P, [X, Y]) :- nonvar(P), !, nonvar(X), !, nonvar(Y), !,
	not( verify(point/3, point(P), [X, Y]) ), !, assert(point(P, [X, Y])).

new_point([X, Y]) :- nonvar(X), !, nonvar(Y), !,
	not( verify(point/2, point, [X, Y]) ), !, assert(point([X, Y])).

area2([X1, Y1], [X2, Y2], [X3, Y3], Area) :- nonvar(X1), !, nonvar(Y1), !, 
	nonvar(X2),	!, nonvar(Y2), !, nonvar(X3), !, nonvar(Y3), !, 
	T1 is ((X2 - X1) * (Y3 - Y1)), T2 is ((Y2 - Y1) * (X3 - X1)), 
	Area is T1 - T2.

left(A, B, C) :- nonvar(A), !, nonvar(B), !, nonvar(C), !,
	area2(A, B, C, Area), Area > 0 -> true ; false.

left_on(A, B, C) :- nonvar(A), !, nonvar(B), !, nonvar(C), !,
	area2(A, B, C, Area), Area < 0 -> true ; false.

collinear(A, B, C) :- nonvar(A), !, nonvar(B), !, nonvar(C), !,
	area2(A, B, C, Area), Area < 0 -> true ; false.

angle2d([X1, Y1], [X2, Y2], R) :- nonvar(X1), !, nonvar(Y1), !, nonvar(X2),
	!, nonvar(Y2), !, YExpr is Y1 - Y2, XExpr is X1 - X2, 
	R is atan2(YExpr, XExpr).