% Find the split entropy, such that y was divided in two sets y0 and y1
% according to a feature

% The parameters received are:
% - y0 (n_0 x 1): The labels of each datapoint in X0, such that X was divided
% in X0 and X1
% - y1 (n_1 x 1): The labels of each datapoint in X1
%
% The function should return:
% - Ip (1 x 1): The split entropy
function Ip = SplitEntropy(y0,y1)
I0 = NodeEntropy(y0);
I1 = NodeEntropy(y1);
N_m_total = size(y0,1)+size(y1,1);
Ip = ((size(y0,1)/N_m_total)*I0) + ((size(y1,1)/N_m_total)*I1);
end

