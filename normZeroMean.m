% used for centralizing data
function [X] = normZeroMean(X)

m = mean(X, 1);
X = bsxfun(@minus, X, m);

end