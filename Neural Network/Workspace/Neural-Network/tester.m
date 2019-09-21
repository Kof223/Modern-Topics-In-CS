

x=loadMNISTImages('train-images.idx3-ubyte');
y=loadMNISTLabels('train-labels.idx1-ubyte');

Y=zeros(size(y,1),10);

for i=1:10
Y(y(:,1) == mod(i,10),i)=1;
end

X = [ones(length(x(1,:)),1) x'];
for i=1:3
   z = -X*theta{i};
   h = sigmoid(z);
   X = [ones(length(h),1) h];
end

X = X(:,2:min(size(X)));
cost = 1/length(x(1,:))*trace(((1-Y)' * log(1-h)+Y'*log(h)) * -1) 
diff = abs(X-Y);
disp("Accuracy: " + ( 1- mean(mean(diff)))*100 + "%");

function y = sigmoid(z)
    y = 1./(1+exp(z));
end