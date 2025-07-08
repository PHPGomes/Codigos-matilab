%% Clear
clear
clc

%% Matriz
M = [1 0 0 0; 0 1 0 0 ; 0 0 1 0;0 0 0 1] % Matriz Padrão 4x4 (Dado no exercicio)

%% Esferico
gamma = atan2d(M(2,1),M(1,1))
rsb = M(1,1)/cosd(gamma)
beta = atan2d(rsb,M(3,3))
r = M(3,3)/cosd(beta)