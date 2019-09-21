function P1(class, value)
    A = [value, class];
    for i = length(class):-1:1
        if (A(i,2) == 5)
            A(i,2) = 0;
        elseif (A(i,2) == 20)
            A(i,2) = 1;
        else
            A(i,:) = [];
        end
    end
    
    x = normalize(A(:,1));
    y = A(:,2);
    scatter(x,y);
    
    % Setup theta
    theta = [0.2; 0.5;];
    
    % Setup Learning Rate
    alpha = 1;
    xs = [ones(length(x),1), x];
    costs = zeros(1000, 1);
    for i = 1 : 1000
        h = 1./(1+exp(-(xs*theta)));
        cost = ((1-y)' * log(1-h)+y'*log(h)) * -1 / length(x);
        gradient = xs'*(h - y)/length(x);
        theta = theta - alpha*gradient;
        costs(i) = cost;
    end
    n = 1:1000;
    plot (n, costs);
    xlabel('Iterations') 
    ylabel('Cost') 
    
%     hold on
%     n = -3:0.1:3;
%     m = 1./(1+exp(-theta(2)*n-theta(1)));
%     plot(n,m);
%     hold off
end