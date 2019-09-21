clc
x= [loadMNISTImages('train-images.idx3-ubyte') loadMNISTImages('t10k-images.idx3-ubyte')];
y= [loadMNISTLabels('train-labels.idx1-ubyte'); loadMNISTLabels('t10k-labels.idx1-ubyte')] ;

theta = {randn(785,30), randn(31,30), randn(31,10)};
structure = [784,30,30,10];
unrolled_init_theta = unroll(theta);

toMin = @(j) networkCost(x,y,j, structure);
[thetaopt, costs, iters] = fmincg(toMin, unrolled_init_theta, struct('MaxIter', 100));
final_theta = roll(thetaopt,structure);