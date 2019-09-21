

function linReg(x, y)
    % Setup Theta. Starts from theta 0 to theta x.
    theta = [0.1; 0.1;];
    
    % Setup Learning Rate
    alpha = 0.5;
    
    normalized = normalize(x);
    
    one = ones(length(x),1);
    xs = [one(:), normalized(:)];
    
    ints = 1:10;
    costs = zeros(10:1);
    gradient = ones(2,1);
    for i = 1 : 10
        diffVec =  xs * theta - y;
        cost = diffVec' * diffVec / length(normalized) / 2;
        for j = 1 : 2
            gradient(j) = 1/length(y) * dot(diffVec, xs(:,j) * theta(j));
            theta(j) = theta(j) - alpha * gradient(j);
        end

        costs(i) = cost;
    end
    theta
    costs
    plot (ints, costs);
    xlabel('Iterations') 
    ylabel('Cost') 
end
