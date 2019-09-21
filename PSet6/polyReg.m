

function polyReg(x, y)
    % Setup Theta. Starts from theta 0 to theta x.
    theta = [0.1; 0.2; 0.1; 0.1];
    ints = 1:3;
    % Setup Learning Rate
    alpha = [0.5, 0.1, 0.04];
    
    normalized = normalize(x);
    
    xs = repmat(normalized, 1, 4);
%     for i = 1:4
%         xs(:,i) = xs(:,i).^(i-1);
%     end
    xs(:,1) = xs(:,1).^0;
    xs(:,2) = normalized;
    xs(:,3) = x.^2;
    xs(:,4) = x.^3;
    gradient = ones(4,1);
    costs = zeros(3:1);
    for degree = 2 : 4
        theta = [0.1; 0.1; 0.1; 0.1];
        for i = 1 : 100
            diffVec =  xs(:,1:degree) * theta(1:degree,1) - y;
            cost = diffVec' * diffVec / length(normalized) / 2;
            for j = 1 : degree
                gradient(j) = 1/length(y) * dot(diffVec, xs(:,j) * theta(j));
                theta(j) = theta(j) - alpha(degree-1) * gradient(j);
            end
            costs(degree-1) = cost;
        end
    end
    theta
    costs
    plot (ints, costs);
    xlabel('Degree') 
    ylabel('Cost') 
    display("There is no point in continuing when it fits well");
end
