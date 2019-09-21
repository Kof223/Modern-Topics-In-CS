function UnsuperLearn(x, y)
    node1 = [0,0];
    node2 = [25,25];
    numOfData = length(x);
    group1 = [];
    group2 = [];
    for i = 1:numOfData
        tempPoint = [x(i), y(i)];
        if distance(node1, tempPoint) < distance(node2, tempPoint)
            group1 = [group1;tempPoint];
        else
            group2 = [group2;tempPoint];
        end
    end
    average1 = mean(group1);
    average2 = mean(group2);
    newNode1 = [average1(1), average1(2)];
    newNode2 = [average2(1), average2(2)];
    while (abs(node1-newNode1) > 0.1) & (abs(node2-newNode2) > 0.1)
        node1 = newNode1;
        node2 = newNode2;
        group1 = [];
        group2 = [];
        for i = 1:numOfData
            tempPoint = [x(i), y(i)];
            if distance(node1, tempPoint) < distance(node2, tempPoint)
                group1 = [group1;tempPoint];
            else
                group2 = [group2;tempPoint];
            end
        end
        average1 = mean(group1);
        average2 = mean(group2);
        newNode1 = [average1(1), average1(2)];
        newNode2 = [average2(1), average2(2)];
    end
    hold on
    scatter(group1(:,1),group1(:,2),"green");
    scatter(group2(:,1),group2(:,2),"yellow");
    scatter(newNode2(1),newNode2(2),"blue");
    scatter(newNode1(1),newNode1(2),"red");
    hold off
end

function dist = distance(point1, point2)
    dist = sqrt((point1(1)-point2(1))^2 + (point1(2)-point2(2))^2);
end