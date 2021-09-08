clear all;
close all;
clc;

%1D Haar Analysis

A=[88 88 89 90 92 94 96 97];  %input signal
k=length(A);   %length of input
n=1;            %init temp counters
i=1;

%create average and difference matrices

while n<=k 
    Avg(i)=(A(n)+A(n+1))/2;     %matrix with average values
    Adif(i)=A(n)-Avg(i);        %matrix with difference of each value from avg value
    i=i+1;
    n=n+2;
end


%create Haar matrix

l=length(Avg);      %length of matrix with average values
i=1;
j=1;
for n=1:k
    if n<=k/2       %if index is in first half of matrix 
        Ahaar(n)=Avg(i);    %save average value
        i=i+1;
    else                %else
        Ahaar(n)=Adif(j);       %save difference from avererage
        j=j+1;
    end
end

%1D Haar Synthesis
i=1;

%create upsampled matrix

for n=1:k
    Aup(n)=Avg(i);      %save average values to upsampled matrix
    b=mod(n,2);         %if average value saved twice 
    if(b==0)
        i=i+1;          %increment index for next average value
    end
end

%create recontrsucted matrix

i=1;
for n=1:k
    
    b=mod(n,2);     %if first of group
    if(b==0)    
        Arec(n)=Aup(n)-Adif(i);     %subtract difference
        i=i+1;
    else                            %else if second
        Arec(n)=Aup(n)+Adif(i);     %add difference
    end
end


if (A == Arec) 
    display('Perfect!!!') 
end

display(A)
display(Avg)
display(Adif)
display(Arec)