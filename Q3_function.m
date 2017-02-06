function [f]= Q3_function(S)
sum = 0;        % sum of samples
N = zeros(1,S);
for i = 1:S
    while sum<=4
        sum = sum+rand();
        N(i) = N(i)+1;
    end
    sum = 0;
end
disp(['E[N] = ', num2str(mean(N))]);
f=N;