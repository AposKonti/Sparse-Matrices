function [y]= spmv_bcrs(y,val,col_idx,row_blk,x)
    % Author : Α. Κονταρίνης , ΑΜ 1059565 , Date : 8/2/2021
    nb = size(val,1);
    idx_val = 1;
    idx_col = 1;
    idx_row = 1;
    for i = 1:length(row_blk)-1
        blocks = row_blk(i+1) - row_blk(i);
        for j = 1:blocks
            v1 = val(1:nb, idx_val*nb-nb+1:idx_val*nb);
            v2 = x(col_idx(idx_col)*nb-nb+1:col_idx(idx_col)*nb,1);
            y(idx_row*nb-nb+1:idx_row*nb,1) = y(idx_row*nb-nb+1:idx_row*nb,1) + v1 * v2;
            idx_val = idx_val + 1;
            idx_col = idx_col + 1;
        end
        idx_row = idx_row + 1;
    end
end
