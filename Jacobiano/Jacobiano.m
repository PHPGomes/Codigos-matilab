clc; clear; close all;


% Comprimentos dos elos (valores genéricos)
a1 = 0;     d1 = 0.4;     alpha1 = -pi/2;     theta1 = 0;
a2 = 0.25;  d2 = 0;       alpha2 = 0;         theta2 = 0;
a3 = 0.25;  d3 = 0;       alpha3 = 0;         theta3 = 0;
a4 = 0;     d4 = 0.4;     alpha4 = pi/2;      theta4 = 0;
a5 = 0;     d5 = 0;       alpha5 = -pi/2;     theta5 = 0;
a6 = 0;     d6 = 0.1;     alpha6 = 0;         theta6 = 0;


% Matrizes de transformação homogênea
T01 = dh(theta1, d1, a1, alpha1);
T12 = dh(theta2, d2, a2, alpha2);
T23 = dh(theta3, d3, a3, alpha3);
T34 = dh(theta4, d4, a4, alpha4);
T45 = dh(theta5, d5, a5, alpha5);
T56 = dh(theta6, d6, a6, alpha6);

% Transformações cumulativas
T02 = (T01*T12);
T03 = (T02*T23);
T04 = (T03*T34);
T05 = (T04*T45);
T06 = (T05*T56);  % Posição final

% Posição do efetuador
pe = T06(1:3, 4);

% ---------- Jacobiano Geométrico ----------

% Vetores de posição das origens
O0 = [0; 0; 0];
O1 = T01(1:3,4);
O2 = T02(1:3,4);
O3 = T03(1:3,4);
O4 = T04(1:3,4);
O5 = T05(1:3,4);
O6 = T06(1:3,4);

% Vetores z
Z0 = [0; 0; 1];
Z1 = T01(1:3,3);
Z2 = T02(1:3,3);
Z3 = T03(1:3,3);
Z4 = T04(1:3,3);
Z5 = T05(1:3,3);

% Cálculo das colunas do Jacobiano
Jv1 = (cross(Z0, O6 - O0));
Jv2 = (cross(Z1, O6 - O1));
Jv3 = (cross(Z2, O6 - O2));
Jv4 = (cross(Z3, O6 - O3));
Jv5 = (cross(Z4, O6 - O4));
Jv6 = (cross(Z5, O6 - O5));

Jw1 = Z0; Jw2 = Z1; Jw3 = Z2;
Jw4 = Z3; Jw5 = Z4; Jw6 = Z5;

% Jacobiano 6x6
J = ([Jv1 Jv2 Jv3 Jv4 Jv5 Jv6;
              Jw1 Jw2 Jw3 Jw4 Jw5 Jw6]);

% ---------- Exibir ----------
disp('Matriz de Posição Final (T06):');
disp((T06))

disp('Jacobiano Geométrico J:');
disp(J)