%% práticas robótica dia 26/11

syms a1 a2 theta1 theta2;
clc
d = 0;
alfa = 0;

% a - distância entre os zs (medida sobre o vetor x)
% alfa - ângulo de rotação em zs
% d - distância entre os xs (medida sobre o vetor z)
% theta - ângulo de rotaço em xs

% fun��o denavit

function dh = denavit(a, alfa, d, theta)
dh = [cosd(theta) -cosd(alfa)*sind(theta) sind(alfa)*sind(theta) a*cosd(theta)
     sind(theta) cosd(alfa)*cosd(theta) -sind(alfa)*cosd(theta) a*sind(theta)
     0 sind(alfa) cosd(alfa) d
     0 0 0 1];
end

%% ABB_IRB120

a01 = denavit(0, -90, 290, 0)
a12 = denavit(270, 0, 0, -90)
a23 = denavit(70, -90, 0, 0)
a34 = denavit(0, 90, 302, 0)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(0, 0, 72, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

%testado e funciona.

%% ABB_IRB140
clear all
clc

a01 = denavit(70, -90, 352, 0)
a12 = denavit(360, 0, 0, -90)
a23 = denavit(0, -90, 0, 0)
a34 = denavit(0, 90, 380, 0)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(0, 0, 65, 180)

h06 = a01 * a12 * a23 * a34 * a45 * a56

%testado e funciona.

%% ABB_IRB1600_145
clear all
clc

a01 = denavit(0, 0, 486.5, 0)
a12 = denavit(150, -90, 0, -90)
a23 = denavit(700, 0, 0, 0)
a34 = denavit(0, -90, 600, 0)
a45 = denavit(0, 0, 0, 0)
a56 = denavit(0, 0, 0, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

% testado e tem erro

%% ABB_IRB4400
clear all
clc

a01 = denavit(200, -90, 680, 0)
a12 = denavit(-890, 0, 0, 90)
a23 = denavit(-150, 90, 0, 0)
a34 = denavit(0, -90, 880, 0)
a45 = denavit(0, 90, 0, 0)
a56 = denavit(0, 0, 140, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

% testado e funciona.

%% ABB_IRB4600
clear all
clc

a01 = denavit(0, 0, 0, 0)
a12 = denavit(175, -90, 0, 0)
a23 = denavit(900, 0, 0, 0)
a34 = denavit(175, -90, 960, 0)
a45 = denavit(0, 90, 0, 0)
a56 = denavit(0, -90, 0, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

% testado e funciona.

%% Adept Viper
clear all
clc

a01 = denavit(75, -90, 335, 0)
a12 = denavit(270, 0, 0, -90)
a23 = denavit(0, -90, 0, 0)
a34 = denavit(90, 90, 295, 0)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(0, 0, 80, 180)

h06 = a01 * a12 * a23 * a34 * a45 * a56
%% CRS A465
clear all
clc

a01 = denavit(0, -90, 330, 0)
a12 = denavit(305, 0, 0, -90)
a23 = denavit(0, -90, 0, -90)
a34 = denavit(0, 90, 330, 0)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(0, 0, 76, 180)

h06 = a01 * a12 * a23 * a34 * a45 * a56

% testado e funciona

%% Fanuc LR Mate 200iD - 7L
clear all
clc

a01 = denavit(50, -90, 330, 0)
a12 = denavit(440, 180, 0, -90)
a23 = denavit(35, -90, 0, 0)
a34 = denavit(0, 90, -420, 0)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(0, 0, -80, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

% testado e funciona

%% Fanuc M-710iC/50 
clear all
clc
a01 = denavit(150, -90, 570, 0)
a12 = denavit(870, 180, 0, -90)
a23 = denavit(170, -90, 0, 0)
a34 = denavit(0, 90, -1016, 0)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(0, 0, -175, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

% testado e funciona
%% Motoman_MH5F
clear all
clc

a01 = denavit(88, -90, 330, 0)
a12 = denavit(310, -180, 0, -90)
a23 = denavit(40, -90, 0, 0)
a34 = denavit(0, 90, -305, 0)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(0, 0, -80, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

%testado e funciona.

%% Staubli TX-40
clear all
clc

a01 = denavit(0, 0, 0, 0)
a12 = denavit(0, -90, 0, 0)
a23 = denavit(225, 0, 35, 0)
a34 = denavit(0, 90, 225, 0)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(0, -90, 65, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

% testado e tem erro

%% Staubli TX-200
clear all
clc

a01 = denavit(250, -90, 642, 0)
a12 = denavit(950, 0, 0, 0)
a23 = denavit(0, 90, 0, 0)
a34 = denavit(0, -90, 800, 0)
a45 = denavit(0, 90, 0, 0)
a56 = denavit(0, 0, 0, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

%testado e funciona.

%% UR5
clear all
clc

a01 = denavit(0, 90, 89.5, 0)
a12 = denavit(-425, 0, 0, 0)
a23 = denavit(-392, 0, 0, 0)
a34 = denavit(0, 90, 109, 0)
a45 = denavit(0, -90, 94.6, 0)
a56 = denavit(0, 0, 0, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

%testado e parcialmente (???).

%% UR10
clear all
clc

a01 = denavit(0, 90, 127, 0)
a12 = denavit(612, 0, 0, 0)
a23 = denavit(572, 0, 0, 0)
a34 = denavit(0, 90, 164, 0)
a45 = denavit(0, -90, 115, 0)
a56 = denavit(0, 0, 92, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

%testado e parcialmente (???).

%% Kuka KR C4
clear all
clc

a01 = denavit(0, 0, 0, 0)
a12 = denavit(0, 90, L3, 90)
a23 = denavit(0, 0, L1, 0)
a34 = denavit(L4, 90, L2, 0)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(L5, 0, 0, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56