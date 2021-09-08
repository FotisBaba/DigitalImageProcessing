function I_new = Compute_Median(I, K)
    
    K_size = size(K);       %size of kernel


    I_size = size(I);       %size of input


    pad1 = floor(K_size(1)/2);      %setting floor 
    pad2 = floor(K_size(2)/2);      %values 

    padsize = [pad1 pad2];          %creating pad of K
    I_new = padarray(I, padsize, 0,'pre');  %setting variables
    I_new = padarray(I_new, padsize, 0,'post');     %for recursion

    
    row_start = pad1+1;             %compute start
    row_end = I_size(1)+pad1;       %and end of
    col_start = pad2+1;             %recursion
    col_end = I_size(2)+pad2;       %

    for i = row_start:row_end       %from start
        for j = col_start:col_end   %to end for both dimensions
            sub_array = I_new((i-pad1):(i+pad1),(j-pad2):(j+pad2)); %call recursivelly to compute next step
            P = sub_array(:)';                                      %save for sorting


            P = sort(P);        %sort
            P_size = size(P);   %get size


            median = ceil((P_size(2)/2)); %get median value

            I(i,j) =P(median);              %set median to central bit
        end
    end
    
    I_new = I;                              %output for each recursion
end