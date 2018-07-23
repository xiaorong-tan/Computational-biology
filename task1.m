data = xlsread('data.xlsx');
data = rmmissing(data);
[N, p] = size(data);
Y = [data(:,1) ones(N,1)];
Y(:,1) = Y(:,1) - mean(Y(:,1));
Y(:,1) = Y(:,1) / std(Y(:,1));
f = data(:,4);
f = f - mean(f);
f = f / std(f);
w = inv(Y'*Y)*Y'*f;
fh = Y*w;
plot(f,fh,'r.')