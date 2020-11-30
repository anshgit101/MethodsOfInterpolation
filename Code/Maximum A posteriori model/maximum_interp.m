 t1 = 0:0.1:4;
 t2 = 7:0.1:9;
 t = 0:0.1:9
 xkn1 = cos(t1);
 xkn2 = cos(t2);
 x_real = cos(t);
 
 x = MAP(xkn1,xkn2);
 plot(t,x,'r', t,x_real,'b');

