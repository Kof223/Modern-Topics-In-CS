

function c = cost(x, y)
    theta0 = -0.2;
    theta1 = 0.8;
    theta2 = 0.1;
    theta = [theta0; theta1; theta2];
    alpha = 0.01;
    
    normalized = normalize(x);
    
    xsquared = x(:).^2;
    one = ones(length(x),1);
    xs = [one(:), x(:), xsquared(:)];
    
    diffVec =  xs * theta - y;
    cost = diffVec' * diffVec / length(normalized) / 2;
    for i = 1 : 10
        diffVec =  xs * theta - y;
        cost = diffVec' * diffVec / length(normalized) / 2;
        gradient2 = 1/length(y) * dot(diffVec, xs(:,3) * theta(3));
        gradient1 = 1/length(y) * dot(diffVec, xs(:,2) * theta(2));
        gradient0 = 1/length(y) * dot(diffVec, xs(:,1) * theta(1));
        thetaChange2 = -1 * alpha * gradient2;
        theta(3) = theta(3) + thetaChange2;
        thetaChange1 = -1 * alpha * gradient1;
        theta(2) = theta(2) + thetaChange1;
        thetaChange0 = -1 * alpha * gradient0;
        theta(1) = theta(1) + thetaChange0;
        theta
        %c = [theta(2), theta(1)];
        c = [theta(3), theta(2), theta(1)];
        diffVec =  xs * theta - y;
        cost = diffVec' * diffVec / length(normalized) / 2;
    end
    
end
