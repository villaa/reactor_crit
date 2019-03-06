function fig= simplot;
fid=fopen('NofTData.txt');
s=textscan(fid,'%d %d %d','headerlines',1);
fclose(fid);
X=s{1};
Y=s{2};

%This function plots the nx2 matrix B as(x,y) pairs

figure
plot(X,Y);
title('Neutrons over Time');
xlabel('Time in microseconds');
ylabel('Neutrons');
end
