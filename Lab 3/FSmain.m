
function [X,w] = FSmain(N)
% Calculates the Fourier series through symbolic calculations for the first
% N frequencies
syms t;

% numerical Fourier Series parameters
tau = 1; % length of signal
T0 = 5; % fundamental period
tshift = 1; % time shift from signal centered at 0
amp = 1; % amplitude of signal
baseline = -0.5; % DC bias 

% !!!IMPORTANT!!!: the signal definition must cover [0 to T0]
% the signal is defined over [-T0, 2T0], which covers [0, T0]
% number of components +/- to compute
k_vec = [-N:N];
xt = amp*(heaviside(t+tau/2-tshift)-heaviside(t-tau/2-tshift) + heaviside(t-(T0-tau/2)-tshift) ...
-heaviside(t-(T0+tau/2)-tshift))+ heaviside(t+T0-tshift)*baseline;

% Compute FS coefficients
[X, w] = FourierSeries(xt, T0, k_vec);

% plot the results from Matlab calculation
figure();subplot(211);
% plot magnitude and phase separately
stem(w,abs(X), 'o-');
xlabel('Frequency (rad/sec)');ylabel('Magnitude');
hold on;subplot(212);
stem(w,angle(X), 'o-');
xlabel('Frequency (rad/sec)');ylabel('Phase');
