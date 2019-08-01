function [xt,dt] = FSsynthesis_Square(N, T0, a0, Range);

% N number of components to use
% T0 fundamental period in seconds of the square wave
% a0 DC component
% Range - plotting range for signal, 2x1 vector

n_vec = [1:N];
Omega0 = 2*pi/T0;f0 = 1/T0;

% Compute the Fourier series coefficients for a square wave
a_k = zeros(size(n_vec));

% odd indexed components only have non-zero values
a_k(1:2:end) = 1./(j*n_vec(1:2:end)*Omega0);

dt = 1/(N*f0*10);
t = [Range(1):dt:Range(2)];
xt = zeros(size(t));
for m = 1:length(n_vec)
    xt = xt + a_k(m)*exp(j*n_vec(m)*Omega0*t)+conj(a_k(m))*exp(-j*n_vec(m)*Omega0*t);
end
xt = xt + a0*ones(size(t));

figure();
plot(t,xt)
title(['Fourier Approximation for N = ', num2str(N)]);
xlabel(['time']); ylabel(['x(t)']);
