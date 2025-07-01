% Média do Erro Quadrático (MSE)

function MSE = objective_function_MSE(x)

global Kp Ki Kd

Kp = x(1);
Ki = x(2);
Kd = x(3);

time = 0:0.1:200;

N = length(time);

[T] = sim('AtividadeAvaliativaQ2MotorB', time);

MSE = (sum(abs(erro).*2))/N;