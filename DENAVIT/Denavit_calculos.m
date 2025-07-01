%% clear
clear
clc

%% Parametros
% teta,d,a,alpha

% a
a1 = 88;
a2 = 310;
a3 = 40;
a4 = 0;
a5 = 0;
a6 = 0;

% alpha
alpha1 = -90;
alpha2 = 180;
alpha3 = -90;
alpha4 = 90;
alpha5 = -90;
alpha6 = 0;

% d
d1 = 330;
d2 = 0;
d3 = 0;
d4 = -305;
d5 = 0;
d6 = -86.5;

% teta
teta1 = 0;
teta2 = -90;
teta3 = 0;
teta4 = 0;
teta5 = 0;
teta6 = 0;

H01 = Denavit(teta1,d1,a1,alpha1)
H12 = Denavit(teta2,d2,a2,alpha2)
H23 = Denavit(teta3,d3,a3,alpha3)
H34 = Denavit(teta4,d4,a4,alpha4)
H45 = Denavit(teta5,d5,a5,alpha5)
H56 = Denavit(teta6,d6,a6,alpha6)

T = H01*H12*H23*H34*H45*H56

