function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% loop over the examples
for i=1:size(X,1)
  distances = zeros(K, 1);
  % loop over the centroids
  for j=1:K
    % find the distance
    distance = X(i,:)' - centroids(j,:)';
    % squared distance
    sq_dist = distance' * distance;
    distances(j) = sq_dist;
  end
  
  % find the value and position of the minimum distance
  [val, pos] = min(distances);
  % set the centroid for this example to the closest centroid
  idx(i) = pos;
end


% =============================================================

end

