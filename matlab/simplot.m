function simpleplot = simplot(B);

%This function plots the nx2 matrix B as(x,y) pairs

X = B(:,1);
Y = B(:,2);
figure
plot(X,Y);
title('Neutrons over Time')
xlabel('Time in microseconds')
ylabel('Neutrons')
end
