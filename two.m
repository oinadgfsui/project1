%% se = 4 * sqrt(p_hat*(1-p_hat)/n)
close;
clc;
clear;

% Digits of accuracy we want (2, 3, 4 digits of pi)
digits = [2 3 4];

% Limits for the error margin at each digit level
limits = [0.05 0.005 0.0005];

% z value for 95% confidence (from statistics, about 1.96)
z = 1.96;

% fix random seed
rng(1);

% Counters
n = 0;        % number of random points
hits = 0;     % how many points fall inside the circle
index = 1;    % which digit level are checking

tic; % start the timer

% Keep going until we reach all target digit levels
while index <= length(digits)
    % Make two random numbers between 0 and 1
    x = rand;
    y = rand;
    n = n + 1;  % increase sample count
    
    % Check if point (x,y) is inside the quarter circle
    if x^2 + y^2 <= 1
        hits = hits + 1;
    end

    % Estimate of probability that a point is inside
    p_hat = hits / n;
    
    % Estimate of pi from this probability
    pi_hat = 4 * p_hat;
    
    % Standard error of our estimate
    se = 4 * sqrt(p_hat * (1 - p_hat) / n);
    
    % Half-width of confidence interval
    halfWidth = z * se;

    % Only continue if we have at least one hit and one miss or it won't
    % converge due to se = 0
    % Also check if it has reached the accuracy limit
    if hits > 0 && hits < n && halfWidth <= limits(index)
        elapsed = toc; % time since tic for current digit accuracy
        fprintf(['Reached %d digits: samples=%d, pi estimate=%.6f, ', ...
                 'halfWidth=%.6f (limit=%.6f), time=%.3f s\n'], ...
                 digits(index), n, pi_hat, halfWidth, limits(index), elapsed);
        index = index + 1; % To the next digit goal
    end
end
