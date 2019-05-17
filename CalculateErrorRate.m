function error_rate = CalculateErrorRate(y_pred,y_lbl)
errors = 0;
    for y = 1:size(y_lbl,1)
        if(y_lbl(y) ~= y_pred(y))
            errors = errors + 1;
        end
    end
error_rate = errors / size(y_lbl,1);
end

