function xreal = short_term_prediction(xkn1,xkn2,N,M,k,P)
     % N = 10;    M = 2;    k = 5;    P = 2;
      disp(xkn1)
      disp("-------")
    x = [xkn1(1,:),zeros(1,M), xkn2(1,:)];
    xkn = [xkn1(1,:),xkn2(1,:)];
    xknfin = [xkn1(1, k-P : k-1 ), zeros(1,M), xkn2(1,1:P)];
    
    XKN = ones(N-P, P);
    q = 1;
     disp(xkn1)
      disp("xxxxxxxxxxxx")
    for n = P+1: N
        for m = 1:P
            XKN(q,m) = x(1,n-m);
        end
        q = q+1;
    end
    a = XKN' * XKN;
    a = inv(a);
    disp(size(XKN))
    disp(size(xkn))
    temp = XKN' * xkn';
    a = a * temp;
    disp(a);
    
    A1 = zeros(M+P,M);

       flag = 0;
       for n = 1:M+P
           if n== 1
               A1(1,1) = 1;
               continue;
           end
           q = 1;
           if flag == 0
                 for m = n-1:-1:1
                     A1(n,q) = -1* a(m);
                     q = q+1;
                 end
           else
               for m = 2:M
                   A1(n,m) = A1(n-1,m-1);
               end
           end
           if(q < M+1 && flag == 0)
                A1(n,q) =1;
           else
               flag = 1;
           end 
       end
       
      A2 = zeros(M+P,(M+(2*P)));
        
      for n = 1:P
          if n == 1
              q = 1;
              for m = P:-1:1
                  A2(n,q) = -1 * a(m);
                  q = q +1;
              end
          else
          for m = 2:P
              A2(n,m) = A2(n-1,m-1);
          end
          end
      end
     for n = M+P:-1:M+1
         if n == M+P
             q = P-1;
            for m = M+P+1:1:M+(2*P) -1
                A2(n,m) = -1 * a(q);
                q = q-1;
            end
            A2(n,M+(2*P)) = 1;
         else
             for m = M+(2*P)-1:-1:M+P+1
                 A2(n,m) = A2(n+1,m+1);
             end
         end
     end
     temp1 = -1 * inv(A1' * A1);
     temp2 = A1' * A2;
     xuk = temp1 * temp2;
     xuk = xuk * xknfin';
     
    
    xuk = xuk';
    disp(xkn1)
    xreal = [xkn1(1,:) , xuk(1,:), xkn2(1,:)];
    %xreal = xkn1' + U*xuk;
     
  
    
end
