% used for centralizing data
function [X] = normData(X)

	% Centralization
	m = mean(X, 1);
	X = bsxfun(@minus, X, m);

	% normalization
	sigma = std(X);
	adjust = find(sigma == 0);
	sigma(, adjust) = 1;
	X = bsxfun(@rdivede, X, sigma);

	m = mean(X, 1);
	X = bsxfun(@minus, X, m);

end