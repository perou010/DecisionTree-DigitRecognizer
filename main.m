[X_trn, y_trn, X_val, y_val, X_tst, y_tst] = ReadData('optdigits_train.txt','optdigits_valid.txt','optdigits_test.txt');

thetas=[0.01,0.2,0.3,0.4,0.5,1.0,2.0];

val_errors = zeros(length(thetas),1);

for theta_idx=1:length(thetas)
    theta = thetas(theta_idx);
    
    node = GenerateTree(X_trn, y_trn, theta);

    y_pred = zeros(size(y_trn));
    for x = 1:size(y_trn,1)
        y_pred(x) = PredictWithTree(node, X_trn(x,:));
    end
    error_rate  = CalculateErrorRate(y_pred, y_trn);
    fprintf('(theta=%f) Training set error rate: %.4f\n', theta, error_rate);

    y_val_pred = zeros(size(y_val));
    for x = 1:size(y_val,1)
        y_val_pred(x) = PredictWithTree(node, X_val(x,:));
    end
    error_rate  = CalculateErrorRate(y_val_pred, y_val);
    fprintf('(theta=%f) Validation set error rate: %.4f\n', theta, error_rate);
    val_errors(theta_idx) = error_rate;
end

[min_val, idx] = min(val_errors);
theta = thetas(idx);
node = GenerateTree(X_trn, y_trn, theta);

y_pred_test = zeros(size(y_tst));
    for x = 1:size(y_tst,1)
        y_pred_test(x) = PredictWithTree(node, X_tst(x,:));
    end
    error_rate  = CalculateErrorRate(y_pred_test, y_tst);
fprintf('(theta=%f) Test set error rate: %.4f\n', theta, error_rate);
