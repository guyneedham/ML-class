function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% calculate the cost - theta(0) should not be regularised
% deal with this by taking away a term in the lambda calculation
% this removes the component from theta(0)
J = 1./m * ( -y' * log( sigmoid(X * theta) ) - ( 1 - y' ) * log ( 1 - sigmoid( X * theta)) ) + lambda / 2. / m * ( theta' * theta - theta(1)^2 );
% initialise the mask vector to the value 1 and the same size as theta
mask = ones(size(theta));
% set the first element to 0 to remove the value of theta(0) from gradient calculation
mask(1) = 0;
% calculate the cost
grad = 1./m * X' * (sigmoid(X * theta) - y) + lambda * (theta .* mask)/ m;



% =============================================================

end
