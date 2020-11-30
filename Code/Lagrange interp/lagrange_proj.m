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

subplot(2,1,1)
plot(t_fine, xreal)
xlabel('t')
ylabel('x(t)')
title('Original Signal')

%Reconstructing signal (lagrange interp)
xr = lagrange_interp(t_samples, xn, t_fine);
subplot(2,1,2)
plot(t_fine,xr)
xlabel('t')
ylabel('xr(t)')
title('Reconstructed Signal')

%Calculating Max Absolute Error
lagrange_err = MAE(xr,xreal)
