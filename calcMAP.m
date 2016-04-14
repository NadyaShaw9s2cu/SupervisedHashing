function [MAP] = calcMAP(neighbourH, neighbourTest)
	[num_data, num_dim] = size(neighbourTest);
	cntOnes = ones(1, num_dim);
	cntOnes = cumsum(cntOnes); 
	MAP = 0;
	succNum = 0;
	for i = 1:num_data
		neighbour_id = neighbourH(i, :);
		isNeighbour = neighbourTest(i, neighbour_id);
		cntNeighbour = cumsum(isNeighbour);
		allPrec = cntNeighbour./cntOnes;
		usefulPrec = allPrec(isNeighbour);
		MAP = MAP + mean(usefulPrec);
		succNum = succNum + 1;
	end
	MAP = MAP/succNum;
end