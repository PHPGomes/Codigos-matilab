import RoboticaBiblioteca.*

%% denavit práticas rokisim

syms a1 a2 theta1 theta2;
clc
d = 0
alfa = 0

%% Fanuc LR Mate200iD
function dh = denavit(a, alfa, d, theta)
dh = [cosd(theta) -cosd(alfa)*sind(theta) sind(alfa)*sind(theta) a*cosd(theta)
     sind(theta) cosd(alfa)*cosd(theta) -sind(alfa)*cosd(theta) a*sind(theta)
     0 sind(alfa) cosd(alfa) d
     0 0 0 1]
end

clear all
clc

a01 = denavit(330, -90, 50, 0)
a12 = denavit(330, 180, 0, 0)
a23 = denavit(35, 90, 0, 0)
a34 = denavit(0, -90, -335, 0)
a45 = denavit(0, 90, 0, 0)
a56 = denavit(0, 180, -80, 0)

h03 = a01 * a12 * a23 * a34 * a45 * a56

% consertar

%% ABB_IRB120
clear all
clc
a01 = denavit(0, -90, 290, 90);
a12 = denavit(270, 0, 0, -90);
a23 = denavit(70, -90, 0, 20);
a34 = denavit(0, 90, 302, 0);
a45 = denavit(0, -90, 0, 0);
a56 = denavit(0, 0, 72, 40);

h06 = a01 * a12 * a23 * a34 * a45 * a56

% testado e deu certo!

%% ABB_IRB140
clear all
clc
a01 = denavit(70, -90, 352, 0)
a12 = denavit(360, 0, 0, -90)
a23 = denavit(0, -90, 0, 0)
a34 = denavit(0, 90, 380, 0)
a45 = denavit(0, -90, 0, 0)
a56 = denavit(0, 0, 65, 90)

h06 = a01 * a12 * a23 * a34 * a45 * a56

% testado e deu certo!

%% CRS A465
clear all
clc
a01 = denavit(0, -90, 330, 0)
a12 = denavit(305, 0, 0, 0)
a23 = denavit(0, 90, 0, 0)
a34 = denavit(0, -90, 330, 0)
a45 = denavit(0, 90, 0, 0)
a56 = denavit(0, 0, 76, 0)

h06 = a01* a12 * a23 * a34 * a45* a56

% consertar

%% teste
px = 0;
py = 750;
pz = 525;
d1 = 525;
s = pz - d1;
r = sqrt(px^2 + py^2)
d3 = sqrt(r^2 + s^2)
theta1 = atan2d (py, px)
theta2 = atan2d (s, r) + 90
disp(theta1, theta2, d3);