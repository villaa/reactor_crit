function []= simplot(FracLeak)
fid=fopen('NofTData.txt');
s=textscan(fid,'%f %f %f','headerlines',2);
fclose(fid);
X=s{1};
Y=s{2}; %This function plots the nx2 matrix B as(x,y) pairs
n0= Y(1);
%class(f(constant, X))
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

halflife= ((log(2))\(constant));

matEr = [(f(constant,X)),(-(Y))];
Erdiff = sum(matEr, 2 );
degfree = sqrt(n0);
Er = ((Erdiff).^2).\(degfree);
ChiSqu = sum(Er);
EperDegfree = (ChiSqu)\2


datafile = fopen('dat5_28.txt','w+');
fmt = '%5d %f %f %f %f';
fprintf(datafile,fmt,'N','FracLeak','fit parameter','half-life', 'error');

%datafile = fopen('dat5_28.txt','a');
fprintf(datafile,fmt,n0,FracLeak,constant,halflife,EperDegfree);

end
