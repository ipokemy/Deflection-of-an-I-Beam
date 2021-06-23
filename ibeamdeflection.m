% JEREMY CHOY (145923) 
% To calculate vertical deflection of an I-beam

clc, clear all, close all

% Given
P=3e3;
E=7e10; 
h=100e-3;
b=5e-3; 
t=8e-3;
L=2; 
x=0:0.1:L;

% Inertia Function
I=M(h,b,t,L,x); 

% Vertical Deflection
V=(P*x.^2).*(3*L-x)./(E*I);

% Plot
plot(x,V);

% Label
xlabel('length (m)')
ylabel('vertical deflection (m)')

% Inertia (Subroutine)
function I=M(h,b,t,L,x)
n=length(x);
I=ones(1,n);

for i = 1:n
    if (x(i)>=0 && x(i)<L/2)
        w=150e-3;
    else
        w=90e-3;
    end
    I(i)=(w*h^3-(h-2*t)^3*(w-b))/12;
end
end
