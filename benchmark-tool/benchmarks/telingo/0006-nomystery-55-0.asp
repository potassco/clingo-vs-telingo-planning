fuelcost(18,l0,l1).
fuelcost(3,l0,l3).
fuelcost(11,l0,l4).
fuelcost(18,l1,l0).
fuelcost(10,l1,l2).
fuelcost(8,l1,l4).
fuelcost(10,l2,l1).
fuelcost(15,l2,l4).
fuelcost(3,l3,l0).
fuelcost(13,l3,l4).
fuelcost(11,l4,l0).
fuelcost(8,l4,l1).
fuelcost(15,l4,l2).
fuelcost(13,l4,l3).
at(t0,l1).
fuel(t0,55).
at(p0,l0).
at(p1,l3).
at(p2,l1).
at(p3,l2).
at(p4,l4).
goal(p0,l4).
goal(p1,l4).
goal(p2,l4).
goal(p3,l1).
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
step(33).
step(34).
step(35).
step(36).
step(37).
step(38).
step(39).
step(40).
step(41).
step(42).
step(43).
step(44).
step(45).
step(46).
step(47).
step(48).
step(49).
step(50).
step(51).
step(52).
step(53).
step(54).
step(55).
step(56).
truck(T) :- fuel(T,_).
package(P) :- at(P,L), not truck(P).
location(L) :- fuelcost(_,L,_).
location(L) :- fuelcost(_,_,L).
locatable(O) :- at(O,L).
at_t(O,L) :- at(O,L).
fuel_t(T,F) :- fuel(T,F).

action(unload(P,T,L)) :- package(P), truck(T), location(L).
action(load(P,T,L)) :- package(P), truck(T), location(L).
action(drive(T,L1,L2)) :- fuelcost(Fueldelta,L1,L2), truck(T).

#program dynamic.
1 { occurs(A) : _action(A) } 1.

unload(P,T,L) :- occurs(unload(P,T,L)).
load(P,T,L) :- occurs(load(P,T,L)).
drive(T,L1,L2) :- occurs(drive(T,L1,L2)).

at_t(P,L) :- unload(P,T,L).
del(in(P,T)) :- unload(P,T,L).

del(at_t(P,L)) :- load(P,T,L).
in(P,T) :- load(P,T,L).

del(at_t(T,L1)) :- drive(T,L1,L2).
at_t(T,L2) :- drive(T,L1,L2).
del(fuel_t(T,Fuelpre)) :- drive(T,L1,L2), 'fuel_t(T,Fuelpre).
fuel_t(T,Fuelpre - Fueldelta) :- drive(T,L1,L2), _fuelcost(Fueldelta,L1,L2), 'fuel_t(T,Fuelpre), Fuelpre >= Fueldelta.

at_t(O,L) :- 'at_t(O,L), not del(at_t(O,L)).
in(P,T) :- 'in(P,T), not del(in(P,T)).
fuel_t(T,Level) :- 'fuel_t(T,Level), not del(fuel_t(T,Level)), _truck(T).

 :- unload(P,T,L), not preconditions_u(P,T,L).
preconditions_u(P,T,L) :- 'at_t(T,L), 'in(P,T), _package(P), _truck(T).

 :- load(P,T,L), not preconditions_l(P,T,L).
preconditions_l(P,T,L) :- 'at_t(T,L), 'at_t(P,L).

 :- drive(T,L1,L2), not preconditions_d(T,L1,L2).
preconditions_d(T,L1,L2) :- 'at_t(T,L1), 'fuel_t(T,Fuelpre), _fuelcost(Fueldelta,L1,L2), Fuelpre >= Fueldelta.

#program final.
:- _goal(P,L), not at_t(P,L).
