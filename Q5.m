p = [6 6 6 6 6 15 13 14 15 13]/100;
N = 10000;
q = 0.05;
c = max(p/q)
acc = 0; rej = 0;
for i = 1:N, k = 0;
    while 1, k = k + 1;
    	j = 1 + floor(20*rand);   % Get Uniform j
        if j <= 10
            if (c*rand) < p(j)/0.05  % Accept p(j) if U<p(j)/c, q(j)= 0.1
                acc = acc+1; X(i) = j; C(i) = k; 
                break
            else rej = rej+1;
            end
        else rej = rej+1;
        end
    end
end
% Check mean X and C
disp([ mean(X) sum(p.*[1:10]) mean(C) 1/c acc/(acc+rej)])