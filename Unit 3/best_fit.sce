//start
clear; close; clc;

a = input("Enter a matrix(A): ");
disp(a, 'A=');

b = input("Enter a matrix(b): ");
disp(b,'b=');

x=(a'*a)\(a'*b)
disp(x,'x=');
C=x(1,1);
D=x(2,1);
disp(C,'C=');
disp(D,'D=');
disp("the best line fit is b=C+Dt.")
//end
