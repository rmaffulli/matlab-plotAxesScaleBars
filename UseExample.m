close all
clear all
clc

figure('Renderer', 'painters', 'Position', [50 50 1500 500]); clf

subplot(1,3,1)
hold on
X = linspace(0,10,1000);
Y = -X.^3 + 10*X.^2 + 20*sin(5*pi*X) + 25 + 10*rand(size(X));
plot(X,Y,'Marker','none','LineWidth',2,'DisplayName','Signal 1');
title("Plot scale lines for both axes")
Y = 2*X.^2 + 3*X + 10*rand(size(X));
plot(X,Y,'Marker','none','LineWidth',2,'DisplayName','Signal 2');
legend('box','off','Location','northwest','FontSize',12);
plotAxesScaleBars(round(diff(xlim)/5),round(diff(ylim)/4),[0 0],2,'k',...
    "[s]", "[V]",12,'normal',"bothaxes");


subplot(1,3,2)
hold on
X = linspace(0,10,1000);
Y = -X.^3 + 10*X.^2 + 20*sin(5*pi*X) + 25 + 10*rand(size(X));
plot(X,Y,'Marker','none','LineWidth',2,'DisplayName','Signal 1');
title("Plot scale lines only for X axis")
Y = 2*X.^2 + 3*X + 10*rand(size(X));
plot(X,Y,'Marker','none','LineWidth',2,'DisplayName','Signal 2');
legend('box','off','Location','northwest','FontSize',12);
plotAxesScaleBars(round(diff(xlim)/5),round(diff(ylim)/4),[0 0],2,'k',...
    "[s]", "[V]",12,'normal',"xonly");

subplot(1,3,3)
hold on
X = linspace(0,10,1000);
Y = -X.^3 + 10*X.^2 + 20*sin(5*pi*X) + 25 + 10*rand(size(X));
plot(X,Y,'Marker','none','LineWidth',2,'DisplayName','Signal 1');
title("Plot scale lines only for Y axis")
Y = 2*X.^2 + 3*X + 10*rand(size(X));
plot(X,Y,'Marker','none','LineWidth',2,'DisplayName','Signal 2');
legend('box','off','Location','northwest','FontSize',12);
plotAxesScaleBars(round(diff(xlim)/5),round(diff(ylim)/4),[0 0],2,'k',...
    "[s]", "[V]",12,'normal',"yonly");

print("UseExample.png",'-dpng');
