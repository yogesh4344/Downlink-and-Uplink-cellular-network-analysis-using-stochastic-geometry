% clc;
% clear all;
% close all;
% 
% sdb = -15:5:15;
% s = 10.^(sdb/10);
% a = 4;
% 
% syms u
% for i = 1:length(s)
% p = int(u/(1+(u^(a) * s(i)^(-0.5))),u,1,inf); p = double(p);
% Pc(i) = exp(-2*p);
% end
% 
% plot(sdb,Pc);

clc;
clear all;
close all;

sdb = -15:5:15;
s = 10.^(sdb/10);
a = 4;

syms u
for i = 1:length(s)
p = s(i)^(1/a) * int(1/(1+u^(a/2)),u,s(i)^(-1/a),inf); p = double(p);
Pc(i) = exp(-p);
end

plot(sdb,Pc);
