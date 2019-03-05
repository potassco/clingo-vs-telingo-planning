player(player_01).
stone(stone_01).
stone(stone_02).
stone(stone_03).
isgoal(pos_4_2).
isgoal(pos_4_4).
isgoal(pos_4_6).
isnongoal(pos_1_1).
isnongoal(pos_1_2).
isnongoal(pos_1_3).
isnongoal(pos_1_4).
isnongoal(pos_1_5).
isnongoal(pos_1_6).
isnongoal(pos_1_7).
isnongoal(pos_2_1).
isnongoal(pos_2_2).
isnongoal(pos_2_3).
isnongoal(pos_2_4).
isnongoal(pos_2_5).
isnongoal(pos_2_6).
isnongoal(pos_2_7).
isnongoal(pos_3_1).
isnongoal(pos_3_2).
isnongoal(pos_3_3).
isnongoal(pos_3_4).
isnongoal(pos_3_5).
isnongoal(pos_3_6).
isnongoal(pos_3_7).
isnongoal(pos_4_1).
isnongoal(pos_4_3).
isnongoal(pos_4_5).
isnongoal(pos_4_7).
isnongoal(pos_5_1).
isnongoal(pos_5_2).
isnongoal(pos_5_3).
isnongoal(pos_5_4).
isnongoal(pos_5_5).
isnongoal(pos_5_6).
isnongoal(pos_5_7).
isnongoal(pos_6_1).
isnongoal(pos_6_2).
isnongoal(pos_6_3).
isnongoal(pos_6_4).
isnongoal(pos_6_5).
isnongoal(pos_6_6).
isnongoal(pos_6_7).
isnongoal(pos_7_1).
isnongoal(pos_7_2).
isnongoal(pos_7_3).
isnongoal(pos_7_4).
isnongoal(pos_7_5).
isnongoal(pos_7_6).
isnongoal(pos_7_7).
movedir(pos_1_1,pos_1_2,dir_down).
movedir(pos_1_1,pos_2_1,dir_right).
movedir(pos_1_2,pos_1_1,dir_up).
movedir(pos_1_2,pos_2_2,dir_right).
movedir(pos_2_1,pos_1_1,dir_left).
movedir(pos_2_1,pos_2_2,dir_down).
movedir(pos_2_2,pos_1_2,dir_left).
movedir(pos_2_2,pos_2_1,dir_up).
movedir(pos_2_4,pos_2_5,dir_down).
movedir(pos_2_4,pos_3_4,dir_right).
movedir(pos_2_5,pos_2_4,dir_up).
movedir(pos_2_5,pos_2_6,dir_down).
movedir(pos_2_5,pos_3_5,dir_right).
movedir(pos_2_6,pos_2_5,dir_up).
movedir(pos_2_6,pos_3_6,dir_right).
movedir(pos_3_4,pos_2_4,dir_left).
movedir(pos_3_4,pos_3_5,dir_down).
movedir(pos_3_4,pos_4_4,dir_right).
movedir(pos_3_5,pos_2_5,dir_left).
movedir(pos_3_5,pos_3_4,dir_up).
movedir(pos_3_5,pos_3_6,dir_down).
movedir(pos_3_5,pos_4_5,dir_right).
movedir(pos_3_6,pos_2_6,dir_left).
movedir(pos_3_6,pos_3_5,dir_up).
movedir(pos_3_6,pos_4_6,dir_right).
movedir(pos_4_2,pos_4_3,dir_down).
movedir(pos_4_2,pos_5_2,dir_right).
movedir(pos_4_3,pos_4_2,dir_up).
movedir(pos_4_3,pos_4_4,dir_down).
movedir(pos_4_3,pos_5_3,dir_right).
movedir(pos_4_4,pos_3_4,dir_left).
movedir(pos_4_4,pos_4_3,dir_up).
movedir(pos_4_4,pos_4_5,dir_down).
movedir(pos_4_4,pos_5_4,dir_right).
movedir(pos_4_5,pos_3_5,dir_left).
movedir(pos_4_5,pos_4_4,dir_up).
movedir(pos_4_5,pos_4_6,dir_down).
movedir(pos_4_6,pos_3_6,dir_left).
movedir(pos_4_6,pos_4_5,dir_up).
movedir(pos_5_2,pos_4_2,dir_left).
movedir(pos_5_2,pos_5_3,dir_down).
movedir(pos_5_2,pos_6_2,dir_right).
movedir(pos_5_3,pos_4_3,dir_left).
movedir(pos_5_3,pos_5_2,dir_up).
movedir(pos_5_3,pos_5_4,dir_down).
movedir(pos_5_3,pos_6_3,dir_right).
movedir(pos_5_4,pos_4_4,dir_left).
movedir(pos_5_4,pos_5_3,dir_up).
movedir(pos_5_4,pos_6_4,dir_right).
movedir(pos_6_2,pos_5_2,dir_left).
movedir(pos_6_2,pos_6_3,dir_down).
movedir(pos_6_3,pos_5_3,dir_left).
movedir(pos_6_3,pos_6_2,dir_up).
movedir(pos_6_3,pos_6_4,dir_down).
movedir(pos_6_4,pos_5_4,dir_left).
movedir(pos_6_4,pos_6_3,dir_up).
movedir(pos_6_6,pos_6_7,dir_down).
movedir(pos_6_6,pos_7_6,dir_right).
movedir(pos_6_7,pos_6_6,dir_up).
movedir(pos_6_7,pos_7_7,dir_right).
movedir(pos_7_6,pos_6_6,dir_left).
movedir(pos_7_6,pos_7_7,dir_down).
movedir(pos_7_7,pos_6_7,dir_left).
movedir(pos_7_7,pos_7_6,dir_up).
at(player_01,pos_2_6).
at(stone_01,pos_3_4).
at(stone_02,pos_4_4).
at(stone_03,pos_5_4).
clear(pos_1_1).
clear(pos_1_2).
clear(pos_2_1).
clear(pos_2_2).
clear(pos_2_4).
clear(pos_2_5).
clear(pos_3_5).
clear(pos_3_6).
clear(pos_4_2).
clear(pos_4_3).
clear(pos_4_5).
clear(pos_4_6).
clear(pos_5_2).
clear(pos_5_3).
clear(pos_6_2).
clear(pos_6_3).
clear(pos_6_4).
clear(pos_6_6).
clear(pos_6_7).
clear(pos_7_6).
clear(pos_7_7).
goal(stone_01).
goal(stone_02).
goal(stone_03).
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
#program initial.
at_t(P,To) :- at(P,To).
clear_t(P) :- clear(P).
atgoal(S) :- isgoal(L), stone(S), at(S,L).

