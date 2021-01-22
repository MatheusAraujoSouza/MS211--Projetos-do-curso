function G1=interpolacao_de_newton

%vamos come�ar usando o m�todo de interpola��o de newton
%antes de tudo precisamos calcular as diferen�as divididas e depois montar 
%o polinomio esse passo vai ser simples
                %interpola��o de newton
                
%carregando primeiro os dados 
X=[0 0.5 1 2 2.5 3 3.5];
y=[2 1.6 0.8 0.04 0.004 0.0002 0.000009];

%nosso objetivo agora � escrever um programa que determine uma aproXima��o
%de f no ponto 1.5

%calculando as diferen�as divididas 
%vamos reduzir o tamanho da nossa matriz para diminui��o de uso da mem�ria
DifereDivi=zeros(7,5);
DifereDivi(:,1)=y;

%depois de criarmos nossa matriz das diferen�as divididas vamos efetuar os
%calculos correspondentes a cada uma.
n=input('Dentre os graus 1,2 e 3 qual vamos usar na interpola��o?, n=');
for i=2:n+1
    for j=i+2:n+3
        DifereDivi(j,i)=[DifereDivi(j,i-1)-DifereDivi(j-1,i-1)]/[X(j)-X(j-i+1)];

    end
end
%quando eXecutamos esse la�o sempre fazemos o calculo at� o n+1 diferen�as
%divididas, sempre evitando calculos desnecessarios nas nossas intera��es,
%n�o precisamos fazer os calculos das diferen�as dividias que tem em baixo
%para chegar na pr�Xima coluna assim tamb�m evistamos de 


%agora que j� calculamos as diferen�as divididas vamos calcular o polinomio
%de newton 
%como queremos calcular o melhor polinomio que passa pelo 1.5 usando
%polinomios de interpola��o dada a nossa fun��o de newton nosso f(X0) vai
%ser o DifereDivi(3,1)
syms x
%com esse comando 'syms' � possivel manipular variaveis simbolicas 
polnewton=DifereDivi(3,1);
P=1;
for i1=1:n
    P=P*(x-X(i1+2));
    polnewton=polnewton+P*DifereDivi(i1+3,i1+1);
end
%para deixar o polinomio em uma melhor forma de visualiza��o vamos usar o
%comando expand
polnewton;
polnewton=expand(polnewton)



end





 
 