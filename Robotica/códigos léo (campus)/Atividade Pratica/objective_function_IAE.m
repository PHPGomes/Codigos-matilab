% Integral Absoluta do Erro (IAE)

function IAE = objective_function_IAE(x)

global kp ki kd

kp = x(1);
ki = x(2);
kd = x(3);

time = 0:0.1:200;

[T] = sim('AtividadeAvaliativaQ2MotorB', time);

IAE = (sum(abs(erro)));