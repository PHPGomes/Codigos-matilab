%% clear
clear
clc

%% Matriz
M = [0 1 0 1;1 0 0 1;0 0 -1 1;0 0 0 1]

%% Operações (Colocar a matriz M primeiro e ir adicionando os movimentos nas extremidades, fixos antes e correntes depois)
T = Ry(90)*Rz(90)*M*Trans(3,5,0)*Rx(90)


%%
H = Rx(45)*Rz(60)*Trans(0,0,3)*Trans(0,6,0)*Rx(60)