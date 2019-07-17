clc;
clear all;
close all;

l = 4*10^(-6);
a = 4;
p = 1;
e = 1;
sig = 0;
sdb = 10;
s = 10.^(sdb/10);

syms r x u;
k = (s^(-1))*r^(-a*(1-e))*u^(-a*e/2)*x^(a);
v1 = int((1/(1+k))*pi*l*exp(-l*pi*u),u,0,x^2);
v2 = int(v1*x,x,0,inf);
V = exp(-2*pi*l*v2);
m = r*exp(-pi*l*(r^2) - (s/p)*(r^(a*(1-e)))*sig);
pc = 2*pi*l*int(m*V,r,0,inf);


