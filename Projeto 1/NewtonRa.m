function M3=NewtonRa

%vamos fazer a implementa��o do m�todo de newton para a solu��o do nosso 
%problema 3
                    % M�todo de Newton  
t=1.4;
f1=2*sin((3*pi/2)*t)+t-1;
f2=3*cos((3/2)*pi*t)+1;% df(t)/dt
f3 = abs(-1*(9/2)*sin((3/2)*pi*t));% d^2f(t)/dt^2
res = abs((f1*f3)/f2.^2);%|ft*(d^2/dt^2)ft/(d/dtft)^2|
if res < 1
 disp('O ponto inicial satisfaz a condi��o |ft*(d^2/dt^2)ft/(d/dtft)^2|<1');
end

%O comando eval acaba possibilitando essas execu��es no nosso c�digo 
%O trabalho que teriamos em ficar recopiando a fun��o ele acaba puchando
%ela como um novo par�metro 
f = '2*sin((3*pi/2)*t)+t-1'; % f(t)
flin = '3*pi*cos((3*pi/2)*t)+1'; % df(t)/dt
            
e1 = 10^-3; % Diferen�a entre aprotima��es e Erro m�ximo para |f(t)|


k = 0; % Contador de itera��es
%vamos colocar nosso primeiro ponto na fun��o e assim encontramos a nossa 
ft = eval(f);

fprintf(1,'%s %2d %s %12.9f %s %12.9f\n','k =',k,' t =',t,...
' f(t) =',ft);
                %vamos usar apenas o |f(t)| como crit�rio de parada como j�
                %colocamos ele em um bom ponto n�o precisamos usar a
                %diferen�a dos ta e t
      
                     while abs(ft) > e1 
                                k = k+1;%contador de intera��es
                                ta = t; % Aproxima��o anterior
                                flt = eval(flin); % df(t)/dt no ponto atual
                                t = t-(ft/flt); % Novo valor de t
                                ft = eval(f); % Novo valor de f(t)
                                dt = abs(t-ta);%m�dulo da diferen�a |t-ta|
fprintf(1,'%s %2d %s %12.9f %s %12.9f %s %12.9f\n',...
    'k =',k,' t =',t,' f(t) =',ft,' d(t) =',dt);
end







end

