%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           MEMBRI GRUPPO PROGETTO                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%    NOME/COG:  Matteo Codogno       (730620)                                  %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                    INIT                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

verify(P) :- current_predicate(P), !.
verify(T, P, Args) :- current_predicate(T), !, P =.. _, apply(P, Args).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                    LIST                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rem([], []) :- !.
rem([X], [X]) :- !.
rem([X,X | Tail], [X | Tail]) :- !.
rem([X | Xs],Res) :- rem(Xs,Res0), append([X], Res0, Res).

printlist([]) :- !.
printlist([X | List]) :- write(X), nl, printlist(List).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                    STACK                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pop(E, [E | Es], Es).

peek(E, [E | _]).

push(E, Es, [E | Es]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  FILE CSV                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

read_points(Filename, Points) :- nonvar(Filename), !, exists_file(Filename), !,
	csv_read_file(Filename, Rows, [separator(0'\t), arity(2), functor(point)]),
	rem(Rows, Points), maplist(assert, Points).

remove_all_points :- retract(point(_, _)), fail.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                  GEOMETRY                                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

new_point(P, [X, Y]) :- nonvar(P), !, nonvar(X), !, nonvar(Y), !,
	not( verify(point/3, point(P), [X, Y]) ), !, assert(point(P, [X, Y])).

new_point([X, Y]) :- nonvar(X), !, nonvar(Y), !,
	not( verify(point/2, point, [X, Y]) ), !, assert(point([X, Y])).

get_coordinate(P, X, Y) :- nonvar(P), !, arg(1, P, X), arg(2, P, Y).

get_min_point([Elem], Elem) :- !.

get_min_point([H, S | T], Min) :- get_coordinate(H, Xh, Yh),
	get_coordinate(S, Xs, Ys), ( Yh < Ys -> get_min_point([H | T], Min) ;
	Ys < Yh -> get_min_point([S | T], Min) ; 
	Xh < Xs -> get_min_point([H | T], Min) ; get_min_point([S | T], Min) ).

area2(A, B, C, Area) :- nonvar(A), !, nonvar(B), !, nonvar(C),	!, 
	get_coordinate(A, X1, Y1), get_coordinate(B, X2, Y2), 
	get_coordinate(C, X3, Y3), 
	T1 is ((X2 - X1) * (Y3 - Y1)), T2 is ((Y2 - Y1) * (X3 - X1)), 
	Area is T1 - T2.

left(A, B, C) :- nonvar(A), !, nonvar(B), !, nonvar(C), !,
	area2(A, B, C, Area), Area > 0 -> true ; false.

left_on(A, B, C) :- nonvar(A), !, nonvar(B), !, nonvar(C), !,
	area2(A, B, C, Area), Area < 0 -> true ; false.

collinear(A, B, C) :- nonvar(A), !, nonvar(B), !, nonvar(C), !,
	area2(A, B, C, Area), Area = 0 -> true ; false.

angle2d(A, B, R) :- nonvar(A), !, nonvar(B), !, 
	get_coordinate(A, X1, Y1), get_coordinate(B, X2, Y2), 
	YExpr is Y1 - Y2, XExpr is X1 - X2, R is atan2(YExpr, XExpr).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                CONVEX HULLS                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

create_pairs_point(_, [], []) :- !.

create_pairs_point(S, [H | T], Pairs) :- nonvar(S), !, angle2d(S, H, R), 
	create_pairs_point(S, T, NewPairs), Pairs = [R-H | NewPairs].

compute_convex_hull([], Stack, Stack) :- !. 

compute_convex_hull([H | T], Stack, CH) :- nonvar(H), !, nonvar(T), !,
	pop(Middle, Stack, NewStack), 
	peek(Tail, NewStack),
	( left(Tail, Middle, H) -> 
		push(Middle, NewStack, NewStack2), 
		push(H, NewStack2, NewStack3),
		compute_convex_hull(T, NewStack3, CH) ;
		left_on(Tail, Middle, H) ->
		compute_convex_hull([H | T], NewStack, CH) ;
		collinear(Tail, Middle, H) -> 
		push(H, NewStack, NewStack4),
		compute_convex_hull(T, NewStack4, CH) ).

ch(Points, Result) :- nonvar(Points), !, get_min_point(Points, MinPoint), 
	delete(Points, MinPoint, Points2),
	create_pairs_point(MinPoint, Points2, Pairs), 
	keysort(Pairs, PairsSorted), 
	pairs_keys_values(PairsSorted, _, [Hv | Tv]),
	push(MinPoint, [], Stack), 
	push(Hv, Stack, Stack2), 
	compute_convex_hull(Tv, Stack2, Res),
	push(MinPoint, Res, Result). 
