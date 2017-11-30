
%% EE 308 Assignment - Llyod max quantizer 
% Used the iterative convergence method. First randomly initialized
% thresholds, and using the expressions for the interval limits in the
% sample space, we can then calculate interval limits. On iterating this
% procedure, and checking convergence on the difference betwee v(t-1) and
% v(t) threshold vectors, we can find the most optimal set of the intervals
% and corresponding thresholds. 
% Below is described the llyod max quantizer function written in matlab.
% The function file will be called in the mainscript file, and convergence
% of the threshold values is plotted as an error function. 



%% Inputs to the function  
% The function can be called as follows -: 
% llyod_max(levels,max_l,min_l,mu,sigma); 
% Here max_l and min_l are the maximum and minimum values amongst
% the values that we need to quantize. Since we have assumed a gaussian pdf
% as specified in the question, we are taking only mu and sigma as the
% parametres and constructing the pdf in the function. 
% Giving default values to the parameters for executing -: 

levels=6;
max_l = inf;
min_l = -inf;
mu = 0; 
sigma = 2;

[v,m,x,er] = llyod_max(levels,max_l,min_l,mu,sigma);

% The values of the threshold v and the interval limits m are as follows-:

disp('Thresholds');
disp(v);
disp('Interval Boundaries');
disp(m);

%% Plot of error vs number of iterations
    % Number of iterations on x-axis and error on y-axis 
    figure
    plot(x,er);
    
%% Conclusion
    % Hence we see that the quantizer converges efficiently. 
    