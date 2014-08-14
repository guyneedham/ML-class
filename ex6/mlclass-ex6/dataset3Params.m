function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% the steps that C and sigma will use
steps = [0.01 0.03 0.1 0.3 1 3 10 30];
% place holder for error_min, set to infinity as the first result
% is guaranteed to be lower than this
minError = inf;

% double loop for finding C and sigma
for C_test = steps
  fprintf('Now testing C = %f.\n',C_test);
  for sigma_test = steps
    fprintf('Now testing sigma = %f.\n',sigma_test);
    % fit the model for this iteration
    iterModel = svmTrain(X,y,C_test,@(x1,x2) gaussianKernel(x1,x2, sigma_test));
    % make predictions
    predictions = svmPredict(iterModel, Xval);
    % find prediction error
    error = mean(double(predictions ~= yval));
    % is this the lowest error yet?
    if( error < minError )
      % set up for return, and report on the values.
      C = C_test;
      sigma = sigma_test;
      minError = error;
      fprintf('New C and sigma values found: C = %f, sigma = %f.\nError = %f.', C, sigma, error);
    end
  end
end

fprintf('Best C and sigma found: C = %f, sigma = %f, error = %f.',C,sigma, minError);

% =========================================================================

end
