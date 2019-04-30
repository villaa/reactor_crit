function fig = simplot
fid=fopen('NofTData.txt');
s=textscan(fid,'%f %f %f','headerlines',0);
fclose(fid);
X=s{1};
Y=s{2}; %This function plots the nx2 matrix B as(x,y) pairs
n0= s(1,2);

constant = lsqcurvefit(@f, [10,-1e-3], X, Y)
xfit=0:10:n0;
yfit=f(constant,xfit); 

figure
hold on
plot(X,Y);
plot(xfit, yfit, 'r', 'linewidth',2)

title('Neutrons over Time');
xlabel('Time in microseconds');
ylabel('Neutrons');
end
