%% práticas robótica dia 26/11

syms a1 a2 theta1 theta2;
clc
d = 0
alfa = 0

% função denavit

function dh = denavit(a, alfa, d, theta)
dh = [cosd(theta) -cosd(alfa)*sind(theta) sind(alfa)*sind(theta) a*cosd(theta)
     sind(theta) cosd(alfa)*cosd(theta) -sind(alfa)*cosd(theta) a*sind(theta)
     0 sind(alfa) cosd(alfa) d
     0 0 0 1]
end

%% Fanuc LR Mate 200iD
clear all
clc

a01 = denavit(330, -90, 50, 0)
a12 = denavit(330, 180, 0, 0)
a23 = denavit(35, 90, 0, 0)
a34 = denavit(0, -90, -335, 0)
a45 = denavit(0, 90, 0, 0)
a56 = denavit(0, 180, -80, 0)

h03 = a01 * a12 * a23 * a34 * a45 * a56

%
%% ABB_IRB120
clear all
clc

a01 = denavit(0, -90, 290, 20)
a12 = denavit(270, 0, 0, -90)
a23 = denavit(70, -90, 0, 60)
a34 = denavit(0, 90, 302, -110)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(0, 0, 72, 0)

h06 = a01 * a12 * a23 * a34 * a45 * a56

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