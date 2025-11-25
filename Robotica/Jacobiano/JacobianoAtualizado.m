%% clear
clear;close all;clc;

%% D-H 

% Parametros
% teta,d,a,alpha

% a
a1 = 200;
a2 = 890;
a3 = 150;
a4 = 0;
a5 = 0;
a6 = 0;


% alpha
alpha1 = -90;
alpha2 = 0;
alpha3 = -90;
alpha4 = 90;
alpha5 = -90;
alpha6 = 0;

% d
d1 = 680;
d2 = 0;
d3 = 0;
d4 = 880;
d5 = 0;
d6 = 140;

% teta
teta1 = 90;
teta2 = -90;
teta3 = 0;
teta4 = 100;
teta5 = 10;
teta6 = 180;

H01 = Denavit(teta1,d1,a1,alpha1);
H12 = Denavit(teta2,d2,a2,alpha2);
H23 = Denavit(teta3,d3,a3,alpha3);
H34 = Denavit(teta4,d4,a4,alpha4);
H45 = Denavit(teta5,d5,a5,alpha5);
H56 = Denavit(teta6,d6,a6,alpha6);

T = H01*H12*H23*H34*H45*H56;

%% H 0 a n

H01;
H02 = H01*H12;
H03 = H02*H23;
H04 = H03*H34;
H05 = H04*H45;
H06 = H05*H56;

%% Parametros Jacobiano Ji

% Variaveis Zi_1 
Z0 = [0;0;1];
Z1 = H01(1:3,3);
Z2 = H02(1:3,3);
Z3 = H03(1:3,3);
Z4 = H04(1:3,3);
Z5 = H05(1:3,3);

% Variaveis Oi_1
O0 = [0;0;0];
O1 = H01(1:3,4);
O2 = H02(1:3,4);
O3 = H03(1:3,4);
O4 = H04(1:3,4);
O5 = H05(1:3,4);

% Variavel On
ON = H06(1:3,4);

%% Calculo Matriz Jacobiana

% Calculo Ji
J1 = Jr(Z0,ON,O0);
J2 = Jr(Z1,ON,O1);
J3 = Jr(Z2,ON,O2);
J4 = Jr(Z3,ON,O3);
J5 = Jr(Z4,ON,O4);
J6 = Jr(Z5,ON,O5);

J = [J1 J2 J3 J4 J5 J6]

%% Jacobiano Velocidade end-efector
Qponto = [0;0;0;0;0;0];
Jac = J*Qponto;