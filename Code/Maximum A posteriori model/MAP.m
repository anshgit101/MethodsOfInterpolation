function x = MAP (xkn1 , xkn2)
   N = 93, M = 31;
    x = length(xkn1);
    K = zeros(N,N-M);
    for n = 1:x
        K(n,n) = 1;
    end
    for n = x+M+1:N
        K(n,x+1) = 1;
        x = x+1;
    end
    U = zeros(N,M);
    x = 1;
    for n = length(xkn1)+1:length(xkn1)+M
        U(n,x) = 1;
        x = x+1;
    end
  
    xkn = [ xkn1(1,:),  xkn2(1,:) ];
    vari = var(xkn);
    c = 0.1;
    Cox = zeros(N,N);
%     for n = 1:N
%         Cox(n,n) = vari;
%         if n+1 <= N
%         Cox(n+1,n) = vari-c;
%         Cox(n,n+1) = vari-c;
%         if n+2 <= N
%         Cox(n+2,n) = vari - 2*c;
%         Cox(n,n+2) = vari - 2*c;
%         if n+5 <= N
%           Cox(n+5,n) = vari - 5*c;
%           Cox(n,n+5)= vari - 5*c;
%           Cox(n+4,n) = vari - 4*c;
%           Cox(n,n+4) = vari - 4*c;
%           Cox(n+3,n) = vari - 3*c;
%           Cox(n,n+3) = vari - 3*c;
%         end
%         end
%         end
%     end
    c = 0.009;
    for n = 1:N
        Cox(n,n) = vari;
        for m = 1:N/2
            if n+m <= N
            Cox(n+m,n) = vari - (m)*c;
            Cox(n,n+m) = vari - (m)*c;
            end
        end
    end
    disp("------");
    disp(Cox)
    xuk = U'*inv(Cox);
    xuk = xuk*U;
    xuk = inv(xuk);
    xuk = -1*xuk;
    xuk = xuk*U';
    xuk = xuk*inv(Cox);
    xuk = xuk*K;
    xuk = xuk*xkn';
    
    known_part = K*xkn';
    un_part = U*xuk;
    
    x = known_part + un_part;
    disp(xuk);
    
    
end