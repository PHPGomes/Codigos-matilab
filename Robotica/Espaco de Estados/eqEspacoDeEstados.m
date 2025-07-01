% Resolver equações espaço de estados
%% Clear
clear
clc

%% Equação espaço de estados
% A*X=B
A = [9 27;6 27];
B = [30;0];
C = inv(A)*B