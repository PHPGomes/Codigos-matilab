%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%> @file RoboticaBiblioteca.m                                                      %
%> @brief Funcoes de Robotica para calculo de angulos das juntas de um manipulador %
%> @author Marcos Carvalho Ferreira                                                %
%> @date 2023-09-05                                                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

classdef RoboticaBiblioteca
    
    methods (Static)
        function printListaManipuladores()
            disp('--------------------> Lista de Manipuladores <-----------------------')
            disp('1 - Manipulador Cartesiano: PPP')
            disp('   1.1 - Manipulador Pórtico: cartesianos, mas com base em suportes')
            disp('2 - Manipulador Cilíndrico: RPP')
            disp('3 - Manipulador Articulados/Antropomórficos: RRR')
            disp('4 - Manipulador Esféricos/Polares: RRP')
            disp('5 - Manipulador SCARA: RRP, diferente do esférico, tem três eixos z0,')
            disp('                       z1 e z2 todos verticais e paralelos')
        end
        
        function maoDireita()
            disp('--- Regra da mão Direita ---');
            disp('     eixo x --- indicador');
            disp('     eixo y --- meio');
            disp('     eixo z --- dedão');
            disp('----------------------------');
            disp('ver palma da mão -> positivo');
            disp('para z: < positivo | > negativo');
            disp('para x: palma da mão pra cima - positivo | palma da mão pra baixo - negativo');
            disp('para y: pistola pra baixo - positivo | pistola pra cima - negativo')
        end

        function confusao()
            disp('phi = thetaA');
            disp('theta = thetaO');
            disp('psi = thetaN');
        end
        
        function[R] = matrizRot(eixo, angulo)
            if eixo == 'x' || eixo == 'n'
                R = [1, 0, 0;
                     0, cosd(angulo), -sind(angulo);
                     0, sind(angulo), cosd(angulo)];
            elseif eixo == 'y' || eixo == 'o'
                R = [cosd(angulo), 0, sind(angulo);
                     0, 1, 0;
                     -sind(angulo), 0, cosd(angulo)];
            elseif eixo == 'z' || eixo == 'a'
                R = [cosd(angulo), -sind(angulo), 0;
                     sind(angulo), cosd(angulo), 0;
                     0, 0, 1];
            else
                disp('matrizRot: Eixo inválido');
                R = eye(3);
            end
        end
        
        function[R] = matrizRotSyms(eixo, angulo)
            if eixo == 'x' || eixo == 'n'
                R = [1, 0, 0;
                     0, cos(angulo), -sin(angulo);
                     0, sin(angulo), cos(angulo)];
            elseif eixo == 'y' || eixo == 'o'
                R = [cos(angulo), 0, sin(angulo);
                     0, 1, 0;
                     -sin(angulo), 0, cos(angulo)];
            elseif eixo == 'z' || eixo == 'a'
                R = [cos(angulo), -sin(angulo), 0;
                     sin(angulo), cos(angulo), 0;
                     0, 0, 1];
            else
                disp('matrizRotSyms: Eixo inválido');
                R = eye(3);
            end
        end
        
        function[T] = rot(eixo, ang)
            if isnumeric(ang)
                R = RoboticaBiblioteca.matrizRot(eixo, ang);
            else
                R = RoboticaBiblioteca.matrizRotSyms(eixo, ang);
            end
            T = [R, zeros(3,1);
                 zeros(1,3), 1];
        end
        
        function[R] = trans(eixo_x, eixo_y, eixo_z)
            R = [1, 0, 0, eixo_x;
                 0, 1, 0, eixo_y;
                 0, 0, 1, eixo_z;
                 0, 0, 0, 1];
        end
        
        function[R] = Tcart(Px, Py, Pz)
            %     Neste caso haverá três movimentos lineares ao longo dos eixos
            % x, y, e z. Neste tipo de robô todos os atuadores são lineares e o 
            % posicionamento da mão do robô é realizado movendo as três articulações 
            % lineares ao longo dos três eixos.
            R = RoboticaBiblioteca.trans(Px, Py, Pz);
        end
        
        function[R] = Tcil(r, alpha, L)
            %     Neste caso haverá duas translações lineares e uma rotação. A 
            % sequência é uma translação r ao longo do eixo x, a rotação α sobre 
            % o eixo z, e uma translação de l ao longo do eixo z.
            R = RoboticaBiblioteca.trans(0,0,L)*RoboticaBiblioteca.rot('z',alpha)*RoboticaBiblioteca.trans(r,0,0);
        end
        
        function[R] = Tesf(r, beta, gamma)
            %     Um sistema em coordenadas esféricas consiste em um movimento 
            % linear e duas rotações. A seqüência é uma translação de r ao longo 
            % do eixo z, uma rotação de β em torno do eixo y, e uma rotação de γ 
            % em torno de z.
            R = RoboticaBiblioteca.rot('z',gamma)*RoboticaBiblioteca.rot('y',beta)*RoboticaBiblioteca.trans(0,0,r);
        end
        
        function [Px, Py, Pz] = movimentosTcart(x, y, z)
            Px = x;
            Py = y;
            Pz = z;
            str = sprintf("Px = %f | Py = %f | Pz = %f",Px,Py,Pz);
            disp(str);
        end
        
        function [r, alpha, l] = movimentosTcil(x, y, z)
            alpha = atan2d(y,x);
            r = y/sind(alpha);
            l = z;
            str = sprintf("r = %f | alpha = %f | L = %f",r,alpha,l);
            disp(str);
        end
        
        function [r, beta, gamma] = movimentosTesf(x, y, z)
            gamma = atan2d(y,x);
            rsB = x/cosd(gamma);
            beta = atan2d(rsB,z);
            r = z/cosd(beta);
            str = sprintf("r = %f | beta = %f | gamma = %f",r,beta,gamma);
            disp(str);
        end
        
        function [R] = rotZYZ(phi,theta,psi)
            % Movimentações correntes
            R = RoboticaBiblioteca.rot('z', phi)*RoboticaBiblioteca.rot('y', theta)*RoboticaBiblioteca.rot('z', psi);
        end
        
        function [varargout] = angsEuler(matriz4x4)
            if matriz4x4(3,3) == 1 || matriz4x4(3,3) == -1
                theta = 0;
                phi_plus_psi = atan2d(matriz4x4(2,1), matriz4x4(1,1));
                varargout{1} = theta;
                varargout{2} = phi_plus_psi;
                str = sprintf("theta = %f | phi + psi = %f",theta,phi_plus_psi);
                disp(str);
            elseif matriz4x4(3,3) < 1
                theta = atan2d(sqrt(1 - (matriz4x4(3,3)^2)), matriz4x4(3,3));
                phi = atan2d(matriz4x4(2,3), matriz4x4(1,3));
                psi = atan2d(matriz4x4(3,2), -matriz4x4(3,1));
                varargout{1} = phi;
                varargout{2} = theta;
                varargout{3} = psi;
                str = sprintf("phi = %f | theta = %f | psi = %f",phi,theta,psi);
                disp(str);
            else
                disp('Algo deu errado! Reveja!')
            end
        end
        
        function [R] = rotRAG(phi,theta,psi)
            R = RoboticaBiblioteca.rot('z', phi)*RoboticaBiblioteca.rot('y', theta)*RoboticaBiblioteca.rot('x', psi);
        end
        
        function [thetaN, thetaO, thetaA] = angsRAG(matriz4x4)
            thetaA = atan2d(matriz4x4(2,1), matriz4x4(1,1));
            thetaO = atan2d(-matriz4x4(3,1), (matriz4x4(1,1)*cosd(thetaA) + matriz4x4(2,1)*sind(thetaA)));
            thetaN = atan2d(-matriz4x4(2,3)*cosd(thetaA) + matriz4x4(1,3)*sind(thetaA), matriz4x4(2,2)*cosd(thetaA) - (matriz4x4(1,2)*sind(thetaA)));
            str = sprintf("ThetaN = %f | ThetaO = %f | ThetaA = %f",thetaN,thetaO,thetaA);
            disp(str);
        end

        function [pc] = PC(d06, d6, R06)
            pc = d06 - d6*R06*[0; 0; 1];
        end
        
        function usarDenavit()
            disp('denavit(theta, d, a, alpha)')
        end

        function [dh] = denavit(theta, d, a, alpha)
            dh = RoboticaBiblioteca.rot('z',theta)*RoboticaBiblioteca.trans(0,0,d)*RoboticaBiblioteca.trans(a,0,0)*RoboticaBiblioteca.rot('x',alpha);
        end
        
        function [H03] = MatProgDenavit3DOF(M)
            A01 = RoboticaBiblioteca.denavit(M(1,4), M(1,3), M(1,1), M(1,2))
            A12 = RoboticaBiblioteca.denavit(M(2,4), M(2,3), M(2,1), M(2,2))
            A23 = RoboticaBiblioteca.denavit(M(3,4), M(3,3), M(3,1), M(3,2))
            H03 = A01*A12*A23;
        end

        function [H06] = MatProgDenavit6DOF(M)
            A01 = RoboticaBiblioteca.denavit(M(1,4), M(1,3), M(1,1), M(1,2))
            A12 = RoboticaBiblioteca.denavit(M(2,4), M(2,3), M(2,1), M(2,2))
            A23 = RoboticaBiblioteca.denavit(M(3,4), M(3,3), M(3,1), M(3,2))
            A34 = RoboticaBiblioteca.denavit(M(4,4), M(4,3), M(4,1), M(4,2))
            A45 = RoboticaBiblioteca.denavit(M(5,4), M(5,3), M(5,1), M(5,2))
            A56 = RoboticaBiblioteca.denavit(M(6,4), M(6,3), M(6,1), M(6,2))
            H06 = A01*A12*A23*A34*A45*A56;
        end
        
        % Funções para os calculos e otimização dos ganhos dos controladores PID
        
        function symFT = tf2sym(FT)
            % Converte uma FT em sym
            % FT => funcao de transferencia
            arguments
                FT tf
            end
            syms s;
            Num = poly2sym(FT.Numerator{1,1},s);
            Den = poly2sym(FT.Denominator{1,1},s);
            atraso = FT.OutputDelay;
            if(atraso ~= 0 )
                symFT = simplify(Num*exp(-atraso*s)/Den);
            else
                symFT = simplify(Num/Den);
            end
        end
        
        function L = lineTanInflex(Gsym,indexInflex,dispPI) % ANALISAR indexInflex automaticamente
            % Retorna a expressao simbolica da reta tangente ao ponto de inflexao
            % Gsym => FT simbolica
                % Gsym = PersonalRobotic.tf2sym(G); opcao para entrar com TF
            % dispPI => booleano para printar pontos de inflexao
                % serve para analisar alguns erros
            syms t;
            Gt = ilaplace(Gsym);
            d2Gt = simplify(diff(Gt,t,2));
            pontos_de_inflexao = double(solve(d2Gt == 0,t));
            if(dispPI)
                pontos_de_inflexao
            end
            if(length(pontos_de_inflexao) > 1)
                if(~isreal(pontos_de_inflexao))
                    t_inflex = real(pontos_de_inflexao(indexInflex)); % considera o 2° ponto
                else
                    t_inflex = pontos_de_inflexao(indexInflex);
                end
            else
                if(~isreal(pontos_de_inflexao))
                    t_inflex = real(pontos_de_inflexao(1));
                else
                    t_inflex = pontos_de_inflexao(1);
                end
            end
            y_inflex = double(subs(Gt, t, t_inflex));
            dGt = simplify(diff(Gt,t));
            m = double(subs(dGt,t,t_inflex));
            L = simplify(m*t - m*t_inflex + y_inflex);
        end
        
        function [Gapx, Kp, Ki, Kd] = ZNajustavel(G, M, znPlots)
            % considera entrada a degrau
            % G => FT
            % M => amplitude do degrau
            % znPlots => boolean para plotar graficos ou nao
            syms t;
            s = tf('s');
            Mlinha = dcgain(G)
            Gsym = PersonalRobotic.tf2sym(G*M/s);
            tanInfSym = lineTanInflex(Gsym,3,false); % CONSERTAR esse 3
            T = double(solve(tanInfSym==0,t))
            Gt = ilaplace(Gsym);
            T1 = double(solve(Gt==(dcgain(G)*0.632),t))
            tau = T1 - T
            k = Mlinha/M
            Gapx = (k*exp(-T*s))/(tau*s + 1);
            Kp = 1.2*tau/T;
            Ti = 2*T
            Td = 0.5*T
            Ki = Kp/Ti;
            Kd = Kp*Td;
            
            if(znPlots)
                figure(1);
                step(G*M)
                limitStep = axis;
                temp = (0:0.1:limitStep(2)); % limitStep(2) = xMax no grafico
                tanInflex = subs(tanInfSym,t,temp);
                y = [dcgain(G)*0.632, dcgain(G)*0.632];
                x = [0,T1*1.1]; % limitStep(2) = xMax no grafico
                hold on
                plot(x,y,'--r')
                plot(temp,tanInflex,'--k')
                plot([T,T],[0,dcgain(G)/4],'--k') % dcgain(G)/6 valor pequeno arbitrario
                plot([T1,T1],[0, dcgain(G)*0.632*1.1],'r--')
                grid on
                title("Ziegler-Nichols auto-ajustável")
                legend("FT","Define T1","Define T")
                hold off
                
                figure(2);
                step(G*M)
                hold on
                step(Gapx*M)
                grid on
                title("Comparação - planta com modelo aproximado")
                legend("Planta","Modelo aproximado")
                hold off
            end
        end

        function [Gapx, Kp, Ki, Kd] = ZNnaoAjustavel(G, M, tLim, znPlots)
            % considera entrada a degrau
            % G => FT
            % M => amplitude do degrau
            % tLim => limite do eixo t ajustado
            % znPlots => boolean para plotar graficos ou nao
            syms t;
            s = tf('s');
            Gsym = RoboticaBiblioteca.tf2sym(G*M/s);

            Gt = ilaplace(Gsym);
