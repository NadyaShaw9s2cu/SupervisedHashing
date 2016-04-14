% logical matrices
% if two data's label are equal, then they are neighbour
% divide data into batches in case using up memory

function isNeighbour = calcNeighbour(dataset, idx1, idx2)
	% single calc
	if ~exist('idx2', 'var')
		idx2 = idx1;
		
	maxMemory = 2000000000; % 2 GB
	n1 = size(idx1);
	n2 = size(idx2);
	isNeighbour = false(n1, n2);
	% n1 is the smaller one

	singleSize = floor(maxMemory/(8*n1)/8);
	st = 1;
	label1 = dataset.label(idx1); % column vector
	label2 = dataset.label(idx2);

	while st <= n2
		ed = min(st+singleSize-1, n2);
		l1 = label1;
		l2 = label2(st:ed);
		singleNeighbour = repmat(l1, 1, ed-st+1) - repmat(l2', n1, 1);
		isNeighbour(:, st:ed) = (singleNeighbour == 0);
		st = st + singleSize;
	end
end
