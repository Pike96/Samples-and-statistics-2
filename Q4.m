clear;

syms n
a = double(1/(symsum(1/n,n,1,60)));     % Constant p

E = 10000;          % Experiment times
X = zeros(1,E);
for i = 1:E
    u = rand();     % Random number from 0 to 1
    j = 0;
    f = 0;          % cdf
    while u>=f
        j = j+1;
        f = f + a/j;    % pmf is a/j
    end
    X(i) = j;       % Xk
end
subplot(2,1,1)
hist(X,120);
title(['Xk histogram with experiment times ',...
    num2str(E)])
xlabel('Xk')
ylabel('Times')

N = [];
for k = 1:E
    i = 1;
    j = 0;
    while j ~= 60
        u = rand();     % Random number from 0 to 1
        j = 0;
        f = 0;          % cdf
        while u>=f
            j = j+1;
            f = f + a/j;    % pmf is a/j
        end
        i = i+1;
    end
    N = [N i];
end
subplot(2,1,2)
hist(N,100);
title(['N60 histogram with experiment times ',...
    num2str(E)])
xlabel('N60')
ylabel('Times')

disp(['E[N60] = ', num2str(mean(N))]);
disp(['Var[N60] = ', num2str(var(N))]);