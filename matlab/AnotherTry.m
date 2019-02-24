%Another try
tic;
ni = input('Enter initial number of neutrons: N(0) = ');
g = input('Enter number of generations = ');
n = ni; %initially set total neutrons to initial number inputted
t=0;
out = zeros(g,2);
out(1,1)= t;
out(1,2)= n;
for z=1:g
    for a=1:n
    x=rand();
    y=rand();
    t = y * 200;
        if (0.81 < x)    %if random # is greater than 0.81 it leaked
            deltan = -1 ;   %If leaked total nuetrons-1
            n = n + deltan;
        end
        out(a,2)=n;
        out(a,1)=t;
    end               
end
%csvwrite('NofTData.csv', [n+deltan; t]);
B = sortrows (out, 1);
figure;
plot(B,':+b');
title('Neutrons over Time')
xlabel('Time in microseconds')
ylabel('Neutrons')
%xlswrite('NofTxcel.xlsx',B)
B
toc;