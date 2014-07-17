function J = test()
data = load('ex1data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y);
X = [ones(m, 1), data(:,1)]; % Add a column of ones to x
theta = zeros(2, 1); % initialize fitting parameters
theta;
h = X * theta;
error = h - y;
error_sqr = error.^2;
sum = sum(error_sqr);
J = 1/(2*m) * sum;
