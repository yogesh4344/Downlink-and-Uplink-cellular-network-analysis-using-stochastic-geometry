clc;
clear all;
close all;

sdb = -10:5:20;
s = 10.^(sdb/10);
sn = 1;
a = 3;
l = 1;
syms u v;
for i = 1:length(s)
p1 = (s(i)^(2/a))*int((1/(1+u^(a/2))),u,s(i)^(-2/a),inf);
p(i) = double(p1);
Pc1 = pi*l*int((exp(-pi*l*v*(1+p(i)) - (s(i)/sn)*v^(a/2))),v,0,inf);
Pc(i) = double(Pc1);
end
plot(sdb,Pc);


r=5;
xx0=0; yy0=0;
areaTotal=pi*r^2;;
lambda=1;
%areaTotal=r^2;


for i = 1:length(s)


for f = 1:10000
e(f) = 0;

numbPoints=poissrnd(areaTotal*lambda);
the=2*pi*(rand(numbPoints,1));
rad=r*sqrt(rand(numbPoints,1));
[xx,yy] = pol2cart(the,rad);
%xx = rand(numbPoints,1);
%yy = rand(numbPoints,1)
xx=xx+xx0;
yy=yy+yy0;

p=1;

H = exprnd(1);

for z = 1:(numbPoints-1)
G(z) = exprnd(1);
end

G = G(1:(numbPoints-1));
D = sqrt(xx.^2+yy.^2);

Nu = H*p*(min(D))^(-a);

Di = setdiff(D,min(D));
De = 1 + p*dot(G,(Di.^(-a)));

SINR = Nu/De;
if SINR > s(i)
    e(f) = e(f)+1;
end

end

Pcs(i) = mean(e);
end
hold on;
plot(sdb,Pcs);

