function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

% loop through iterations
for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    % theta is updated as a vector to speed up algorithm
    % -1/m times differential
    % differential is hpothesis X * theta
    % transpose
    % times by X
    % all transposed
    % differential is times by alpha
    theta = theta - ((1/m) * ((X * theta) - y)' * X)' * alpha;
    % add cost to history  
    J_history(iter) = computeCost(X, y, theta);

end

end
