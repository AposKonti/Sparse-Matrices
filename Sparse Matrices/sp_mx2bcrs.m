function [val,col_idx,row_blk]= sp_mx2bcrs(A,nb)
    % Author : Α. Κονταρίνης , ΑΜ 1059565 , Date : 8/2/2021
    row_i = 1; 
    index = 1;
    counter = 0;
    val = [];
    col_idx = [];
    row_blk = [];
    row_blk(1) = 1;
    for i=1:nb:size(A)
        col_i = 1;
        for j=1:nb:size(A)
            if nnz(A(i:i+nb-1, j:j+nb-1)) ~= 0
                val(1:nb,index:index+nb-1) = A(i:i+nb-1 , j:j+nb-1);
                col_idx = [col_idx, col_i];
                index = index + nb;
                counter = counter + 1;
            end
            col_i = col_i + 1;
        end
        row_i = row_i + counter;
        row_blk = [row_blk, row_i];
        counter = 0;
    end
end