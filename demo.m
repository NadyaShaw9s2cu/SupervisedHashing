% this program is used to compass data into binary code
% a supervised hashing algorithm
% 'fileName': .mat file, with a training matrix X and a label matrix label. Each row is a sample.
function demo(fileName)

fprintf('Loading Dataset...\n')
load(fileName);

fprintf('Centralizing...\n')
dataset.X = normZeroMean(X);
dataset.X = normEqualVariance(X);

fprintf('Data partition\n')
% test
num_dataset = size( X, 1 );
num_test = 1000;
test_id = randperm( num_dataset );
dataset.X = dataset.X( test_id, : )