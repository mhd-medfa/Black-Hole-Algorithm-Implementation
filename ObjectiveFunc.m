function Z = ObjectiveFunc(V)
Z1 = sum(V.^2,2);
Z2 = V(:,1).^2 + (10^6)*sum(V(:,2:end).^2,2);
Z3 = Z1 + Z2 + 5;
Z4 = Z1./Z2;
% Choose an Objective Function
Z = -Z2;
end