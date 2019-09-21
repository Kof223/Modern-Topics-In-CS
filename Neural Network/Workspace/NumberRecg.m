% Back Propagation
function theta = backProp()
    X = loadMNISTImages("train-images.idx3-ubyte");
    y = loadMNISTLabels("train-labels.idx1-ubyte");
    Theta = {randn(785,16), randn(17,16), randn(17,10)};

    unrolled = [];
    for i = 1:3
        unrolled = [unrolled; Theta{i}(:)];
    end
    unrolled = unroll(Theta);
    structure = [784,16,16,10];

%     cost(Theta, xs, Y)
    func = @(Theta) networkCost(X, y, Theta, structure);
%     global trained
    [trained, costs,iters] = fmincg(func, unrolled);
    theta = roll(trained, structure);
end