%             d2Gt = simplify(diff(Gt,t,2))
%             double(solve(d2Gt==0,t))
            tL = tLim/2;
            y = double(subs(Gt, t, tL));
            dGt = simplify(diff(Gt,t));
            m = double(subs(dGt,t,tL));
            Lsym = simplify(m*t - m*tL + y);
            
            T = double(solve(Lsym==0,t))
%             Gt = ilaplace(Gsym);
            k = m/M
            Gapx = (k*exp(-T*s))/s;
            Kp = 1.2/(T*k);
            Ti = 2*T
            Td = 0.5*T
            Ki = Kp/Ti;
            Kd = Kp*Td;
            
            if(znPlots)
                figure(1);
                step(G*M)
                xlim([0,tLim])
                limitStep = axis;
                temp = (0:0.1:limitStep(2)); % limitStep(2) = xMax no grafico
                L = subs(Lsym,t,temp);
                hold on
                plot(temp,L,'--k')
                plot([T,T],[0,limitStep(4)/4],'--k') % dcgain(G)/4 valor pequeno arbitrario
                grid on
                title("Ziegler-Nichols auto-ajustável")
                legend("FT","Define T")
                hold off
                
                figure(2);
                step(G*M)
                xlim([0,tLim])
                hold on
                step(Gapx*M)
                grid on
                title("Comparação - planta com modelo aproximado")
                legend("Planta","Modelo aproximado")
                hold off
            end
        end

    end
    
end

