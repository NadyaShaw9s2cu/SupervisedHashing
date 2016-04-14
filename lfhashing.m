function [BicodeTrain, BicodeTest, timeTrain, timeTest] = lfhashing(datset, method, codeLength)
	Xtrain = datset.X(datset.train_id);
	Ntrain = size(Xtrain, 1);
	Xtest  = datset.X(datset.test_id);
	Ntest = size(Xtest, 1);
	Q = codeLength;
	D = size(Xtrain, 2);
	
	tictimeTrain = tic;
	% initializations
	U = PCA(Xtrain);
	
	% Learning--U
	betaNorm = method.beta / Q;
	sNeighbour = @(Sc)calcNeighbour(datset, datset.train_id, datset.train_id(Sc));
	U = learnU(U, beta, method.maxIter);
	
	% rounding
	BicodeTrain = rounding(U);
	W = ( X'*X + method.lambda*eye(D) ) \ X' * U;
	timeTrain = toc(tictimeTrain);
	
	% out-of-sample extension
	ticTimeTest = tic;
	UTest = Xtest * W;
	BicodeTest = rounding(UTest);
	timeTest = toc(ticTimeTest);
end