clear;

N = 10000;              % N Experiment times
S = 0;                  % Success times
A = randperm(125,6);	% Generate 6 Defective units without replacement
for i = 1:N
    B = randperm(125,5);        % Test 5 microchips
    if isempty(intersect(A,B))  % if none of 5 is 1of 6 defective
        S=S+1;
    end
end
disp(['The probability of rejecting the lot is ', num2str((N-S)/N)]);

test = 0;
while N-S <= ceil(0.95*N)   % Until reach 95% rejecting
    S=0;	% clear success times
    test = test+1;	% Add 
    for i = 1:N
        B = randperm(125,test);     % Test microchips w/ increasing num
        if isempty(intersect(A,B))	% if none of 5 is 1 of 6 defective
            S=S+1;
        end
    end
end
disp(['The fewest number is ', num2str(test)]);

