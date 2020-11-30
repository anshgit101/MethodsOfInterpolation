function xr = sinc_interp(n,xn,Ts,t_fine)
 	xr1 = zeros(size(t_fine));
 	 
 	for k = 0: 5/Ts
 	xr1 = xr1 + (xn(k+1) .* (sinc((1/Ts) *(t_fine - (n(k+1)*Ts)))));
 	end
 	xr = xr1;
 end
