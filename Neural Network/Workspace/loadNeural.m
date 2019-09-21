function loadNeural()
    X = loadMNISTImages("train-images.idx3-ubyte");
    xs = [ones(60000,1), X'];
    y = loadMNISTLabels("train-labels.idx1-ubyte");
    Theta = {randn(785,16), randn(17,16), randn(17,10)};

    Y = zeros(size(y,1), 10);
    for i = 1 : 10
        Y(y(:,1) == mod(i,10),i) = 1;
    end
end