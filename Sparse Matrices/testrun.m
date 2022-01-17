function [equal] = testrun(x,matrix,nb)
    % Author : Α. Κονταρίνης , ΑΜ 1059565 , Date : 8/2/2021
    load(matrix);
    b = struct2cell(Problem);
    A = b{2,1};
    A = round(A);
    
    
    if x == 0
        x = round(rand(length(A),1));
    end
    x = round(x);
    y = zeros(length(A),1);
    
    [val1,col_idx1,row_blk1] = sp_mx2bcrs(A,nb);
    [y]= spmv_bcrs(y,val1,col_idx1,row_blk1,x);
    y_test = A*x;
    
    equal = isequal(y,y_test);
end