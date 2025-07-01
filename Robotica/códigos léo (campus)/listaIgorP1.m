%% Lista para P1 de robótica

import RoboticaBiblioteca.*

%% Exercício 1:
clc;
clear vars;
close all;
syms alpha beta r;
rot('z', alpha) % separando o primeiro movimento em alpha depois 90 pois rot('z', alpha + 90) precisa ser separada
rot('z', 90) % segunda parte do primeiro movimento
rot('y', beta) % rotação no eixo 'o' (eixo 'y') em beta
trans(0,0,r) % translação ao longo do eixo 'a' (eixo 'z') em r (0, 0, r)

%multiplicando as matrizes

rot('z',alpha)*rot('z',90)*rot('y',beta)*trans(0,0,r)

% letra b

% -r * sin(alpha) * sin (beta) = 400
% r * cos(alpha) * sin (beta) = 50
% r * cos(beta) = 300
% tangente x = seno x / cos x

alpha = atan2d(-400,50) % como ambas as equações estão multiplicando por sin(beta), nesse sistema, tg(alpha) = -400/50, fazendo arctg pra achar o angulo alpha invés do valor da tg(alpha)

% r * cos(alpha) * sin(beta) = 50
% r * sin(beta) = 50/cos(-82,8750)

rsb = 50/cosd(alpha) % achando o valor de r * sin(beta)

% tangente beta = seno beta / cos beta
% r * cos(beta) = 300
% r * sin(beta) = rsb
% mesma ocasião, como ambas as equações estão multiplicando por r, a
% relação sin(beta)/cos(beta) = tg(beta) pode ser usado os valores achados
% invés do valor da tg(beta), queremos beta, então arctg de novo

beta = atan2d(rsb, 300)

% r * cos(beta) = 300
% r = 300 / cos(beta)

r = 300/cosd(beta)

%% Exercício 2:
clc;
clear vars;
close all;
% pc = d06 - d6 * r06 * k
H06 = [0 -0.7 -0.7 300;
       0 0.7 -0.7 -400;
       1 0 0 25;
       0 0 0 1]

d06 = H06(1:3,4) % movimento de d06
d6 = 65 % dado no enunciado
r06 = H06(1:3,1:3) %movimento de r06

pc = PC(d06,d6,r06)

% pegando a matriz da letra a)
% -r * sin(alpha) * sin(beta) = 345.5
% r * cos(alpha) * sin(beta) = -354.5
% r * cos(beta) = 25

alpha = atan2d(-pc(1,1),pc(2,1)) % fazendo arctg da posição 1:1 da matriz pc pela posição 2:1 da matriz pc para achar alpha

% r * sin(beta) = -354.5 / cos(alpha)

rsb = pc(2,1)/cosd(alpha) % achando r * sin(beta)

% r * sin(beta) = valor achado
% r * cos(beta) = 25
% só fazer arctg de novo pra achar o valor de beta

beta = atan2d(rsb,pc(3,1))

% r * cos(beta) = 25
% r = 25/cos(beta)

r = pc(3,1)/cosd(beta)

%determinada a cinemática de posição acima, agora determinando a cinemática
%de orientação

T03 = rot('z',alpha) * rot('z',90) * rot('y', beta) * trans(0,0,r)

R03 = T03(1:3,1:3)

R06 = H06(1:3,1:3)

R36 = (R03)^-1 * R06

T36 = [R36, zeros(3,1)
       zeros(1,3), 1]

angsEuler(T36);

%% Exercício 3

clc;
clear vars;
close all;

% Letra a)

% Referencial B foi girado 90º em x, então foi transladado 3 polegadas ao
% eixo atual a (z) antes de ser girado 90º em z. finalmente foi transladado
% 5 polegadas ao eixo atual o (y)

% declarando o referencial B

B = [0 1 0 1
     1 0 0 1
     0 0 -1 1
     0 0 0 1]

% rot('x', 90) * B * trans(0, 0, 3) * rot('z', 90) * trans(0, 5, 0)

matrizFinal = rot('z',90)*rot('x',90)*B*trans(0,0,3)*trans(0,5,0)

% Letra b)

syms r alpha L;
Tcil(r, alpha, L)

% r * cos(alpha) = -2
% r * sin(alpha) = 6
% L = 1

[r, alpha, L] = movimentosTcil(-2,6,1);

[phi, theta, psi] = angsEuler(matrizFinal);

% Letra c)

syms r beta gama;
Tesf(r, beta, gama)

% r * cos(gama) * sin(beta) = -2
% r * sin(beta) * sin(gama) = 6
% r * cos(beta) = 1

[r, beta, gama] = movimentosTesf(-2, 6, 1);
[thetaN, thetaO, thetaA] = angsRAG(matrizFinal);