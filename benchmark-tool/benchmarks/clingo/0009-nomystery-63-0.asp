fuelcost(24,l0,l2).
fuelcost(18,l0,l3).
fuelcost(7,l1,l2).
fuelcost(7,l1,l4).
fuelcost(24,l2,l0).
fuelcost(7,l2,l1).
fuelcost(25,l2,l3).
fuelcost(25,l2,l4).
fuelcost(18,l3,l0).
fuelcost(25,l3,l2).
fuelcost(6,l3,l4).
fuelcost(7,l4,l1).
fuelcost(25,l4,l2).
fuelcost(6,l4,l3).
at(t0,l1).
fuel(t0,63).
at(p0,l4).
at(p1,l2).
at(p2,l3).
at(p3,l4).
at(p4,l0).
goal(p0,l3).
goal(p1,l3).
goal(p2,l0).
goal(p3,l3).
goal(p4,l3).
step(1).
step(2).
step(3).
step(4).
step(5).
step(6).
step(7).
step(8).
step(9).
step(10).
step(11).
step(12).
step(13).
step(14).
step(15).
step(16).
step(17).
step(18).
step(19).
step(20).
step(21).
step(22).
step(23).
step(24).
step(25).
step(26).
step(27).
step(28).
step(29).
step(30).
step(31).
step(32).
#include <incmode>.
truck(T) :- fuel(T,_).
package(P) :- at(P,L), not truck(P).
location(L) :- fuelcost(_,L,_).
location(L) :- fuelcost(_,_,L).
locatable(O) :- at(O,L).
at(O,L,0) :- at(O,L).
fuel(T,F,0) :- fuel(T,F).

action(unload(P,T,L)) :- package(P), truck(T), location(L).
action(load(P,T,L)) :- package(P), truck(T), location(L).
action(drive(T,L1,L2)) :- fuelcost(Fueldelta,L1,L2), truck(T).

#program step(t).
1 { occurs(A,t) : action(A) } 1.

unload(P,T,L,t) :- occurs(unload(P,T,L),t).
load(P,T,L,t) :- occurs(load(P,T,L),t).
drive(T,L1,L2,t) :- occurs(drive(T,L1,L2),t).

at(P,L,t) :- unload(P,T,L,t).
del(in(P,T),t) :- unload(P,T,L,t).

del(at(P,L),t) :- load(P,T,L,t).
in(P,T,t) :- load(P,T,L,t).

del(at(T,L1),t) :- drive(T,L1,L2,t).
at(T,L2,t) :- drive(T,L1,L2,t).
del(fuel(T,Fuelpre),t) :- drive(T,L1,L2,t), fuel(T,Fuelpre,t-1).
fuel(T,Fuelpre - Fueldelta,t) :- drive(T,L1,L2,t), fuelcost(Fueldelta,L1,L2), fuel(T,Fuelpre,t-1), Fuelpre >= Fueldelta.

at(O,L,t) :- at(O,L,t-1), not del(at(O,L),t).
in(P,T,t) :- in(P,T,t-1), not del(in(P,T),t).
fuel(T,Level,t) :- fuel(T,Level,t-1), not del(fuel(T,Level),t), truck(T).

 :- unload(P,T,L,t), not preconditions_u(P,T,L,t).
preconditions_u(P,T,L,t) :- at(T,L,t-1), in(P,T,t-1), package(P), truck(T).

 :- load(P,T,L,t), not preconditions_l(P,T,L,t).
preconditions_l(P,T,L,t) :- at(T,L,t-1), at(P,L,t-1).

 :- drive(T,L1,L2,t), not preconditions_d(T,L1,L2,t).
preconditions_d(T,L1,L2,t) :- at(T,L1,t-1), fuel(T,Fuelpre,t-1), fuelcost(Fueldelta,L1,L2), Fuelpre >= Fueldelta.

#program check(t).
:- goal(P,L), not at(P,L,t), query(t).
