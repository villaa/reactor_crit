%neutrons over time
tic;
ni = input('Enter initial number of neutrons: N(0) = ');
g = input('Enter number of generations = ');
n = ni; %initially set total neutrons to initial number inputted
t = 0; %initially time starts at zero
out=[n,0];
for ol = 1:g  
    nl = 0; %resetting these intermediate variables at the beginning of each iteration
    cf = 0;
    %tableA(tm,:)=[Neutrons Time]
   for a = 1:n
       x = rand();
       y = rand();
        if (0.81 < x)    %if random # is greater than 0.81 it leaked
            n = n - 1 ;   %If leaked total nuetrons-1
            t(ol) = y * 200;
       % elseif (0.81 >= x)     %0.81 probability for PNL
       %    nl = nl + 1;  
        end
        next=[out, t];
        out = [out;next];
   %t(n)= y * 100;
   end
  %  for b = 1:n %creating random numbers for f
  %      y = rand();
  %       if (0.72 < y)
  %       n = n - 1; % if no fiss total neutrons-1
  %       elseif (0.72 >= y)
  %  cf = cf + 1;
   %      end
   % end
   % for c = 1:cf
    %    z = rand();
    %    if 0.2 > z
    %        en =1;
    %    elseif (0.2 <= z) && (z <= 0.85) 
    %        en = 2;
    %    elseif 0.85 < z
    %        en = 3;
    %    end
   % end 
end
toc;
