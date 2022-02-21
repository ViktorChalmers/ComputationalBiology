clc,clear,clf
tEnd=150;
N0 = [1 2 3 10];
N02 = [1 2 3 10]

color=["r-","k-","b-","m-"]
color2=["r.","k.","b.","m."]

for j=1:length(N0)


r = 0.1;
b = 1;
k = 10^3;

N = [N0(j)];
app = [N02(j)];
error = []
for i=1:tEnd
    N = [N (r+1)*N(end)/(1+(N(end)/k)^b)];
    app = [app ((r+1))^i*(N0(j))];
    error = [error app(end)-N(end)]
end
subplot(1,2,1)
t = 0:tEnd;
loglog(N,color(j))
hold on
loglog(app,color2(j))
hold on
grid on
yt = @(t) N0(j)+ (r*N0(j))*t;
%fplot(yt,[0,100])
legend("N_0 = "+N0(1),"approximation \eta = "+N0(1),"N_0 = "+N0(2),"approximation \eta = "+N0(2),"N_0 = "+N0(3),"approximation \eta = "+N0(3),"N_0 = "+N0(4),"approximation \eta = "+N0(4))
title("Discrete growth model, with approximation near the unstable steady state N^*_1")

%legend("sd","sd","sd","sd")
subplot(1,2,2)

loglog(error,color(j))
grid on
legend("error for \eta = N_0 = " +N0(1), "error for \eta = N_0 = " +N0(2), "error for \eta = N_0 = " +N0(3), "error for \eta = N_0 = " +N0(4))
title("plot of errors: F^n(N^*_1+\eta) - F(N_\tau)")
hold on
end
subplot(1,2,1)
xlabel("\tau")
ylabel("N_\tau")
set(get(gca,'ylabel'),'rotation',0)



%%

clc,clear,clf
tEnd=150;
color=["r-.","b-.","m-.","k-.","k-","m-","b-","r-"]
color2=["ro","bo","mo","ko","k*","m*","b*","r*"]
N0 = [90 97 98 99 101 102 103 110];
for j=1:length(N0)


r = 0.1;
b = 1;
k = 10^3;

N = [N0(j)];
app = [N0(j)];
error = []
for i=1:tEnd
    N = [N (r+1)*N(end)/(1+(N(end)/k)^b)];
    %app = [app (r+1)^i*N0(j)];
    app = [app 100+(1-b*r/(r+1))^i*(N0(j)-100)];
    error = [error app(end)-N(end)]
end
subplot(1,2,1)
title("Discrete growth model, with approximation near the stable steady state N^*_2")
t = 0:tEnd;
loglog(N,color(j))
hold on
loglog(app,color2(j))
hold on
grid on
yt = @(t) N0(j)+ (r*N0(j))*t;
%fplot(yt,[0,100])


subplot(1,2,2)

loglog(error,color(j))
grid on
legend("error for \eta = N_0 = " +N0(1), "error for \eta = N_0 = " +N0(2), "error for \eta = N_0 = " +N0(3), "error for \eta = N_0 = " +N0(4),"error for \eta = N_0 = " +N0(5),"error for \eta = N_0 = " +N0(6),"error for \eta = N_0 = " +N0(7),"error for \eta = N_0 = " +N0(8))
title("plot of errors: F^n(N^*_2+\eta) - F(N_\tau)")
hold on

end
xlabel("\tau")
ylabel("error")
set(get(gca,'ylabel'),'rotation',0)
subplot(1,2,1)
yline(100,"--")
legend("N_0 = "+N0(1),"approximation \eta = "+N0(1),"N_0 = "+N0(2),"approximation \eta = "+N0(2),"N_0 = "+N0(3),"approximation \eta = "+N0(3),"N_0 = "+N0(4),"approximation \eta = "+N0(4),"N_0 = "+N0(5),"approximation \eta = "+N0(5),"N_0 = "+N0(6),"approximation \eta = "+N0(6),"N_0 = "+N0(7),"approximation \eta = "+N0(7),"N_0 = "+N0(8),"approximation \eta = "+N0(8),"Stable steady state")
xlabel("\tau")
ylabel("N_\tau")
set(get(gca,'ylabel'),'rotation',0)
%%
clf,clc,clear
alpha = 0.01;
n0 = 900;
tEnd=300;
eta = [n0];
nSteps = 300
Reta = zeros(100,30);
Rlist = linspace(14,14.9,nSteps);
xline(14.7796)
%xline(12.51)
%legend("sd","sd")
hold on
for j = 1:nSteps
R = Rlist(j);
for i=1:tEnd
    eta = [eta R*eta(end)*exp(-alpha*eta(end))];
end

Reta(:,j) = eta(end-99:end);

end
scatter(Rlist,Reta,".","blue")
xlabel("R")
ylabel("\eta")
title("Bifurcation diagram of \eta against R")
%%
%plot(eta(end-100:end))
clc,clear,clf
hold on
Rlist=[5 10 24 13]
alpha = 0.01
n0 = 900
for j=1:length(Rlist)
eta = [n0]
R = Rlist(j)
for i=1:40
    eta = [eta R*eta(end)*exp(-alpha*eta(end))];
end
plot(eta)
end
xlabel("\tau")
ylabel("\eta_\tau")

legend("1-cycle, R = 5","2-cycle, R = 10","3-cycle, R = 24","4-cycle, R = 13")
title("Plot of dynamics for different values of R")

