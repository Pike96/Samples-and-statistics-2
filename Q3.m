clear;

subplot(3,1,1)
hist(Q3_function(100))
title('N = 100')
xlabel('Number of samples')
ylabel('Times')

subplot(3,1,2)
hist(Q3_function(1000))
title('N = 1000')
xlabel('Number of samples')
ylabel('Times')

subplot(3,1,3)
hist(Q3_function(10000))
title('N = 10000')
xlabel('Number of samples')
ylabel('Times')
