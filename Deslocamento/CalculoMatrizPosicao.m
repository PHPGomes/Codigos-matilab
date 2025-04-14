%% Calculos Posição

%% Clear
clear
clc

%% Criação Matriz Posição frame B em relação ao frame A
pxb = 5;
pyb = 0;
pzb = 0;
Posb = [pxb;pyb;pzb]

%% Criação Matriz Posição ponto P em relação frame B
pxpb = 2;
pypb = 2;
pzpb = 1;
Pospb = [pxpb;pypb;pzpb]

%% Calculo Posição P em relação a A

disp('A posição do ponto P em relação a A é:')
Pospa = Posb + Pospb

