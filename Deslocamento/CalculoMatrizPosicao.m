%% Calculos Posição

%% Clear
clear
clc

%% Criação Matriz Posição frame B em relação ao frame A
pxb = 5;
pyb = 0;
pzb = 0;
%Posb = [pxb;pyb;pzb]
Posb = [0.7146   -0.6131    0.3368    3.2261;0.6337    0.7713    0.0594    6.4542;-0.2962    0.1710    0.9397    8.4771; 0 0         0    1.0000]

%% Criação Matriz Posição ponto P em relação frame B
pxpb = 2;
pypb = 5;
pzpb = 6;
Pospb = [pxpb;pypb;pzpb;0];

%% Calculo Posição P em relação a A

disp('A posição do ponto P em relação a A é:')
%Pospa = Posb + Pospb

Pospa =  Pospb - Posb(:,4)