clear;

N = 1000;              % N Experiment times
S = 0;                  % Success times
A = randperm(125,6);    % Generate 6 Defective units without replacement
for i = 1:N
    B = randperm(125,5);        % Test 5 microchips
    if isempty(intersect(A,B))  % if none of 5 is member of 6 defective
        S=S+1;
    end
end
disp(['The probability of rejecting the lot is ', num2str((N-S)/N)]);

j = 1;
while N-S <= ceil(0.95*N)
    S=0;
    j = j+1;
    for i = 1:N
        B = randperm(125,j);        % Test 5 microchips
        if isempty(intersect(A,B))  % if none of 5 is member of 6 defective
            S=S+1;
        end
    end
end
disp(['The fewest number is ', num2str(j)]);


