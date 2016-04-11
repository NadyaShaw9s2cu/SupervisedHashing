% this program is used to compass data into binary code
% a supervised hashing algorithm
% 'fileName': .mat file, with a training matrix X and a label matrix label. Each row is a sample.

% Just for fun, it's not original
function demo(fileName)

fprintf('Loading Dataset...\n')
load(fileName);

% nomalization
fprintf('nomalalizing...\n')
dataset.X = normData(X);

fprintf('Data partition\n')

% reorder
num_dataset = size( X, 1 );
rng('default');
neworder = randperm(num_dataset);
dataset.X = dataset.X(neworder);

% partition
num_test = 1000;
mid = num_dataset - num_test;
dataset.train_id = 1:mid;
dataset.test_id = mid+1:num_dataset;
dataset.neighbourType = 'label';
dataset.label = dataset.label(neworder);

% sparse
dataset.X = effSparseCoding(dataset.X);

% Parameter
fprintf('Setting parameters...\n');
method.learnImpl = 'stochastic';
method.maxIter = 50;
method.beta = 3e1;
method.lambda = 1e0;
codeLength = 64;

% Training
fprintf('Start training...\n')
[BicodeTrain, BicodeTest, timeTrain, timeTest] = lfh(datset, method, codeLength);

% Evaluation
fprintf('Evaluating...\n')
dataset.neighbourTest =calcNeighbour(dataset);
neighbourH = calcHammingRank(BicodeTrain, BicodeTest);
[MAP, succRate] = calcMAP(neighbourH, dataset.neighbourTest);

fprintf('MAP: %f succRate:%f\n', MAP, succRate);
fprintf('Train: %f(s)\n Test: %f(s)\n', timeTrain, timeTest);

end