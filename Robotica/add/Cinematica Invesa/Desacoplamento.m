%% Clear
clear
clc

%% Cordenadas PC (Centro do Punho)
% pc = d0-6 - d6*H0-6*k

H = [0 0.5 sqrt(3)/2 392.79; 0 -sqrt(3)/2 0.5 226.78; 1 0 0 878.55; 0 0 0 1]
R0a6 = H(1:3,1:3);
K = [0;0;1];
d6 = H(3,4);
d0a6 = H(1:3,4);

pc = d0a6 - d6*R0a6*K;
Px = pc(1,1)
Py = pc(2,1)
Pz = pc(3,1)
