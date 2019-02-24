%Another try
tic;
ni = input('Enter initial number of neutrons: N(0) = ');
g = input('Enter number of generations = ');
n = ni; %initially set total neutrons to initial number inputted
t=0;
out = zeros(g,2);
out(1,1)= n;
out(1,2)= t;
for z=1:g
    for a=1:n
        x=rand();
        y=rand();
        if (0.81 < x)    %if random # is greater than 0.81 it leaked
            n = n - 1 ;   %If leaked total nuetrons-1
        end
        t = y * 200;
    end
         out(z+1,1)=n;
         out(z+1,2)=t;
         p = plot(t,n);
         csvwrite('NofTData.csv', [n; t]);
end

out
toc;