%Another try
tic;
ni = input('Enter initial number of neutrons: N(0) = ');
g = input('Enter number of generations = ');
nt = ni; %initially set total neutrons to initial number inputted
t=0;
dn=0;
%out(1,1)= t;
%out(1,2)= dn;
out=zeros(0,2);
for z=1:g
    for a=1:nt
    x=rand();
    y=rand();
        if (0.81 < x)    %if random # is greater than 0.81 it leaked
            dn = -1 ;   %If leaked total nuetrons-1
            nt = nt+dn;
            t = y * 200;
            out=[out;[t,dn]];
        end
        %out(a,2)=dn;
        %out(a,1)=t;
        
    end     
    if nt==0 break;
    end
end
B = sortrows (out, 1); %sort numerically by column one time   
%out(any(B==0,2),:) = [];  
B= [[0,ni];B];
B(:,2)=cumsum(B(:,2),1);     
%C= (B(:1)),(A(:2));
%C = B(:, 1);
%C = A(:, 2);
fileID = fopen('NofTData.txt','w');%write a a text file
fprintf(fileID,'%3f %i\n',C'); %3digits past decimal in time integer for n total
fclose(fileID); 
%figure;
%T=B(:,1);
%N=A(:,2);
%plot(T,N);
%title('Neutrons over Time')
%xlabel('Time in microseconds')
%ylabel('Neutrons')
B
toc;