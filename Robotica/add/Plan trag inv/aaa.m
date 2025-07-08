%% Matriz
Mf = [1 0 0 0; 0 1 0 0 ; 0 0 1 0;0 0 0 1] % Matriz Padrão 4x4 (Dado no exercicio)

%% terceiro grau
gamma = atan2d(Mf(2,1),Mf(1,1));
rsb = Mf(1,1)/cosd(gamma);
theta = atan2d(rsb,Mf(3,3))
r = Mf(3,3)/cosd(theta);



%% terceiro grau
theta = atan2d(Mf(2,1),Mf(1,1))
rsb = Mf(1,1)/cosd(theta);
beta = atan2d(rsb,Mf(3,3));
r = Mf(3,3)/cosd(beta);
