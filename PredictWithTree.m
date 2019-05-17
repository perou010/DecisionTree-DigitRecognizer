% The parameters received are:
% - root_node (1 data structure): The root of the learned decision tree
% - x (1 x m): One datapoint, where m is the number of features
%
% The function should return:
% - y_pred (1 x 1): The prediction for x
%
function y_pred = PredictWithTree(root_node,x)
while(1)
    if(ismember(root_node.class, [1 2 3 4 5 6 7 8 9 0]))
        y_pred = root_node.class;
        return;
    end
    if(x(root_node.feature) == 0)
        root_node = root_node.child0;
    else
        root_node = root_node.child1;
    end
end
end

