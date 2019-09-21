function correct = test(theta)
    X = loadMNISTImages("t10k-images.idx3-ubyte");
    xs = [ones(10000,1), X'];
    y = loadMNISTLabels("t10k-labels.idx1-ubyte");

    Y = zeros(size(y,1), 10);
    for i = 1 : 10
        Y(y(:,1) == mod(i,10),i) = 1;
    end
    
    for i = 1 : 3
        h = 1./(1+exp(-(xs*theta{:,i})));
        xs = [ones(length(h),1), h];
    end
    trueNum = zeros(length(h),1);
    for i = 1:length(h)
        max = 0;
        index = 1;
        for j = 1:10
            if h(i,j) > max
                max = h(i,j);
                index = j;
            end
        end
        trueNum(i) = index;
        if index == 10
            trueNum(i) = 0;
        end
    end
    trueNum;
    sum = 0;
    for i = 1:length(trueNum)
        if trueNum(i) == y(i)
            sum = sum+1;
        else
            sum = sum+0;
        end
    end
    correct = sum/length(trueNum);
end