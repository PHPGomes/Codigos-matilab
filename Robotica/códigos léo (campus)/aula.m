import RoboticaBiblioteca.*

%% aula

syms a1 a2 theta1 theta2;
clc
d = 0
alfa = 0

function dh = denavit(a, alfa, d, theta)
dh = [cosd(theta) -cosd(alfa)*sind(theta) sind(alfa)*sind(theta) a*cosd(theta)
     sind(theta) cosd(alfa)*cosd(theta) -sind(alfa)*cosd(theta) a*sind(theta)
     0 sind(alfa) cosd(alfa) d
     0 0 0 1]
end

a01 = denavit(0, -90, 290, 90);
a12 = denavit(270, 0, 0, -90);
a23 = denavit(70, -90, 0, 20);
a34 = denavit(0, 90, 302, 0);
a45 = denavit(0, -90, 0, 0);
a56 = denavit(0, 0, 72, 40);

h06 = a01 * a12 * a23 * a34 * a45 * a56