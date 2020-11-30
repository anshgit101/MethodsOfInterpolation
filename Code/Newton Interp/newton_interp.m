function xr = newton_interp(x,t_samples,t_fine)
    ls = length(t_samples);
    lf = length(t_fine);
    
    b = zeros(1,ls);
    b(1) = x(1);
    
    d = zeros(ls,ls);
    
    for k = 1:ls
        d(1,k) = x(k);
    end
    
    for h = 2:(ls - 1)
        for k1 = 1:(ls-h+1)
             d(h,k1) = (d((h-1),k1) - d((h-1),(k1+1))) / (t_samples(1,k1) - t_samples(1,h + k1 - 1));
        end
        b(h) = d(h,1);
    end
    
    xr = zeros(1,lf);
    temp = ones(1,lf);
    
    for k = 1:ls
        if k ~=1
            temp = temp .* (t_fine - t_samples(k));
        end
        xr = xr + (b(k) * temp);
    end
    
end