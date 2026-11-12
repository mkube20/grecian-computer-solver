clear
clc
%grecian computer solver
%Michael Kuban
%inital state is 15,15,22,12,16 to the right (7 on top)
%GOAL NUMBER CONSTANT
GOAL=42;


totalSums=zeros(5,12);

%initializing cycle 1
%checked
totalSums(1,1)=15;
totalSums(1,3)=8;
totalSums(1,5)=3;
totalSums(1,7)=6;
totalSums(1,9)=10;
totalSums(1,11)=7;

%initializing cycle 2
%checked
totalSums(2,1)=21;
%2 is zero
totalSums(2,3)=11;
totalSums(2,4)=25;
totalSums(2,5)=6;
totalSums(2,6)=20;
%7 is zero
totalSums(2,8)=18;
totalSums(2,9)=17;
totalSums(2,10)=11;
totalSums(2,11)=3;
totalSums(2,12)=7;

%initializing cycle 3
%checked
totalSums(3,1)=50;
totalSums(3,2)=30;
totalSums(3,3)=35;
totalSums(3,4)=1;
totalSums(3,5)=28;
totalSums(3,6)=8;
totalSums(3,7)=35;
totalSums(3,8)=19;
totalSums(3,9)=34;
totalSums(3,10)=11;
totalSums(3,11)=30;
totalSums(3,12)=39;

%initializing cycle 4
totalSums(4,1)=27;
totalSums(4,2)=27;
totalSums(4,3)=40;
totalSums(4,4)=12;
totalSums(4,5)=38;
totalSums(4,6)=27;
totalSums(4,7)=38;
totalSums(4,8)=14;
totalSums(4,9)=20;
totalSums(4,10)=46;
totalSums(4,11)=36;
totalSums(4,12)=3;

%initializing cycle 5
totalSums(5,1)=46;
totalSums(5,2)=60;
totalSums(5,3)=56;
totalSums(5,4)=41;
totalSums(5,5)=46;
totalSums(5,6)=27;
totalSums(5,7)=23;
totalSums(5,8)=30;
totalSums(5,9)=36;
totalSums(5,10)=27;
totalSums(5,11)=28;
totalSums(5,12)=48;
totalTest=0;

first=0;
second=0;
third=0;
fourth=0;
fifth=0;
newCycle=totalSums;

%Number arrays
one=[15,0,8,0,3,0,6,0,10,0,7,0];
twoClose=[6,0,11,11,6,11,0,6,17,7,3,0];
twoFar=[15,0,0,14,0,9,0,12,0,4,0,7];
threeClose=[17,4,5,0,7,8,9,13,9,7,13,21];
threeMid=[11,26,14,1,12,0,21,6,15,4,9,18];
threeFar=[22,0,16,0,9,0,5,0,10,0,8,0];
fourClose=[7,14,11,0,8,0,16,2,7,0,9,0];
fourIn=[6,0,14,12,3,8,9,0,9,20,12,3];
fourOut=[2,13,9,0,17,19,3,12,3,26,6,0];
fourFar=[12,0,6,0,10,0,10,0,1,0,9,0];
fiveClose=[14,11,14,11,14,11,11,14,11,14,11,14];
fiveIn=[11,12,13,14,15,4,5,6,7,8,9,10];
fiveOut=[14,21,21,9,9,4,4,6,6,3,3,14];
fiveFar=[7,16,8,7,8,8,3,4,12,2,5,10];

newCycle(1,:)=circshift(newCycle(1,:),-1);
one=circshift(one,-1);
while ~totalTest
newCycle(1,:)=circshift(newCycle(1,:),1);
one=circshift(one,1);
first=first+1;
if first==12
    first=0;
    newCycle(2,:)=circshift(newCycle(2,:),1);
    twoClose=circshift(twoClose,1);
    twoFar=circshift(twoFar,1);
    second=second+1;
end
if second==12
    second=0;
    newCycle(3,:)=circshift(newCycle(3,:),1);
    threeClose=circshift(threeClose,1);
    threeMid=circshift(threeMid,1);
    threeFar=circshift(threeFar,1);
    third=third+1;
end
if third==12
    third=0;
    newCycle(4,:)=circshift(newCycle(4,:),1);
    fourClose=circshift(fourClose,1);
    fourIn=circshift(fourIn,1);
    fourOut=circshift(fourOut,1);
    fourFar=circshift(fourFar,1);
    fourth=fourth+1;
end
if fourth==12
    fourth=0;
    newCycle(5,:)=circshift(newCycle(5,:),1);
    fiveClose=circshift(fiveClose,1);
    fiveIn=circshift(fiveIn,1);
    fiveOut=circshift(fiveOut,1);
    fiveFar=circshift(fiveFar,1);
    fifth=fifth+1;
end
if fifth==12
    disp("Mistake");
   break;
end


%summing totals
sums=zeros(1,12);
for i=1:12
    sums(i)=newCycle(1,i)+newCycle(2,i)+newCycle(3,i)+newCycle(4,i)+newCycle(5,i);
end

%subtracting
for i=1:12
    if one(i)~=0
        sums(i)=sums(i)-twoClose(i)-threeClose(i)-fourClose(i)-fiveClose(i);
    elseif twoClose(i)~=0
        sums(i)=sums(i)-threeClose(i)-fourClose(i)-fiveClose(i);
    elseif threeClose(i)~=0
        sums(i)=sums(i)-fourClose(i)-fiveClose(i);
    elseif fourClose(i)~=0
        sums(i)=sums(i)-fiveClose(i);
    end
    
    if twoFar(i)~=0
        sums(i)=sums(i)-threeMid(i)-fourIn(i)-fiveIn(i);
    elseif threeMid(i)~=0
        sums(i)=sums(i)-fourIn(i)-fiveIn(i);
    elseif fourIn(i)~=0
        sums(i)=sums(i)-fiveIn(i);
    end
    
    if threeFar(i)~=0
        sums(i)=sums(i)-fourOut(i)-fiveOut(i);
    elseif fourOut(i)~=0
        sums(i)=sums(i)-fiveOut(i);
    end
    
    if fourFar(i)~=0
        sums(i)=sums(i)-fiveFar(i);
    end
end

%testing
totalTest=(max(sums)==min(sums))&&(max(sums)==GOAL);
end
first=first-1;
fprintf("From the starting position, twist the top cycle %i time(s), the second cycle %i time(s),\nthe third cycle %i time(s), the fourth cycle %i time(s), and the fifth cycle %i time(s).\n",first,second,third,fourth,fifth);