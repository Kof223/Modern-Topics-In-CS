function roll = rolled(input)
    Theta = {randn(785,16), randn(17,16), randn(17,10)};
    integer = 1;
    Theta{1} = reshape(input(1:785*16),785,16);
    for layer = 2:3
        first = size(Theta{layer-1})
        last = size(Theta{layer});
        Theta{layer} = reshape(input(first(1)*first(2)+1:last(1)*last(2)),last(1)-first(1),last(2)-first(2));
        
    end
    roll = Theta;
end