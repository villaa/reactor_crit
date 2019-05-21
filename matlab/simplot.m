function fig = simplot
fid=fopen('NofTData.txt');
s=textscan(fid,'%f %f %f','headerlines',0);
fclose(fid);
X=s{1};
Y=s{2}; %This function plots the nx2 matrix B as(x,y) pairs
n0= Y(1);
%class(n0)
%n0=double(n0);

constant = lsqcurvefit(@f, [n0,-1e-3], X, Y)
xfit=0:10:10000;
yfit=f(constant,xfit); 


figure
hold on
plot(X,Y);
plot(xfit, yfit, 'r', 'linewidth',2)

title('Neutrons over Time');
xlabel('Time in microseconds');
ylabel('Neutrons');

halflife= (ln(2))/(constant);
matEr = {(yfit),(-(Y))};
Erdiff = Sum(matEr, 2);
Er = ((Erdiff)^2)/(sqrt(n0));
ChiSqu = Sum(Er);
EperDegfree = (ChiSqu)/2;

datafile = fopen('dec5_10.txt','w+');
fprintf(datafile,'%6s %12s\n','N','FracLeak','fit parameter','half-life', 'error');

%datafile = fopen('dec5_10.txt','a');

fmt = '%5d %f %f %f %f';
fprintf(datafile,fmt,n0,FracLeak,constant,halflife,EperDegfree);


end
