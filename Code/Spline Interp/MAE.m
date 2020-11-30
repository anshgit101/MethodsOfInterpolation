function A = MAE (xr,x)
    A = 0;
    temp = 0;
    for k = 1:length(xr)
        if abs(xr(k)) > 1000 || abs(x(k)) > 1000
            continue;
        end
        temp = abs(xr(k) - x(k));
        if(temp > A)
            A = temp;
    end
end