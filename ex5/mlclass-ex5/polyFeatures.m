function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% 

% set up the first column of X_poly to be X itself
X_poly(:,1) = X;
% for all higher powers than X^1
for i=2:p
  % this column of X_poly is assigned to X x the previous column of X_poly
  % so if i = 2, 2nd column of X_poly is X^2
  X_poly(:,i) = X.*X_poly(:,i-1);
end


% =========================================================================

end
