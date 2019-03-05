barrier(1,12,south).
barrier(1,6,south).
barrier(10,1,east).
barrier(10,14,south).
barrier(10,15,east).
barrier(10,8,west).
barrier(10,9,west).
barrier(11,12,east).
barrier(11,12,south).
barrier(11,3,east).
barrier(11,7,south).
barrier(11,8,east).
barrier(12,16,east).
barrier(12,3,south).
barrier(13,11,east).
barrier(14,10,south).
barrier(14,13,east).
barrier(14,2,east).
barrier(14,7,east).
barrier(14,7,south).
barrier(15,1,south).
barrier(15,13,south).
barrier(16,4,south).
barrier(16,9,south).
barrier(2,1,east).
barrier(2,10,south).
barrier(2,11,east).
barrier(2,2,south).
barrier(2,3,east).
barrier(3,15,east).
barrier(3,15,south).
barrier(3,7,east).
barrier(4,10,east).
barrier(4,16,east).
barrier(4,2,east).
barrier(4,7,south).
barrier(5,1,south).
barrier(5,10,south).
barrier(6,14,east).
barrier(7,13,south).
barrier(7,4,east).
barrier(7,4,south).
barrier(7,8,east).
barrier(7,9,east).
barrier(8,10,north).
barrier(8,11,east).
barrier(8,7,south).
barrier(9,10,north).
barrier(9,10,south).
barrier(9,7,south).
dim(1).
dim(10).
dim(11).
dim(12).
dim(13).
dim(14).
dim(15).
dim(16).
dim(2).
dim(3).
dim(4).
dim(5).
dim(6).
dim(7).
dim(8).
dim(9).
pos(blue,1,16).
pos(green,16,1).
pos(red,1,1).
pos(yellow,16,16).
target(yellow,4,12).
length(25).
#include <incmode>.
dir(west,-1,0).
dir(east,1,0).
dir(north,0,-1).
dir(south,0,1).

dl(west,-1).
dl(north,-1).
dl(east,1).
dl(south,1).

dir(west,1).
dir(east,1).
dir(north,-1).
dir(south,-1).

robot(R) :- pos(R,_,_).

pos(R,1,I,0) :- pos(R,I,_).
pos(R,-1,J,0) :- pos(R,_,J).

barrier(I+1,J,west) :- barrier(I,J,east), dim(I),dim(J), dim(I+1).
barrier(I,J+1,north) :- barrier(I,J,south), dim(I), dim(J), dim(J+1).
barrier(I-1,J,east) :- barrier(I,J,west), dim(I), dim(J), dim(I-1).
barrier(I,J-1,south) :- barrier(I,J,north), dim(I), dim(J), dim(J-1). % was dim(I-1)

conn(D,I,J) :- dir(D,-1), dir(D,_,DJ), not barrier(I,J,D), dim(I), dim(J), dim(J+DJ).
conn(D,J,I) :- dir(D,1), dir(D,DI,_), not barrier(I,J,D), dim(I), dim(J), dim(I+DI).

#program step(t).
{ occurs(some_action,t) }.
1 <= { selectRobot(R,t) : robot(R) } <= 1 :- occurs(some_action,t).
1 <= { selectDir(D,O,t) : dir(D,O) } <= 1 :- occurs(some_action,t).

go(R,D,O,t) :- selectRobot(R,t), selectDir(D,O,t).
go_(R,O,t)   :- go(R,_,O,t).
go(R,D,t) :- go(R,D,_,t).

sameLine(R,D,O,RR,t)  :- go(R,D,O,t), pos(R,-O,L,t-1), pos(RR,-O,L,t-1), R != RR.
blocked(R,D,O,I+DI,t) :- go(R,D,O,t), pos(R,-O,L,t-1), not conn(D,L,I), dl(D,DI), dim(I), dim(I+DI).
blocked(R,D,O,L,t)    :- sameLine(R,D,O,RR,t), pos(RR,O,L,t-1).

reachable(R,D,O,I,t) :- go(R,D,O,t), pos(R,O,I,t-1).
reachable(R,D,O,I+DI,t) :- reachable(R,D,O,I,t), not blocked(R,D,O,I+DI,t), dl(D,DI), dim(I+DI).

:- go(R,D,O,t), pos(R,O,I,t-1), blocked(R,D,O,I+DI,t), dl(D,DI).
:- go(R,D,O,t), go(R,DD,O,t-1).

pos(R,O,I,t) :- reachable(R,D,O,I,t), not reachable(R,D,O,I+DI,t), dl(D,DI).
pos(R,O,I,t) :- pos(R,O,I,t-1), not go_(R,O,t).

#program check(t).
:- target(R,I,_), not pos(R,1,I,t), query(t).
:- target(R,_,J), not pos(R,-1,J,t), query(t).
