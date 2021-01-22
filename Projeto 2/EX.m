function G2=EX

%vamos calcular a fun��o que faz todas as diferen�as divididas 
%quando n�o temos a fun��o que desejamos precisamos calular uma aproxim��o
%para nossa derivada ent�o calculamos as diferen�as divididas at� a ordem
%de n + 1
erro=0;
X=[0 0.5 1 2 2.5 3 3.5];
y=[2 1.6 0.8 0.04 0.004 0.0002 0.000009];
n=6;
%fixando nosso ponto de aproxim��o 
pontodep=1.5;
DifereDivi=zeros(7,7);
DifereDivi(:,1)=y;
for i=2:n+1
    for j=i:n+1
        DifereDivi(j,i)=[DifereDivi(j,i-1)-DifereDivi(j-1,i-1)]/[X(j)-X(j-i+1)];
    end
   
end
erro=zeros(1,9);
guardaN=zeros(9,7);
%depois de efetuar o calculo das diferen�as divididas como ela aproxima at�
%o grau de n + 1 do grau do meu polinomio ent�o s� podemos pegar at� 6
%pontos
%n�o precisamos recalcular a ordem do polinomio apenas fazer as diferen�as
%dos pontos j� destacados, se queremos encontrar o melhor polinomio
%primeiro temos que verificar os melhores pontos, para a aproxima��o, claro
%que nosso ponto que quer ser aproximado deve estar entre ele 
    erro(1,1)=(pontodep-X(1,3))*(pontodep-X(1,4))*max(abs(DifereDivi(:,3)));
    guardaN(1,:)=[3 4 0 0 0 0 0];
    erro(1,2)=(pontodep-X(1,3))*(pontodep-X(1,4))*(pontodep-X(1,2))*max(abs(DifereDivi(:,4)));
    guardaN(2,:)=[2 3 4 0 0 0 0];
    erro(1,3)=(pontodep-X(1,3))*(pontodep-X(1,4))*(pontodep-X(1,2))*(pontodep-X(1,1))*max(abs(DifereDivi(:,5)));
    guardaN(3,:)=[1 2 3 4 0 0 0];
    erro(1,4)=(pontodep-X(1,3))*(pontodep-X(1,4))*(pontodep-X(1,2))*(pontodep-X(1,5))*max(abs(DifereDivi(:,5)));
    guardaN(4,:)=[2 3 4 5 0 0 0];
    erro(1,5)=(pontodep-X(1,3))*(pontodep-X(1,4))*(pontodep-X(1,5))*max(abs(DifereDivi(:,4)));
    guardaN(5,:)=[3 4 5 0 0 0 0];
    erro(1,6)=(pontodep-X(1,3))*(pontodep-X(1,4))*(pontodep-X(1,5))*(pontodep-X(1,6))*(pontodep-X(1,7))*max(abs(DifereDivi(:,6)));
    guardaN(6,:)=[3 4 5 6 7 0 0];
    erro(1,7)=(pontodep-X(1,3))*(pontodep-X(1,4))*(pontodep-X(1,5))*(pontodep-X(1,6))*max(abs(DifereDivi(:,5)));
    guardaN(7,:)=[3 4 5 6 7 0 0];
    erro(1,8)=(pontodep-X(1,3))*(pontodep-X(1,4))*(pontodep-X(1,5))*(pontodep-X(1,6))*(pontodep-X(1,2))*(pontodep-X(1,7))*max(abs(DifereDivi(:,7)));
    guardaN(8,:)=[ 2 3 4 5 6 7 0];
    erro(1,9)=(pontodep-X(1,3))*(pontodep-X(1,4))*(pontodep-X(1,5))*(pontodep-X(1,6))*(pontodep-X(1,2))*(pontodep-X(1,1))*max(abs(DifereDivi(:,7)));
    guardaN(9,:)=[1 2 3 4 5 6 0];
   %agora vamos deinir qual � o menor erro e assim vamos localizar os
   %pontos de interpola��o referentes a ele ent�o imprimir na tela do
   %usu�rio 
   %assim pegamos o indice e o menor valor
   [m1,m2]=min(abs(erro));
   guardaN(m2,:);
   a=guardaN(m2,:);
   a(a==0)=[];
   %assim j� temos o menor valor e os pontos de interpola��o
   %montando nosso polinomio com esses pontos
   syms x
    %com esse comando 'syms' � possivel manipular variaveis simbolicas 
    [k,j]=min(a);
    [g,h]=max(a);
    polnewton=DifereDivi(j,j);
    P=1;
    %vamos fazer essas opera��es para controlar o nosso novo polinomio 
    for i1=j:h-1
    P=P*(x-X(i1));
    polnewton=polnewton+P*DifereDivi(i1+1,i1+1);
    end
   
    polnewton;
    polnewton=expand(polnewton)
   %vamos exibir os pontos de interpola��o
   Exib=zeros(1,h);
   for i=j:h
       Exib(1,i)=X(1,i);
   end
   Exib
   m1
   
              
    
end