%% clear
clear
clc

%% Matriz
M = [1 0 0 1; 0 1 0 5;0 0 1 4;0 0 0 1];

%% Ex Operações (Matriz M recebeu uma rotação z de 30 depois umas y de 60)
T = Rz(90)*Rx(90)*M*Trans(0,0,3)*Trans(0,5,0)