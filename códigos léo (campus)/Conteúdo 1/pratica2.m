clear; clc;

import RoboticaBiblioteca.*

% Manipulador Cartesiano
syms x y z;
Tcart(x, y, z)

% Manipulador cilindrico
syms l alpha r;
Tcil(r, alpha, l)

% Manipulador esferico
syms gamma beta;
Tesf(r, beta, gamma)

disp('Exercício Pratico')
disp('Parte -> a)')
disp('Para A)')
[Px, Py, Pz] = movimentosTcart(10, 4, 7)

disp('Para B)')
[Px, Py, Pz] = movimentosTcart(-4, 5, 0)


disp('Parte -> b)')
disp('Para A)')
[r, alpha, l] = movimentosTcil(10, 4, 7)


disp('Para B)')
[r, alpha, l] = movimentosTcil(-4, 5, 0)

disp('Parte -> c)')
disp('Para A)')
[r, betta, gamma] = movimentosTesf(10, 4, 7)

disp('Para B)')
[r, betta, gamma] = movimentosTesf(-4, 5, 0)
% FORA DO ESPAÇO DE TRABALHO DO MANIPULADOR!!
