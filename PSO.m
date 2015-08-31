function PSO
%
clc;
N = 20;%the size of swarm
D = 2;%the dimension
NC = 1;%iterator
NC_max = 500;%maximun of times

%initialize
position = rand(N,D).*20-10;
velocity = rand(N,D).*20-10;
fitness = adapt_fun(position);
[best,idx] = min(fitness);
pBest = position;
gBest = pBest(idx(1),:);

while NC<NC_max
    [velocity,position] = renew_fun(velocity,position,pBest,gBest);
    f = adapt_fun(position);
    pos = f<fitness;
    fitness(pos) = f(pos);
    pBest(pos,:) = position(pos,:);
    [best,idx] = min(fitness);
    gBest = pBest(idx(1),:);
    NC = NC+1;
end

fprintf('The best outcome is (%f,%f).\n',gBest(1),gBest(2));
fprintf('The best fitness is %f.\n',best);
% [r,c] = meshgrid(-10:0.1:10,-10:0.1:10);
% y = r.^2+c.^2;
% mesh(r,c,y);
% hold on;
% plot3(gBest(1),gBest(2),best,'kp','linewidth',4);
% hold off;

function f=adapt_fun(x)
[~,py] = size(x);
f=(x.^2)*ones(py,1);

function [v,x]=renew_fun(v,x,pBest,gBest)
w = 0.5;%inertia weight
c1 = 2.0;
c2 = 2.0;%acceleration coefficient
R_max = 10;%range
syms r1 r2;
r1 = rand();
r2 = rand();
[px,~] = size(x);
v = w.*v+c1.*r1.*(pBest-x)+c2.*r2.*(ones(px,1)*gBest-x);
x = x+v;
x(x>R_max) = 10;
x(x<-R_max) = -10;