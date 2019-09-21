function s = roll(v,structure)
    temp = cell(length(structure)-1,1);
    for j = 1:length(temp)
       V = zeros(structure(j)+1,structure(j+1));
       for i = 1:min(size(V))
           V(:,i) = v(1:length(V));
           v(1:length(V)) = [];
       end
       temp{j} = V;
    end
    s = temp;
end

