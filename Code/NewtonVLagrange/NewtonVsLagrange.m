t_samples = 0:0.1:5;

%For continuous time
t_fine = 0:0.001:5;

%Original Signal
%xreal = sin(pi * t_fine) - cos(2/3 * pi * t_fine);
%xreal = 2 * exp( 1/6 * pi * t_fine);
xreal = (t_fine).^ 3 - 9* (t_fine).^2 -0.5;

%Samples
%xn = sin(pi * t_samples) - cos(2/3 * pi * t_samples);
%xn = 2 * exp( 1/6 * pi * t_samples);
xn = (t_samples).^ 3 - 9*(t_samples).^2 -0.5;

%Reconstructing signal (newton interp)
xr1 = newton_interp(xn,t_samples, t_fine);
xr2 = lagrange_interp(t_samples,xn, t_fine);
plot(t_fine,xr1, 'r',t_fine,xr2,'b');
%ylim([-5,5]);
xlabel('t')
ylabel('xr(t)')
title('Newton vs Lagrange interpolation polynomial')
