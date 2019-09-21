function P3(class, value1, value2)
    A = [value1, value2, class];
    for i = length(class):-1:1
        if (A(i,3) == 5)
            A(i,3) = 0;
        elseif (A(i,3) == 20)
            A(i,3) = 1;
        else
            A(i,:) = [];
        end
    end
    x = normalize(A(:,1));
    y = normalize(A(:,2));
    z = (A(:,3));
    plotpv([x';y'], z');
    title('+ is 20 ringed, o is 5 ringed');
    xlabel('Shucked Weight');
    ylabel('Diameter');
    
%     Setup theta
    theta = [0.2; 0.5; 0.5];
    
%     Setup Learning Rate
    alpha = 1;
    xs = [ones(length(x),1), x, y];
    logistic = 1./(1+exp(-(xs*theta)));
    cost = ((1-z)' * log(1-logistic)+z'*log(logistic)) * -1 / length(x);
    gradient = xs'*(logistic - z)/length(x);
    costs = [];
    gradients = [];
    while gradient(1) > 0.001
        logistic = 1./(1+exp(-(xs*theta)));
        cost = ((1-z)' * log(1-logistic)+z'*log(logistic)) * -1 / length(x);
        gradient = xs'*(logistic - z)/length(x);
        theta = theta - alpha*gradient;
        costs((end+1)) = cost;
        gradients((end+1)) = gradient(1);
    end
    
    half = theta(1)/(-theta(3)-theta(2));
    hold on
    n = -3:0.1:3;
    o = (-theta(2)*n-theta(1))/theta(3);
    plot(n,o);
    hold off
end