#program dynamic.
{ occurs(some_action) }.
1 <= {
		pushtonongoal(P,S,Ppos,From,To,Dir) :
		_movedir(Ppos,From,Dir),
		_movedir(From,To,Dir),
		_isnongoal(To),
		_player(P),
		_stone(S), 
		Ppos != To, 
		Ppos != From, 
		From != To;
	    
		move(P,From,To,Dir) :
		_movedir(From,To,Dir),
		_player(P), 
		From != To;
	    
		pushtogoal(P,S,Ppos,From,To,Dir) :
		_movedir(Ppos,From,Dir),
		_movedir(From,To,Dir),
		_isgoal(To), 
		_player(P), 
		_stone(S), 
		Ppos != To, 
		Ppos != From, 
		From != To;
	    
		noop
	} <= 1 :- occurs(some_action).

del(at(P,Ppos)) :- 	pushtonongoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isnongoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
del(at(S,From)) :- 	pushtonongoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isnongoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
del(clear(To)) :- 	pushtonongoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isnongoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
at_t(P,From) :- 	pushtonongoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isnongoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
at_t(S,To) :- 		pushtonongoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isnongoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
clear_t(Ppos) :- 	pushtonongoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isnongoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
del(atgoal(S)) :- 	pushtonongoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isnongoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.

del(at(P,From)) :- 	move(P,From,To,Dir),
					_movedir(From,To,Dir),
					_player(P),
					From != To.
del(clear(To)) :- 	move(P,From,To,Dir),
					_movedir(From,To,Dir),
					_player(P),
					From != To.
at_t(P,To) :- 		move(P,From,To,Dir),
					_movedir(From,To,Dir),
					_player(P),
					From != To.
clear_t(From) :- 	move(P,From,To,Dir),
					_movedir(From,To,Dir),
					_player(P),
					From != To.

del(at(P,Ppos)) :- 	pushtogoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isgoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
del(at(S,From)) :- 	pushtogoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isgoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
del(clear(To)) :- 	pushtogoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isgoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
at_t(P,From) :- 	pushtogoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isgoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
at_t(S,To) :- 		pushtogoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isgoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
clear_t(Ppos) :- 	pushtogoal(P,S,Ppos,From,To,Dir),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isgoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.
atgoal(S) :- 		pushtogoal(P,S,Ppos,From,To,Dir),
					_stone(S),
					_movedir(Ppos,From,Dir),
					_movedir(From,To,Dir),
					_isgoal(To),
					_player(P),
					_stone(S),
					Ppos != To,
					Ppos != From,
					From != To.

clear_t(L) :- 	'clear_t(L),
				not del(clear(L)).
atgoal(S) :- 	'atgoal(S),
				not del(atgoal(S)),
				_stone(S).
at_t(T,L) :- 	'at_t(T,L),
				not del(at(T,L)).

:- 	pushtonongoal(P,S,Ppos,From,To,Dir),
	not preconditions_png(P,S,Ppos,From,To,Dir),
	_movedir(Ppos,From,Dir),
	_movedir(From,To,Dir),
	_isnongoal(To),
	_player(P),
	_stone(S),
	Ppos != To,
	Ppos != From,
	From != To.
preconditions_png(P,S,Ppos,From,To,Dir) :- 	'at_t(P,Ppos),
											'at_t(S,From),
											'clear_t(To),
											_movedir(Ppos,From,Dir),
											_movedir(From,To,Dir),
											_isnongoal(To),
											_player(P),
											_stone(S),
											Ppos != To,
											Ppos != From,
											From != To.

:- 	move(P,From,To,Dir),
	not preconditions_m(P,From,To,Dir),
	_movedir(From,To,Dir),
	_player(P),
	From != To.
preconditions_m(P,From,To,Dir) :- 	'at_t(P,From),
									'clear_t(To),
									_movedir(From,To,Dir),
									_movedir(From,To,Dir),
									_player(P),
									From != To.

:- 	pushtogoal(P,S,Ppos,From,To,Dir),
	not preconditions_pg(P,S,Ppos,From,To,Dir),
	_movedir(Ppos,From,Dir),
	_movedir(From,To,Dir),
	_isgoal(To),
	_player(P),
	_stone(S),
	Ppos != To,
	Ppos != From,
	From != To.
preconditions_pg(P,S,Ppos,From,To,Dir) :- 	'at_t(P,Ppos),
											'at_t(S,From),
											'clear_t(To),
											_movedir(Ppos,From,Dir),
											_movedir(From,To,Dir),
											_isgoal(To),
											_player(P),
											_stone(S),
											Ppos != To,
											Ppos != From,
											From != To.

goalreached :- 	'goalreached.
goalreached :- 	N = #count{ X : atgoal(X), _goal(X) },
				N = #count{ X1 : _goal(X1) }.

#program final.
:- not goalreached.
