%Another try
tic;
ni = input('Enter initial number of neutrons: N(0) = ');
g = input('Enter number of generations = ');
n = ni; %initially set total neutrons to initial number inputted
out= [n,t];
for z=1:g
    for a=1:n
        x=rand();
        y=rand();
        if (0.81 < x)    %if random # is greater than 0.81 it leaked
            n = n - 1 ;   %If leaked total nuetrons-1
        end
        t(a) = y * 200;
    end
end
