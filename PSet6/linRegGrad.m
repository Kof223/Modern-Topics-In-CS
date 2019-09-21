

function linRegGrad(x, y)
    % Setup Theta. Starts from theta 0 to theta x.
    theta = [0.1; 0.1;];
    
    % Setup Learning Rate
    alpha = 0.1;
    
    normalized = normalize(x);
    
    one = ones(length(x),1);
    xs = [one(:), normalized(:)];
    gradients = [];
    costs = [];
    gradient = ones(2,1);
    ints = [];
    counter = 0;
    thetas = [];
    while abs(gradient(2)) >= 0.01 || abs(gradient(1)) >= 0.01
        diffVec =  xs * theta - y;
        cost = diffVec' * diffVec / length(normalized) / 2;
        for j = 1 : 2
            gradient(j) = 1/length(y) * dot(diffVec, xs(:,j) * theta(j));
            theta(j) = theta(j) - alpha * gradient(j);
        end
        counter = counter + 1;
        thetas = [thetas; theta(1)];
        ints = [ints; counter];
        costs = [costs, cost];
        gradients = [gradients; (sqrt(gradient(2)^2+gradient(1)^2))];
    end
    theta
    thetas;
    costs;
    scatter(ints, thetas);
    scatter (gradients, costs);
    xlabel('Gradients') 
    ylabel('Cost') 
end
