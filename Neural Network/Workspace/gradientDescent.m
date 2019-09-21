function [c, dJ] = networkCost(Theta, X, y)
    xs = [ones(60000,1), X'];

    Y = zeros(size(y,1), 10);
    for i = 1 : 10
        Y(y(:,1) == mod(i,10),i) = 1;
    end
    
    roll = rolled(Theta);
    as = cell(4,1);
    as{1} = xs;
    for i = 1 : 3
        h = 1./(1+exp(-(xs*roll{i})));
        xs = [ones(length(h),1), h];
        as{i+1} = xs;
    end
    c = 1/length(X(1,:))*trace(((1-Y)' * log(1-h)+Y'*log(h)) * -1);
%     c = trace(((1-Y)' * log(1-h)+Y'*log(h)) * -1)/length(X(1,:));
%     delta = cell(4,1);
%     removedBias = as{end}(:,1);
%     as{end}(:,1) = [];
%     delta{end} = as{4}-Y;
%     delta{end} = [ones(length(delta{end}),1), delta{end}];
%     as{end} = [ones(length(as{end}), 1), as{end}];
%     for i = 3:-1:1
%         % Remove column of ones
%         delta{i} = delta{i+1}(:,2:size(delta{i+1},2)) * roll{i}' .* as{i}.*(1-as{i});
%     end
% 
%     derivative = cell(3,1);
%     for i = 1:3
%         derivative{i} = 1/length(delta{i}) * delta{i}' * as{i+1}(:,2:size(as{i+1},2));
%     end
    
    delta = cell(4,1);
    as{end}(:,1) = [];
    delta{end} = as{4} - Y;
    derv = cell(3,1);
    for i = 3:-1:1
        m = length(X);
        delta{i} = delta{i+1}*roll{i}'.*(as{i}.*(1-as{i}));
        delta{i}(:,1) = [];
        derv{i} = 1/m*as{i}'*delta{i+1};
    end

    unrolled = [];
    for i = 1:3
        unrolled = [unrolled; derv{i}(:)];
    end
    dJ = unrolled;
end