clc;
clear all;
close all;

for i = 1:6
r=1;
xx0=0; yy0=0;
areaTotal=pi*r^2;;
lambda=1;
e = 0;
numbPoints=poissrnd(areaTotal*lambda);
theta=2*pi*(rand(numbPoints,1));
rho=r*sqrt(rand(numbPoints,1));
[xx,yy]=pol2cart(theta,rho);
xx=xx+xx0;
yy=yy+yy0;

p=1;

H = exprnd(1);

for z = 1:(numbPoints-1)
G(z) = exprnd(1);
end

G = G(1:(numbPoints-1));
D = sqrt(xx.^2+yy.^2);

Nu = H*p*((min(D)).^(-3));

Di = setdiff(D,min(D));
De = 1 + p*dot(G,(Di.^(-3)));

SINR = Nu/De;
if SINR > 1
    e = e+1;
end
end