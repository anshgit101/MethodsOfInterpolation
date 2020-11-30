t1 = 1:19;
x1 = cos(t1);
t2 = 32:50; 
x2 = cos(t2); 
N = 50;    M = 12;    k = 20;    P = 12;
% xkn1 = sin(t1);
% xkn2 = sin(t2);
x = short_term_prediction(x1,x2,N,M,k,P);
plot(x);
xlabel('t')
ylabel('x')
