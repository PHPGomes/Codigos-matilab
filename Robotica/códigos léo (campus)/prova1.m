import RoboticaBiblioteca.*

%% Prova 1
% Igor Soldan Raimundo

%% Exercício 2
clc;
close all;
clear vars;

matriz4x4 = [0 0 1 867.18
             0 -1 0 404.37
             1 0 0 308.72
             0 0 0 1]

%syms r alpha l;
%Tcil(r,alpha,l)

% r * cos(alpha) = 867.18
% r * sin(alpha) = 404.37
% l = 308.72


%valores com a função movimentosTcil: r = 94.339, alpha = 32,005, L = 55.00
%[r, alpha, l] = movimentosTcil(80,50,55);
x = 867.18;
y = 404.37;
z = 308.72;
alpha = atan2d(y,x)
r = y/sind(alpha)
L = z

[thetaN, thetaO, thetaA] = angsRAG(matriz4x4);

%% Exercício 3

clc;
clear vars;
close all;

tba = trans(0,1,0) * trans(1,0,0) * trans(0,0,2) * trans(4,0,0)

syms r beta gama;
Tesf(r,beta,gama)

% r*cos(gama)*sin(beta) = 5
% r*sin(beta)*sin(gama) = 1
% r*cos(beta) = 2

movimentosTesf(5,1,2);