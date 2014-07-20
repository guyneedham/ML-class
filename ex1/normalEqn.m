function [theta] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

theta = zeros(size(X, 2), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%

% ---------------------- Sample Solution ----------------------

  % use pseudo inverse in case feature matrix is non-intertible
  theta = pinv(X'*X) * X' * y;
  % benefits of normal equation: 
      % no alpha term needed - no learning rate, so can't get issues from this
      % feature scaling not needed
  % drawbacks:
      % for high n, hard to compute
      % matrix may be non-intervible
      % due to many features or redundant, duplicated features  
% -------------------------------------------------------------


% ============================================================

end
