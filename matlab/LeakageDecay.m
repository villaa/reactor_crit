%Leakage Only
tic;
ni = input('Enter initial number of neutrons: N(0) = ');
FracLeak = input('Enter the fraction of leakage as a decimal = ');
nt = ni; %initially set total neutrons to initial number inputted
t=0;
dn=0;
cf=0;
out=zeros(0,2);
for z=1:ni
    for a=1:nt
    x=rand();
    y=rand();
        if (FracLeak < x)    %if random # is greater than 0.81 it leaked
                dn = -1 ;   %If leaked total nuetrons-1
                nt = nt+dn;
                t = (y * 200)+((z-1) * 200);
               out=[out;[t,dn]];
        end  
            if nt==0 
                break;
            end
    end
    
end
B = sortrows (out, 1); %sort numerically by column one time   
B= [[0,ni];B];%insert a pair at beginning of B of Zero time and Initial neutrons
B(:,2)=cumsum(B(:,2),1);% the sum of the change in neutrons column
fileID = fopen('NofTData.txt','w');%write a a text file
formatSpec = '#Code Version #### Inputs: Number on Neutrons(%d) Fractional Leakage(%d)\n\r';
fprintf(fileID,formatSpec,ni,FracLeak);
fprintf(fileID,'%3f %u\n',B'); %3digits past decimal in time integer for n total
fclose(fileID);
simplot(FracLeak);
B;
toc;