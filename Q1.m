N = 10000;                 % N Experiment times
S = 0;                  % Success times
A = randperm(125,6)     % Generate 6 Defective units without replacement
for i = 1:N
    B = randperm(125,5);        % Test 5 microchips
    if isempty(intersect(A,B))  % if none of 5 is member of 6 defective
        S=S+1;
    end
end
P=(N-S)/N
