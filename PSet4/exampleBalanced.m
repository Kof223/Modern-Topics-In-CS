function y=exampleBalanced(x)
    y=mod(x,2);
    if x < 0 || log2(x) >= 7
        y=-1;
    end
end