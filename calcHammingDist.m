function [dist] = calcHammingDist(BiCode1, BiCode2)
	if ~exist('BiCode2', 'var')
		BiCode2 = BiCode1;
	end
	
	B1 = sign(BiCode1 - 0.5);
	B2 = sign(BiCode1 - 0.5);
	num_bits = size(BiCode1, 2);
	
	dist = (num_bits-B1*B2')/2;
end
