%part1
%Scheduling of classes

% I added this dynamic part just because if you want to add student, room or course with asserta.

:- dynamic student/3.
:- dynamic room/4.
:- dynamic course/4.

% Knowledge base
% I wrote all data from that you give us in the Excell, i use _ if there is no value for this column.

room(z06,10,hcapped,projector).
room(z11,10,hcapped,smartboard).

course(cse341,genc,10,1,z06).
course(cse343,turker,6,1,z11).
course(cse331,bayrakci,5,1,z06).
course(cse321,gozupek,10,1,z11).

occupancy(z06,8,cse341).
occupancy(z06,9,cse341).
occupancy(z06,10,cse341).
occupancy(z06,11,cse341).
occupancy(z06,12,_).
occupancy(z06,13,cse331).
occupancy(z06,14,cse331).
occupancy(z06,15,cse331).
occupancy(z06,16,_).

occupancy(z11,8,cse343).
occupancy(z11,9,cse343).
occupancy(z11,10,cse343).
occupancy(z11,11,cse343).
occupancy(z11,12,_).
occupancy(z11,13,_).
occupancy(z11,14,cse321).
occupancy(z11,15,cse321).
occupancy(z11,16,cse321).


student(1,[cse341,cse343,cse331],no).
student(2,[cse341,cse343],no).
student(3,[cse341,cse331],no).
student(4,[cse341],no).
student(5,[cse341,cse331],no).
student(6,[cse341,cse343,cse331],yes).
student(7,[cse341,cse343],no).
student(8,[cse341,cse331],yes).
student(9,[cse341],no).
student(10,[cse341,cse321],no).
student(11,[cse341,cse321],no).
student(12,[cse343,cse321],no).
student(13,[cse343,cse321],no).
student(14,[cse343,cse321],no).
student(15,[cse343,cse321],yes).

instructor(genc,cse341,projector).
instructor(turker,cse343,smartboard).
instructor(bayrakci,cse331,_).
instructor(gozupek,cse321,smartboard).

% Check whether a student can be enrolled to a given class. 

enroll(StudentID,CourseID) :- 
course(CourseID,_,CourseCap,_,RoomID), student(StudentID,_,_), room(RoomID,RoomCap,_,_),
CourseCap < RoomCap,
student(StudentID,_,IsHcap), room(RoomID,RoomCap,Hcapped,_), 
((IsHcap = yes, Hcapped = hcapped ) ;
(IsHcap = no)).


% Check whether there is any scheduling conflict. 

conflicts(CourseID1,CourseID2) :- 
occupancy(X,Y,CourseID1),occupancy(X,Z,CourseID2), Y = Z.


% I cant do the assign part.

assign(RoomID,CourseID) :- .

