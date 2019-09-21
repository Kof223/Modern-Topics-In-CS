function [cost, grad] = networkCost(x,y,unrolled_theta, structure)
    theta = roll(unrolled_theta, structure);
    Y=zeros(size(y,1),10);

    for i=1:10
        Y(y(:,1) == mod(i,10),i)=1;
    end

    a = cell(length(structure),1);
    X = [ones(length(x(1,:)),1) x'];
    a{1} = X;
    for i=1:length(structure)-1
        z = X*theta{i};
        h = sigmoid(z);
        X = [ones(length(h),1) h];
        a{i+1} = X;
    end

    %Backprop
    delta = cell(length(structure),1);
    a{end}(:,1) = [];
    delta{end} = a{length(structure)} - Y;
    derv = cell(length(structure)-1,1);
    for i = length(structure)-1:-1:1
        m = length(X);
        delta{i} = delta{i+1}*theta{i}'.*(a{i}.*(1-a{i}));
        delta{i}(:,1) = [];
        derv{i} = 1/m*a{i}'*delta{i+1};
    end

    cost = 1/length(x(1,:))*trace(((1-Y)' * log(1-h)+Y'*log(h)) * -1);
    grad = unroll(derv);
end