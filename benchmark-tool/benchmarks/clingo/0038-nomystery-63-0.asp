fuelcost(8,l0,l2).
fuelcost(15,l0,l4).
fuelcost(16,l1,l2).
fuelcost(25,l1,l3).
fuelcost(8,l2,l0).
fuelcost(16,l2,l1).
fuelcost(1,l2,l3).
fuelcost(19,l2,l4).
fuelcost(25,l3,l1).
fuelcost(1,l3,l2).
fuelcost(7,l3,l4).
fuelcost(15,l4,l0).
fuelcost(19,l4,l2).
fuelcost(7,l4,l3).
at(t0,l0).
fuel(t0,63).
at(p0,l0).
at(p1,l1).
at(p2,l4).
at(p3,l2).
at(p4,l0).
goal(p0,l4).
goal(p1,l2).
goal(p2,l0).
goal(p3,l1).
goal(p4,l4).
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
step(57).
step(58).
step(59).
step(60).
step(61).
step(62).
step(63).
step(64).
step(65).
step(66).
step(67).
step(68).
step(69).
step(70).
step(71).
step(72).
step(73).
step(74).
step(75).
step(76).
step(77).
step(78).
step(79).
step(80).
step(81).
step(82).
step(83).
step(84).
step(85).
step(86).
step(87).
step(88).
step(89).
step(90).
step(91).
step(92).
step(93).
step(94).
step(95).
step(96).
step(97).
step(98).
step(99).
step(100).
step(101).
step(102).
step(103).
step(104).
step(105).
step(106).
step(107).
step(108).
step(109).
step(110).
step(111).
step(112).
step(113).
step(114).
step(115).
step(116).
step(117).
step(118).
step(119).
step(120).
step(121).
step(122).
step(123).
step(124).
step(125).
step(126).
step(127).
step(128).
step(129).
step(130).
step(131).
step(132).
step(133).
step(134).
step(135).
step(136).
step(137).
step(138).
step(139).
step(140).
step(141).
step(142).
step(143).
step(144).
step(145).
step(146).
step(147).
step(148).
step(149).
step(150).
step(151).
step(152).
step(153).
step(154).
step(155).
step(156).
step(157).
step(158).
step(159).
step(160).
step(161).
step(162).
step(163).
step(164).
step(165).
step(166).
step(167).
step(168).
step(169).
step(170).
step(171).
step(172).
step(173).
step(174).
step(175).
step(176).
step(177).
step(178).
step(179).
step(180).
step(181).
step(182).
step(183).
step(184).
step(185).
step(186).
step(187).
step(188).
step(189).
step(190).
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
