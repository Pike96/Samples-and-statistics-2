p = [6 6 6 6 6 15 13 14 15 13]/100;
E = 1e7;
q = 0.05;
c = max(p/q);
acc = 0; rej = 0;   % Accept and reject counter
for i = 1:E, k = 0;
    while 1, k = k + 1;
    	j = 1 + floor(20*rand);     % Get Uniform j 1 to 20
        if j <= 10          % Drop j>10
            if (c*rand) < p(j)/0.05	% Accept p(j) if U<p(j)/c, q(j)= 0.05
                acc = acc+1; X(i) = j; C(i) = k; 
                break
            else rej = rej+1;	% Reject when cu>pv/qv
            end
        else rej = rej+1;   % Reject when j>10
        end
    end
end

yyaxis left
Histcount = hist(X,1:10);   % Get the number of histogram 
hist(X,1:10)
ylim([0 max(Histcount)])    % Uniform the y axis using ylim
title(['Xi histogram with experiment times ',...
    num2str(E)])
xlabel('i')
ylabel('Times')

yyaxis right
plot(p,'r','linewidth',2)   % Bold, Red
ylim([0 max(Histcount)/E])  % Uniform the y axis using ylim
ylabel('Theorectical p.m.f.')
set(gca,'YColor','r')           % Y Axis red

disp(['c = ', num2str(c)])
disp(['Sample mean = ', num2str(mean(X)),... 
    '       Theoretical mean = ', num2str(sum(p.*(1:10)))]) % E(x)
disp(['Sample var = ', num2str(var(X)),...
    '        Theoretical var = ',...
    num2str(sum(p.*(1:10).^2)-(sum(p.*(1:10)))^2)]) % E(x^2)-E(x)^2
disp(['Efficiency = ', num2str(acc/(acc+rej)),... 
    '       Theoretical efficiency = ', num2str(1/c)])  % 1/c
