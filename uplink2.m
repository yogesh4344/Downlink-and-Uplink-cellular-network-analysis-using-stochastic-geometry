clc;
clear all;
close all;

a = 4;
sdb = -15:5:15;
s = 10.^(sdb/10);

r=5;
xx0=0; yy0=0;
areaTotal=pi*r^2;;
lambda=1;
%areaTotal=r^2;


for i = 1:length(s)
for f = 1:100000
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
De = p*dot(G,(Di.^(-a)));

SINR = Nu/De;
if SINR > s(i)
    e(f) = e(f)+1;
end

end

Pcs(i) = mean(e);
end
hold on;
plot(sdb,Pcs);
