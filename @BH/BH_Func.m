function [blackHole, bestSolution, blackHoleCost, allBestCost] = BH_Func(blackHole)
%% Initialization
% Initialize a population of stars with random locations in the search space
locationOfStars = repmat(blackHole.varMin ,blackHole.numOfStars,1)...
    + repmat(blackHole.varMax - blackHole.varMin ,blackHole.numOfStars,1).*rand(blackHole.numOfStars,blackHole.nVar);
% Array to hold Best Cost Value on each Iteration
allBestCost = zeros(blackHole.maxIter,1);
%% Main Loop of BH
for iter = 1:blackHole.maxIter
    
    % Evaluation
    starsCost = ObjectiveFunc(locationOfStars);
    
    % Selection the Best Star that has the best fitness value as the Black Hole
    [blackHoleCost, BH_ind] = max(starsCost);
    
    % Change the location of each star and compute new fitness values
    locationOfStars = locationOfStars +  (repmat(locationOfStars(BH_ind),blackHole.numOfStars,blackHole.nVar) - locationOfStars)...
        .*unifrnd(0,1,blackHole.numOfStars,blackHole.nVar);
    starsCost = ObjectiveFunc(locationOfStars);
    
    % If there is a star reaches a location with lower cost than the black hole, exchange their locations
    if blackHoleCost < max(starsCost)
        [blackHoleCost, BH_ind] = max(starsCost);
    end
    % store the best cost value
    allBestCost(iter) = blackHoleCost;
    if iter<blackHole.maxIter
        % Compute the Radius of the Event Horizon of the Black Hole
        R = blackHoleCost / sum(starsCost);
        distances = (sqrt(sum(locationOfStars-repmat(locationOfStars(BH_ind),blackHole.numOfStars,blackHole.nVar),2).^2))';
        crosserStarsInd = find(distances<R);
        if length(crosserStarsInd)>0
            for i=1:length(crosserStarsInd)
                locationOfStars(crosserStarsInd(i),:) = unifrnd(0,1,blackHole.nVar,1);
            end
        end
    end
end
bestSolution = locationOfStars(BH_ind,:);
disp(['BH_index is' num2str(BH_ind)]);
end