T1 = 30; T1_P = 0; T1_PP = 0; T2 = 50; T3 = 90; T4 = 70; T4_P = 0; T4_PP = 0;
T1f = 2; T1i = 0; T2f = 4; T2i = 0; T3f = 2; T3i = 0;
%syms a0 a1 a2 a3 a4 b0 b1 b2 b3 b4 c0 c1 c2 c3 c4
L1 = [1 zeros(1,13)];
L2 = [0 1 zeros(1,12)];
L3 = [0 0 2 zeros(1,11)];
L4 = [1 T1f T1f^2 T1f^3 T1f^4 zeros(1,9)];
L5 = [zeros(1,5) 1 zeros(1,8)];
L6 = [0 1 2*T1f 3*T1f^2 4*T1f^3 0 -1 zeros(1,7)];
L7 = [0 0 2 6*T1f 12*T1f^2 0 0 -2 zeros(1,6)];
L8 = [zeros(1,5) 1 T2f T2f^2 T2f^3 zeros(1,5)];
L9 = [zeros(1,9) 1 zeros(1,4)];
L10 = [zeros(1,6) 1 2*T2f 3*T2f^2 0 -1 0 0 0];
L11 = [zeros(1,7) 2 6*T2f 0 0 -2 0 0];
L12 = [zeros(1,9) 1 T3f T3f^2 T3f^3 T3f^4];
L13 = [zeros(1,10) 1 2*T3f 3*T3f^2 4*T3f^3];
L14 = [zeros(1,11) 2 6*T3f 12*T3f^2];


Mat = [L1;L2;L3;L4;L5;L6;L7;L8;L9;L10;L11;L12;L13;L14];

Vet = [T1 T1_P T1_PP T2 T2 0 0 T3 T3 0 0 T4 T4_P T4_PP]';

%Resp = [a0 a1 a2 a3 a4 b0 b1 b2 b3 b4 c0 c1 c2 c3 c4]';

Resp = inv(Mat)*Vet