% The parameters received are:
% - X (n x m): where n is the number of datapoints, and m the number of
% features. If this is the root node, X contains all the datapoints.
% Otherwise, n is the number of datapoints split by parent node
% - y (n x 1): The label of each datapoint in X

% The function should return:
% - node (1 data structre): Data structure that represents a node. Contains
% two children (child0 and child1), the feature used to split the node
% (when internal node), and the class label (when leaf)
function node = GenerateTree(X,y,theta)

    node = [];
    node.child0 = [];
    node.child1 = [];
    node.feature = [];
    node.class = [];

    
    if (NodeEntropy(y) < theta)
        N_m = zeros(10,1);
        for n = 1:size(y,1)
            N_m(y(n)+1) = N_m(y(n)+1) + 1;
        end
        [m,i] = max(N_m);
        node.class = i-1;
        return;
    end

    node.feature = SplitAttribute(X,y);

    y0 = [];
    y1 = [];
    X0 = [];
    X1 = [];
    for x = 1:size(X,1)
        if (X(x,node.feature) == 0)
                y0 = [y0;y(x)];
                X0 = [X0; X(x,:)];
        else
                y1 = [y1;y(x)];
                X1 = [X1; X(x,:)];
        end
    end
    
    node.child0 = GenerateTree(X0, y0, theta);
    node.child1 = GenerateTree(X1, y1, theta);
end

