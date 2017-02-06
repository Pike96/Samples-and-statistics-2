clear;
% ===== Bernoulli Trail =====
E = 10000;          % Experiment times
Results1 = zeros(1,E);
for i = 1:E
    lambda = 120;           % Expected value is 120
    interval = 0.2;         % in seconds
    N = 3600/interval;      % Get the interval numbers
    p = lambda/N;           % Bernoulli prob.
    u = rand(N,1);          % Random number from 0 to 1
    bernoulliTrials = u<p;  % If smaller than prob. Success
    Results1(i) = sum(bernoulliTrials);  % Poisson(120)
end

subplot(2,1,1)
yyaxis left             
hist(Results1,20)    % Set the number of bins to 20 in histogram
title(['Number of arrivals per hour with experiment times ',...
    num2str(E)])
xlabel('Number of arrivals')
ylabel('Times')

Range = 200;        % Plot the curve within 120 arrivals
Theo = zeros(1,Range);
for i = 1:Range
    p = poisspdf(i-1,120);	% i-1 to get the prob. at 0 (trival)
    Theo(i) = p;
end

yyaxis right
plot(Theo,'r','linewidth',2)    % Bold, Red
ylabel('Theorectical p.m.f.')
set(gca,'YColor','r')           % Y Axis red

% ===== Inverse Transfrom =====
Results2 = zeros(1,E);
for i = 1:E
    lambda = 120;           % Expected value is 120
    u = rand();             % Random number from 0 to 1
    k = 0;                  % P(X=k)
    p = exp(-lambda);       % pmf, when k=0
    f = p;                  % cdf
    while u>=f
        p = lambda*p/(k+1);
        f = f+p;
        k = k+1;
    end
    Results2(i) = k;
end

subplot(2,1,2)
yyaxis left
hist(Results2,20)    % Set the number of bins to 20 in histogram
title(['Number of arrivals per hour with experiment times ',...
    num2str(E)])
xlabel('Number of arrivals')
ylabel('Times')

Range = 200;        % Plot the curve within 120 arrivals
Theo = zeros(1,Range);
for i = 1:Range
    p = poisspdf(i-1,120);	% i-1 to get the prob. at 0 (trival)
    Theo(i) = p;
end

yyaxis right
plot(Theo,'r','linewidth',2)    % Bold, Red
ylabel('Theorectical p.m.f.')
set(gca,'YColor','r')           % Y Axis red
