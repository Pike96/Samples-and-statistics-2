clear;

E = 10000;
Results = zeros(1,E);
for i = 1:E
    lambda = 120;
    interval = 0.2;             % in seconds
    N = 3600/interval;
    p = lambda/N;
    u = rand(N,1);
    bernoulliTrials = u<p;
    x = sum(bernoulliTrials);   % Poisson(120)
    Results(i) = x;
end

hist(Results,20)
