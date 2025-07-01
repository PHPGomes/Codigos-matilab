clear;clc
t1f = 2;
t2f = 4;
t3f = 2;

theta1 = 30;
theta1_ponto = 0;
theta1_2pontos = 0;
theta2 = 60;
theta3 = 90;
theta4 = 70;
theta4_ponto = 0;
theta4_2pontos = 0;

L1 = [1 zeros(1,13)];
L2 = [0 1 zeros(1,12)];
L3 = [0 0 2 zeros(1,11)];
L4 = [1 t1f t1f^2 t1f^3 t1f^4 zeros(1,9)];
L5 = zeros(1,14);
L6 = [0 1 2*t1f 3*t1f^2 4*t1f^3 0 -1 zeros(1,7)];
L7 = [0 0 2 6*t1f 12*t1f^2 0 0 -2 zeros(1,6)];
L8 = [zeros(1,5) 1 t2f t2f^2 t2f^3 zeros(1,5)];
L9 = [zeros(1,9) 1 zeros(1,4)];
L10 = [zeros(1,6) 1 2*t2f 3*t2f^2 0 -1 zeros(1,3)];
L11 = [zeros(1,7) 2 6*t2f 0 0 -2 zeros(1,2)];
L12 = [zeros(1,9) 1 t3f t3f^2 t3f^3 t3f^4];
L13 = [zeros(1,10) 1 2*t3f 3*t3f^2 4*t3f^3];
L14 = [zeros(1,11) 2 6*t3f 12*t3f^2];

M = [L1; L2; L3; L4; L5; L6; L7; L8; L9; L10; L11; L12; L13; L13];
THETA = [theta1; theta1_ponto; theta1_2pontos; theta2; theta2; 0; 0; theta3; theta3; 0; 0; theta4; theta4_ponto; theta4_2pontos];
A = inv(M) * THETA