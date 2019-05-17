% The parameters received are:
% - y (n x 1): Labels of n datapoints

% The function should return:
% - I (1 x 1): The entropy

function I = NodeEntropy(y)
N_m = zeros(10,1);
for n = 1:size(y,1)
    N_m(y(n)+1) = N_m(y(n)+1) + 1;
end
I = 0;
N_m_total = sum(N_m);
for i = 1:10
    p_im = N_m(i)/N_m_total;
    if (p_im ~= 0)
        I = I - (p_im * log2(p_im));
    end
end
end

