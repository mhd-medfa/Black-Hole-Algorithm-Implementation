%This Code has been written with MATLAB R2016a
%Author: MOHAMAD AL MDFAA
%Contact me: Mohamad.AlMdfaa@Yahoo.com

classdef BH
	properties

		% Problem Definition
		nVar;          % Number of input variables
        varMin;        % Lower Bound of input variables
        varMax;        % Upper Bound of input variables

        % Parameters of BH
        numOfStars; % number of stars (candidate solutions)
        maxIter;    % Maximum number of Iterations
    end

    methods
	    function blackHole = BH(numOfVar, lowerBound, higherBound, numOfStars,maxIter)
	    	blackHole.nVar = numOfVar;
	    	blackHole.varMin = lowerBound;
	    	blackHole.varMax = higherBound;
	    	blackHole.numOfStars = numOfStars;
            blackHole.maxIter = maxIter;
	    end

	    [blackHole, bestSolution, bestCost, allBestCost] = BH_Function(blackHole)

	    Y = ObjectiveFunction(V);
	end
end