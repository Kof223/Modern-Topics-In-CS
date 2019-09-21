function s = unroll(v)
    V = [];
    for i = 1:length(v)
       V = [V; v{i}(:)];
    end
    s = V;
end

