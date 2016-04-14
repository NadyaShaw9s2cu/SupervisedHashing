function neighbourH = calcHammingRank(Bicode1, Bicode2);
	dist = calcHammingDist(Bicode1, Bicode2);
	[~, neighbourH] = sort(dist, 2);
end