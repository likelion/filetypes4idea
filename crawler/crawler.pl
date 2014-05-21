% A script that finds all ISO and builtin predicates that do not start with '$'
% Usage: crawl(Y,YL,Y2,Y2L,Y3,Y3L)
:- set_prolog_flag(toplevel_print_options, [quoted(true), portray(true)]).
:- use_module(library(lists)).
crawl(Y,YL,Y2,Y2L,Y3,Y3L) :-
   findall(Z, (predicate_property(system:X,iso),functor(X,Z,_)), Y),
   length(Y,YL),
   findall(Z2, (predicate_property(system:X2,built_in),functor(X2,Z2,_), not(atom_prefix(Z2, '$'))), Y2),
   length(Y2,Y2L),
   subtract(Y2,Y,Y3),
   length(Y3,Y3L).
