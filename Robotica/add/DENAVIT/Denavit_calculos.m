%% clear
clear
clc

% Parametros
% teta,d,a,alpha

% a (sempre absoluto) a>0 se der negativo pegar modulo
a1 = 0;
a2 = 320;
a3 = 975;
a4 = 200;
a5 = 0;
a6 = 0;

% alpha
alpha1 = 0;
alpha2 = -90;
alpha3 = 0;
alpha4 = 90;
alpha5 = 90;
alpha6 = -90;

% d
d1 = 0;
d2 = 680;
d3 = 0;
d4 = 0;
d5 = 1087;
d6 = 0;

% teta
teta1 = 25;
teta2 = 40;
teta3 = 150;
teta4 = 90;
teta5 = 180;
teta6 = 30;

H01 = Denavit(teta1,d1,a1,alpha1)
H12 = Denavit(teta2,d2,a2,alpha2)
H23 = Denavit(teta3,d3,a3,alpha3)
H34 = Denavit(teta4,d4,a4,alpha4)
H45 = Denavit(teta5,d5,a5,alpha5)
H56 = Denavit(teta6,d6,a6,alpha6)

T = H01*H12*H23*H34*H45*H56

