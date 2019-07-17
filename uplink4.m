clc;
clear all;
close all;

sdb = -15:5:15;
s = 10.^(sdb/10);
sn = 1;
a = 4;
l = 1;

r=5;
xx0=0; yy0=0;
areaTotal=pi*r^2;;
lambda=1;

for i = 1:length(s)


for f = 1:1000
e(f) = 0;

numbPoints=poissrnd(areaTotal*lambda);
numbPoints1=poissrnd(areaTotal*lambda);
the=2*pi*(rand(numbPoints,1));
rad=r*sqrt(rand(numbPoints,1));
[xx,yy] = pol2cart(the,rad);
%xx = rand(numbPoints,1);
%yy = rand(numbPoints,1)
xx=xx+xx0;
yy=yy+yy0;

the1=2*pi*(rand(numbPoints1,1));
rad1=r*sqrt(rand(numbPoints1,1));
[xx1,yy1] = pol2cart(the,rad);
%xx = rand(numbPoints,1);
%yy = rand(numbPoints,1);
xx1=xx1+xx0;
yy1=yy1+yy0;

for y = 1:numbPoints1
    M = sqrt((xx1(y) - xx).^2 + (yy1(y) - yy).^2);
    M = M(1:(numbPoints1));
    Ri(y) = min(M);
end

Ri = Ri(1:(numbPoints1));

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