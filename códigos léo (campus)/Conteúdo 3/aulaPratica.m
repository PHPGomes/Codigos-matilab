clear; clc;

%olhar no rokisim o range das juntas e fazer o polinomio pra cada junta usando 3 ordem pras 3 primeiras e 5 ordem pras 3 ultimas

pos_i1 = 30;
pos_f1 = 50;

pos_i2 = 50;
pos_f2 = 90;

pos_i3 = 90;
pos_f3 = 70;

B = [30;0;0;50;50;0;0;90;90;0;0;70;0;0];

syms a0 a1 a2 a3 a4 b0 b1 b2 b3 c0 c1 c2 c3 c4;
t1f = 2;
t2f = 4;
t3f = 2;

L1 = [1 zeros(1,13)];
L2 = [0 1 zeros(1,12)];
L3 = [0 0 2 zeros(1,11)];
L4 = [1 t1f t1f^2 t1f^3 t1f^4 zeros(1,9)];
L5 = [zeros(1,5) 1 zeros(1,8)];
L6 = [0 1 2*t1f 3*t1f^2 4*t1f^3 0 -1 zeros(1,7)];
L7 = [0 0 2 6*t1f 12*t1f^2 0 0 -2 zeros(1,6)];
L8 = [zeros(1,5) 1 t2f t2f^2 t2f^3 zeros(1,5)];
L9 = [zeros(1,9) 1 zeros(1,4)];
L10 = [zeros(1,6) 1 2*t2f 3*t2f^2 0 -1 0 0 0];
L11 = [zeros(1,7) 2 6*t2f 0 0 -2 0 0];
L12 = [zeros(1,9) 1 t3f t3f^2 t3f^3 t3f^4];
L13 = [zeros(1,10) 1 2*t3f 3*t3f^2 4*t3f^3];
L14 = [zeros(1,11) 2 6*t3f 12*t3f^2];

M = [L1;L2;L3;L4;L5;L6;L7;L8;L9;L10;L11;L12;L13;L14]

Coef = inv(M)*B

