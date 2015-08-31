function PSO
%

N = 3;%the size of swarm
D = 2;%the dimension
w = 0.5;%inertia weight
c1 = c2 = 2.0;%acceleration coefficient
R_max = 10;%range
NC_max = 500;%maximun of times

%initialize
position = rand(N,D).*20-10;
velocity = rand

function f=adapt_fun(x)
f=sum(x.^2);

function v=vel_fun(v,x,pBest,gBest)
w = 0.5;%inertia weight
c1 = 2.0;
c2 = 2.0;%acceleration coefficient
syms r1 r2;
