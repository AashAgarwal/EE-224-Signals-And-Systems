function [X, w] = FourierSeries(x, T0, k_vec)
% function [X, w] = FourierSeries(x, T0, k_vec)
%
% symbolically calculate the Fourier Series, and return the
% numerical results
%
% x: the time domain signal within one period;
% it must have definition over [0, T0]
% it must be a symbolic function of t
%
% T0: the period of the signal
% k_vec: the range of Harmonics to be calculated
%
% Outputs
% X: vector of Fourier coefficients evaluated at k_vec*w0 frequency,
%    Note that the numbers go from -N, -N+1, ...,0, 1,2   , N for the
%    indices
%  w: vector of evaluation frequencies


syms t
for mm = 1:length(k_vec)
    k = k_vec(mm);
    % angular frequency
    w(mm) = k*2*pi/T0;
    % Fourier series coefficients
    X1(mm) = int(x*exp(-j*w(mm)*t), t, 0, T0)/T0;
    % change the symbolic value to numerical value
    X(mm) = subs(X1(mm));
end


