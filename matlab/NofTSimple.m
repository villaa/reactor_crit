%neutrons over time
ni = input('Enter initial number of neutrons: N(0) = ');
ft = input('Enter run time: t-final = ');
n = ni; %initially set total neutrons to initial number inputted
t = 0; %initially time starts at zero
for t = t:ft  %creating random numbers for PNL
    nl = 0; %resetting these intermediate variables at the beginning of each iteration
    cf = 0;
    en=0;
   for a = 1:n
       x = rand();
    if (0.81<=x)
        n = n-1 ;   %If leaked total nuetrons-1
    elseif (0.81>x)     %0.81 probability for PNL
       nl = nl + 1; 
       t = t + 0.0001 ;  
    end
   end
    for b = 1:nl  %creating random numbers for f
         y = rand();
         if (0.72 <= y)
         n = n-1; % if no fiss neutrons-1
         elseif (0.72 > y)
         cf = cf + 1;
         t = t + 0.0002;
         end
         for c = 1:cf
            z = rand();
            if 0.2 > z
                en =1;
            elseif (0.2 <= z) && (z <= 0.85) 
                en = 2;
            elseif 0.85 < z
                en = 3;
            end
            n = n + en;
         end
    end
end
