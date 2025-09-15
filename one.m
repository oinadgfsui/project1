% Fixed counts Monte Carlo Estimation of Pi
% For each i, generate i random points and time the experiment
clear; clc; close all;

%% Parameters
N_max  = 100000;          % Maximum number of points (too big is very slow)

pi_true = pi;             % The true value of pi from MATLAB

%% Initialization
pi_est  = zeros(N_max,1); % Store estimated pi values
errors  = zeros(N_max,1); % Store the difference from true pi
times   = zeros(N_max,1); % Store the time used for each experiment

%% loop: i = 1 to N_max (for comparision of precision and total counts
% For each i, make i random points and calculate pi
for i = 1:N_max
    tic;                          % Start timer for this experiment
    
    x = rand(i,1);                % Random x values between 0 and 1
    y = rand(i,1);                % Random y values between 0 and 1
    inside = sum(x.^2 + y.^2 <= 1); % Count how many points fall inside circle
    
    pi_est(i) = 4 * inside / i;   % Estimate pi
    errors(i) = abs(pi_est(i) - pi_true); % Error compared to true pi
    
    times(i) = toc;               % Time spent for this experiment
end

%% Plot 1: Estimated pi values (first 1200 experiments)
N_plot1 = 1200;
figure;
scatter(1:N_plot1, pi_est(1:N_plot1), 1, 'b', 'filled'); hold on; % scatter plot of estimates
yline(pi_true, 'r--', 'LineWidth', 1.5);                          % draw true pi as a red dashed line
xlabel('Experiment Index (N)');                                  % x-axis label
ylabel('Estimated \pi');                                         % y-axis label
title(['Convergence of Monte Carlo \pi (first ' num2str(N_plot1) ' experiments)']); % title
legend('Estimate','True \pi','Location','best');                 % add legend
grid on;                                                         % show grid

%% Plot 2: Error curve (first 1500 experiments)
N_plot2 = 1500;
figure;
scatter(1:N_plot2, errors(1:N_plot2), 1, 'k', 'filled');         % scatter plot of errors
xlabel('Experiment Index (N)');                                  % x-axis label
ylabel('Absolute Error | \pi_{est} - \pi |');                    % y-axis label
title(['Deviation from True \pi (first ' num2str(N_plot2) ' experiments)']); % title
grid on;                                                         % show grid

%% Plot 3: Error vs Time (all experiments)
figure;
loglog(times, errors, 'bo', 'MarkerSize', 1, 'MarkerFaceColor','b'); % log-log plot: error vs time
xlabel('Execution Time (s)');                                         % x-axis label
ylabel('Absolute Error');                                             % y-axis label
title('Precision vs Computational Cost (all experiments)');           % title
grid on;                                                              % show grid
