% Usage: [y t] = rk4(f,a,b,ya,n) or y = rk4(f,a,b,ya,n)
% Runge-Kutta method of order 4 for initial value problems
%
% Input:
% f - Matlab inline function f(t,y)
% a,b - interval
% ya - initial condition
% n - number of subintervals (panels)
%
% Output:
% y - computed solution
% t - time steps
%
% Examples:
% [y t]=rk4(@myfunc,0,1,1,10);          here 'myfunc' is a user-defined function in M-file
% y=rk4(inline('sin(y*t)','t','y'),0,1,1,10);
% f=inline('sin(y(1))-cos(y(2))','t','y');
% y=rk4(f,0,1,1,10);

function [new_concentrations] = rk4(a,b,ya,n)
f = @find_rates;
h = (b - a) / n;
halfh = h / 2;
y(1,:) = ya;
t(1) = a;
h6 = h/6;
for i = 1 : n
    t(i+1) = t(i) + h;
    th2 = t(i) + halfh;
    s1 = f(y(i,:));
    s2 = f(y(i,:) + halfh * s1);
    s3 = f(y(i,:) + halfh * s2);
    s4 = f(y(i,:) + h * s3);
    y(i+1,:) = y(i,:) + (s1 + s2+s2 + s3+s3 + s4) * h6;
end

new_concentrations = y(n,:);