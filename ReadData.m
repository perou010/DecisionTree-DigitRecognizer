function [X_trn, y_trn, X_val, y_val, X_tst, y_tst] = ReadData(training_filename, validation_filename, test_filename)
Training = importdata(training_filename);
Valid = importdata(validation_filename);
Test = importdata(test_filename);
X_trn = Training(:,1:end-1);
y_trn = Training(:,end);
X_val = Valid(:,1:end-1);
y_val = Valid(:,end);
X_tst = Test(:,1:end-1);
y_tst = Test(:,end);
end
