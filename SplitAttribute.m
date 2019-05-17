% Find the best feature to be split, using SplitEntropy
%
% The parameters received are:
% - X (n x m): where n is the number of datapoints, and m the number of
% features. 
% - y (n x 1): The label of each datapoint in X
%
% The function should return:
% - bestf (1 x 1): The index of the best feature to split
function bestf = SplitAttribute(X,y)
min_split_entropy = inf;
for d = 1:size(X,2)
    y0 = [];
    y1 = [];
    for x = 1:size(X,1)
        if (X(x,d) == 1)
            y0 = [y0;y(x)];
        else
            y1 = [y1;y(x)];
        end
    end
    s = SplitEntropy(y0, y1);
    if (s < min_split_entropy)
        min_split_entropy = s;
        bestf = d;
    end
end
end

