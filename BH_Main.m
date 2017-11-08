clc;
clear all;
close all;

%% Problem Definitoion
rng(5);
numberOfVariable = 10;          % Number of input variables
lowerBound = -10*ones(1,10);          % Lower Bound of input variables
higherBound = 10*ones(1,10);         % Higher Bound of input variables

%% Parameter of BH
numberOfStars = 100; %Number Of Stars
maxIter = 500; %Maximum Number of Iteration

%% Calling
blackHole = BH(numberOfVariable, lowerBound, higherBound, numberOfStars,maxIter);
[blackHole, bestSolution, bestCost, allBestCost] = BH_Func(blackHole);

%% Results
disp(['BestSolution is: ' num2str(bestSolution)]);
disp(['BestCost is: ' num2str(bestCost)]);
h=figure(1);

semilogx(1:maxIter, allBestCost, 'LineWidth', 2);
title('ObjFunc 2 & Seed 5','FontSize',16);
legend('All Best Costs');
xlabel('Iteration');
ylabel('Best Cost');
grid on;
%saveas(h,'f2seed5optional2', 'png');

pause(0.01)