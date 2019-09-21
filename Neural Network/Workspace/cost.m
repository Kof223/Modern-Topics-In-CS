function [c, dJ] = cost(Theta, xs, Y)
    as = cell(4,1);
    as{1} = xs;
    for i = 1 : 3
        h = 1./(1+exp(-(xs*Theta{:,i})));
        xs = [ones(length(h),1), h];
        as{i+1} = xs;
    end
    c = trace(((1-Y)' * log(1-h)+Y'*log(h)) * -1)/length(xs);
    delta = cell(4,1);
    as{end}(:,1) = [];
    delta{end} = as{4}-Y;
    delta{end} = [ones(length(delta{end}),1), delta{end}];
    as{end} = [ones(length(as{end}), 1), as{end}]
    for i = 3:-1:1
        % Remove column of ones
        delta{i} = delta{i+1}(:,2:size(delta{i+1},2)) * Theta{i}' .* as{i}.*(1-as{i})
    end

    derivative = cell(3,1);
    for i = 1:3
        size(delta{i})
        size(as{i+1})
        derivative{i} = 1/length(delta{i}) * delta{i}' * as{i+1}(:,2:size(as{i+1},2))
    end
    unrolled = [];
    for i = 1:3
        unrolled = [unrolled; derivative{i}(:)];
    end
    dJ = unrolled;
end