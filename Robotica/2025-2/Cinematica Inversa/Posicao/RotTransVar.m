%% Clear 
clear
clc

%% Referencial
B = Trans(0,0,0)

% Calculo 
% Como calcular:
% inicialmente Coloque o referencial B 
% Logo após vá adicionando a direita do referencial os correntes e a
% esquerda os fixos, SEMPRE nas estremidades, seguindo a sequencia do
% exercicio

T = Rx(45)*Rz(60)*Trans(0,0,3)*B*Trans(0,6,0)*Rn(60);


%%
Trans(0,0,7)*Rz(21.8)*Trans(10.77,0,0)

%%
syms y beta r 

Rz(y)*Ro(beta)*Trans(r,0,0)

