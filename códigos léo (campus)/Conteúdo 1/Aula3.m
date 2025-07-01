clear; clc;

import RoboticaBiblioteca.*

% Exercício 1 - Cartesiano + RAG
% Calculando a cinemática de posição
[Px, Py, Pz] = movimentosTcart(4.33, 2.50, 8)

% Calculando a cinemática de orientação
%ThetaA = atan2d(0.505, 0.354)
%ThetaO = atan2d(-(-0.788), (0.354*cosd(55) + 0.505*sind(55)))
%ThetaN = atan2d(-0.475*cosd(55) + 0.649 * sind(55), 0.722*cosd(55) - (-0.649*sind(55)))

[ThetaN, ThetaO, ThetaA] = angsRAG([0.354 -0.674 0.649 4.33;
                                    0.505 0.722 0.475 2.50;
                                    -0.788 0.160 0.595 8;
                                    0 0 0 1])

% Tp = Tcart(4.33,2.50,8)*rot('z', ThetaA)*rot('y',ThetaO)*rot('x', ThetaN)
Tp = Tcart(4.33,2.50,8)*rotRAG(ThetaA, ThetaO, ThetaN)



% Exercício 2 - Cilíndrico + RAG
% Calculando a cinemática de posição
%alpha = atan2d(2.5,4.33)
%r = 2.5/sind(alpha)
%l = 8
[r, alpha, l] = movimentosTcil(4.33, 2.50, 8)

% Calculando a cinemática de orientação
%ThetaA = atan2d(0.505, 0.354) - 30 % O manipulador já rotacionou em z na cinemática de posição
%ThetaO = atan2d(-(-0.788), (0.354*cosd(55) + 0.505*sind(55)))
%ThetaN = atan2d(-0.475*cosd(55) + 0.649 * sind(55), 0.722*cosd(55) - (-0.649*sind(55)))

[ThetaN, ThetaO, ThetaA] = angsRAG([0.354 -0.674 0.649 4.33;
                                    0.505 0.722 0.475 2.50;
                                    -0.788 0.160 0.595 8;
                                    0 0 0 1])
ThetaA = ThetaA - 30 % O manipulador já rotacionou em z na cinemática de posição (alpha = 30)

%Tp = Tcil(r, alpha, l)*rot('z', ThetaA)*rot('y',ThetaO)*rot('x', ThetaN)
Tp = Tcil(r, alpha, l)*rotRAG(ThetaA, ThetaO, ThetaN)



% Exercício 3
% Calculando a cinemática de posição
%gamma = atan2d(7,5)
%rsB = 7/cosd(gamma)
%beta = atan2d(rsB,3)
%r = rsB/cosd(beta)
[r, beta, gamma] = movimentosTesf(5, 7, 3) %REVER

% Calculando a cinemática de orientação
%Teta = atan2d(sqrt(1 - (0.766^2)), 0.766)
%Phi = atan2d(-0.22, -0.604)
%qsi = atan2d(-0.199, -(0.611))

[phi ,theta, psi] = angsEuler([0.579 -0.548 -0.604 5;
                               0.540 0.813 -0.220 7;
                               0.611 -0.199 0.766 3;
                               0 0 0 1])
phi = phi - gamma;
theta = theta - beta;

Tp = Tesf(r, beta, gamma)*rotZYZ(phi, theta, psi) % REVER
