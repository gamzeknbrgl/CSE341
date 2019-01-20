%part2
% This program checks if there is a route between any given two cities.  

% Knowledge base (city1, city2, cost).

flight(erzurum,edirne,5).
flight(edirne,erzurum,5).
flight(antalya,erzurum,2).
flight(erzurum,antalya,2).
flight(izmir,antalya,1).
flight(antalya,izmir,1).
flight(diyarbakir,antalya,5).
flight(antalya,diyarbakir,5).
flight(izmir,istanbul,3).
flight(izmir,ankara,6).
flight(istanbul,izmir,3).
flight(ankara,istanbul,2).
flight(ankara,izmir,6).
flight(istanbul,trabzon,3).
flight(istanbul,ankara,2).
flight(trabzon,istanbul,3).
flight(trabzon,ankara,6).
flight(ankara,trabzon,6).
flight(ankara,kars,3).
flight(kars,ankara,3).
flight(diyarbakir,ankara,8).
flight(ankara,diyarbakir,8).
flight(gaziantep,kars,3).
flight(kars,gaziantep,3).

% Rules
% Check all nodes with all possible conditions and rules and after that calculating the final cost.
% I tried to do that with recursion but i couldnt do that properly, thats why i am using this way.

route(X,Y,C) :- flight(X,Y,C), X\=Y;

  flight(X,Y1,C1), flight(Y1,Y,C2), X\=Y, C is C1+C2;

  flight(X,Y1,C1), flight(Y1,Y2,C2), flight(Y2,Y,C3), X\=Y, X\=Y1, X\=Y2, Y\=Y1, Y\=Y2, Y1\=Y2,
  C is C1+C2+C3;

  flight(X,Y1,C1), flight(Y1,Y2,C2), flight(Y2,Y3,C3), flight(Y3,Y,C4),  X\=Y, X\=Y1, X\=Y2, X\=Y3, Y\=Y1, Y\=Y2, Y\=Y3, Y1\=Y2, Y1\=Y3, Y2\=Y3,
   C is C1+C2+C3+C4;

  flight(X,Y1,C1), flight(Y1,Y2,C2), flight(Y2,Y3,C3),flight(Y3,Y4,C4), flight(Y4,Y,C5), X\=Y, X\=Y1, X\=Y2, X\=Y3, X\=Y4, Y\=Y1, Y\=Y2, Y\=Y3, Y\=Y4,
   Y1\=Y2, Y1\=Y3, Y1\=Y4, Y2\=Y3, Y2\=Y4, Y3\=Y4,
   C is C1+C2+C3+C4+C5;

  flight(X,Y1,C1), flight(Y1,Y2,C2), flight(Y2,Y3,C3),flight(Y3,Y4,C4), flight(Y4,Y5,C5),flight(Y5,Y,C6),
   X\=Y, X\=Y1, X\=Y2, X\=Y3, X\=Y4, X\=Y5, Y\=Y1, Y\=Y2, Y\=Y3, Y\=Y4, Y\=Y5, Y1\=Y2, Y1\=Y3, Y1\=Y4, Y1\=Y5,
   Y2\=Y3,Y2\=Y4,Y2\=Y5, Y3\=Y4,Y3\=Y5,Y4\=Y5,
   C is C1+C2+C3+C4+C5+C6;

   flight(X,Y1,C1), flight(Y1,Y2,C2), flight(Y2,Y3,C3),flight(Y3,Y4,C4), flight(Y4,Y5,C5),flight(Y5,Y6,C6),flight(Y6,Y,C7),
   X\=Y, X\=Y1, X\=Y2, X\=Y3, X\=Y4, X\=Y5, X\=Y6, Y\=Y1, Y\=Y2, Y\=Y3, Y\=Y4, Y\=Y5, Y\=Y6, Y1\=Y2, Y1\=Y3, Y1\=Y4, Y1\=Y5, Y1\=Y6,
   Y2\=Y3, Y2\=Y4, Y2\=Y5, Y2\=Y6, Y3\=Y4, Y3\=Y5, Y3\=Y6, Y4\=Y5, Y4\=Y6, Y5\=Y6,
   C is C1+C2+C3+C4+C5+C6+C7;

   flight(X,Y1,C1), flight(Y1,Y2,C2), flight(Y2,Y3,C3),flight(Y3,Y4,C4), flight(Y4,Y5,C5),flight(Y5,Y6,C6),flight(Y6,Y7,C7),flight(Y7,Y,C8),
   X\=Y, X\=Y1, X\=Y2, X\=Y3, X\=Y4, X\=Y5, X\=Y6, X\=Y7, Y\=Y1, Y\=Y2, Y\=Y3, Y\=Y4, Y\=Y5, Y\=Y6, Y\=Y7, Y1\=Y2, Y1\=Y3, Y1\=Y4, Y1\=Y5, Y1\=Y6, Y1\=Y7,
   Y2\=Y3, Y2\=Y4, Y2\=Y5, Y2\=Y6, Y2\=Y7, Y3\=Y4, Y3\=Y5, Y3\=Y6, Y3\=Y7, Y4\=Y5, Y4\=Y6, Y4\=Y7, Y5\=Y6, Y5\=Y7, Y6\=Y7,
   C is C1+C2+C3+C4+C5+C6+C7+C8.