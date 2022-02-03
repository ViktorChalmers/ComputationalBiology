clc,clear,clf
tEnd=150;
N0 = [1 2 3 10];
N02 = [119 20 98 10]
for j=1:length(N0)


r = 0.1;
b = 1;
k = 10^3;

N = [N0(j)];
app = [N02(j)];
for i=1:tEnd
    N = [N (r+1)*N(end)/(1+(N(end)/k)^b)];
    app = [app k*r+(1-r/(r+1)*app(end))];
end
t = 0:tEnd;
loglog(N,".")
loglog(app)
hold on
grid on
yt = @(t) N0(j)+ (r*N0(j))*t;
%fplot(yt,[0,100])
legend("N_0 = "+N0(1),"approximation \eta = "+N0(1),"N_0 = "+N0(2),"approximation \eta = "+N0(2),"N_0 = "+N0(3),"approximation \eta = "+N0(3),"N_0 = "+N0(4),"approximation \eta = "+N0(4))
end
%xlabel("\tau")
%ylabel("N_\tau")
%set(get(gca,'ylabel'),'rotation',0)
%%

clc,clear,clf
tEnd=150;
N0 = [1 2 3 10];
for j=1:length(N0)


r = 0.1;
b = 1;
k = 10^3;

N = [N0(j)];
app = [N0(j)];
for i=1:tEnd
    N = [N (r+1)*N(end)/(1+(N(end)/k)^b)];
    app = [app (r+1)*(app(end))];
end
t = 0:tEnd;
loglog(N,".")
loglog(app)
hold on
grid on
yt = @(t) N0(j)+ (r*N0(j))*t;
%fplot(yt,[0,100])
legend("N_0 = "+N0(1),"approximation \eta = "+N0(1),"N_0 = "+N0(2),"approximation \eta = "+N0(2),"N_0 = "+N0(3),"approximation \eta = "+N0(3),"N_0 = "+N0(4),"approximation \eta = "+N0(4))
end
%xlabel("\tau")
%ylabel("N_\tau")
%set(get(gca,'ylabel'),'rotation',0)
%%
clf,clc,clear
alpha = 0.01;
n0 = 900;
tEnd=300;
eta = [n0];
Reta = zeros(100,30);
Rlist = linspace(1,30,300);
for j = 1:300
R = Rlist(j);

for i=1:tEnd
    eta = [eta R*eta(end)*exp(-alpha*eta(end))];
end

Reta(:,j) = eta(end-99:end);

end
scatter(Rlist,Reta,".","blue")
%%
%plot(eta(end-100:end))
clc,clear,clf
hold on
Rlist=[5 10 13 22]
alpha = 0.01
n0 = 900
for j=1:length(Rlist)
eta = [n0]
R = Rlist(j)
for i=1:30
    eta = [eta R*eta(end)*exp(-alpha*eta(end))];
end
plot(eta)
end

