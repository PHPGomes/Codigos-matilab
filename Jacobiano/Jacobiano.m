%% Clear
clear
clc

%% Jacobiano
j1 = Jr(10);
j2 = Jp(8);
j3 = Jr(6);

% Matriz Jacobiana
J = [j1 j2 j3];