function fig = simplot;
fid=fopen('NofTData.txt');
s=textscan(fid,'%d %d %d','headerlines',1);
fclose(fid);
X=s{1};
Y=s{2}; %This function plots the nx2 matrix B as(x,y) pairs
%myfit = cftool(X,Y);
%constant = lsqcurvefit(@f, [0,0], X, Y);
%r=constant(1);
%w=constant(2);
%xfit=0:10:100000;
%yfit=f(constant,xfit);

figure
%plot(xfit, yfit, 'r', 'linewidth',2)
%plot(myfit,X,Y);
plot(X,Y);
title('Neutrons over Time');
xlabel('Time in microseconds');
ylabel('Neutrons');
end
