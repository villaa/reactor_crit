%neutrons over time
tic;
ni = input('Enter initial number of neutrons: N(0) = ');
it = input('Enter run time in microseconds = ');
n = ni; %initially set total neutrons to initial number inputted
t=0;
dn=0;
cf=0;
out=zeros(0,2);
for ol = 1:ni  
    nl = 0; %resetting these intermediate variables at the beginning of each iteration
    %cf = 0;
   for a=1:nt
    x=rand();
    y=rand();
        if (0.81 < x)    %if random # is greater than 0.81 it leaked
            dn = -1 ;   %If leaked total nuetrons-1
            nt = nt + dn;
            t1 = y * 200;
        elseif (0.81 >= x)     %0.81 probability for PNL
            t2 = y * 10;
            dn = 0;
        end
        n = ni + dn;
        out=[out;[t,dn]];
        %end    
    for b = 1:n %creating random numbers for f
       z = rand();
       w = rand();
         if (0.72 < y)
            dn = - 1; % if no fiss total neutrons-1
            t= w*100
         elseif (0.72 >= y)
            cf = cf + 1;
            t=w*50
        end
   end
   for c = 1:cf
      s = rand();
      g = rand();
      q = rand();
      t = g*(ol-1)*200+ q*100
      if 0.2 > z
           dn = 0;
       elseif (0.2 <= z) && (z <= 0.85) 
           dn = 1;
       elseif 0.85 < z
           dn = 2;
      end
       out=[out;[t,dn]];
    end 
   % if nt==0 
   %     break;
   %end
    
   end
end
B = sortrows (out, 1); %sort numerically by column one time     
B = [[0,ni];B];
B(:,2)=cumsum(B(:,2),1);     
fileID = fopen('NofTData.txt','w');%write a a text file
formatSpec = '#Code Version(5274) Inputs: Number on Neutrons(%d) Number of generations(%d)\n\r';
fprintf(formatSpec,ni,g);
fprintf(fileID,'%3f %0f\n',B'); %3digits past decimal in time integer for n total
fclose(fileID); 
B
toc;
