function xr = lagrange_interp(n,xn,t_fine)
    
    xr1 = zeros(1,length(t_fine));
    L = length(n);
    %disp(L);
    for k = 1:L
        if abs(xn(k)) > 1000
            continue;
        end
       temp = xn(k) .* ones(1,length(t_fine));
       for k1 = 1:L
            if (k ~= k1)
                temp = temp .* (t_fine - n(k1))/(n(k) - n(k1));
            end
       end
       xr1 = xr1 + temp;
    end
 
    xr = xr1;
end