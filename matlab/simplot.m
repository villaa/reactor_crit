function fig = simplot;
fid=fopen('NofTData.txt');
s=textscan(fid,'%f %f %f','headerlines',1);
fclose(fid);
X=s{1};
Y=s{2}; %This function plots the nx2 matrix B as(x,y) pairs
%myfit = cftool(X,Y);

constant = lsqcurvefit(@f, [100000,-1e-3], X, Y)
xfit=0:10:10000;

yfit=f([1000, -1E-3],xfit); 
%yfit=f(constant,xfit); 
figure
hold on
plot(X,Y);
plot(xfit, yfit, 'r', 'linewidth',2)
%plot(myfit,X,Y);

title('Neutrons over Time');
xlabel('Time in microseconds');
ylabel('Neutrons');
end
