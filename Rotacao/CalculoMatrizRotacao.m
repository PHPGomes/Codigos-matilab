%% CALCULO MATRIZ ROTAÇÃO %%

%% CLEAR
clear
clc

%% VALOR ANGULO

teta = 0;

%% CALCULO SIN E COS

sin = sind(teta);
cos = cosd(teta);

%% CRIAÇÃO MATRIZ Rotação

Rx = [1 0 0 ; 0 cos -sin ; 0 sin cos]
Ry = [cos 0 sin ; 0 1 0 ; -sin 0 cos]
Rz = [cos -sin 0 ; sin cos 0 ; 0 0 1]

ra = Rx(10)