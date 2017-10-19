
function Feat_Index =  Binary_Genetic_Algorithm_original(X1,Y1)
% Written by BABATUNDE Oluleye H, PhD Student

% Address: eAgriculture Research Group, School of Computer and Security
% Science, Edith Cowan University, Mt Lawley, 6050, WA, Australia
% Date:  2013
% Please cite any of the article below (if you use the code), thank you

%  "BABATUNDE Oluleye, ARMSTRONG Leisa J, LENG Jinsong and DIEPEVEEN Dean (2014). 
%  Zernike Moments and Genetic Algorithm: Tutorial and APPLICATION. 
%  British Journal of Mathematics & Computer Science. 
%  4(15):2217-2236."

%%% OR
%BABATUNDE, Oluleye and ARMSTRONG, Leisa and LENG, Jinsong and DIEPEVEEN (2014).
% A Genetic Algorithm-Based Feature Selection. International Journal 
%of Electronics Communication and Computer Engineering: 5(4);889--905.

% DataSet here
%Ionosphere dataset from the UCI machine learning repository:                   
%http://archive.ics.uci.edu/ml/datasets/Ionosphere                              
%X is a 351x34 real-valued matrix of predictors. Y is a categorical response:   
%"b" for bad radar returns and "g" for good radar returns.                      

% NOTE: You can run this code directory on your PC as the dataset is
% available in MATLAB software

global a b
a=X1;
b=Y1;
% load ionosphere.mat  % This contains X (Features field) and Y (Class Information)
% This is available in Mathworks
GenomeLength =9; % This is the number of features in the dataset
tournamentSize = 2;
%options= gaoptimset(@PopFunction);
% options = gaoptimset('CreationFcn', {@PopFunction},...
%                      'PopulationSize',50,...
%                      'Generations',100,...
%                      'PopulationType', 'bitstring',... 
%                      'SelectionFcn',{@selectiontournament,tournamentSize},...
%                      'MutationFcn',{@mutationuniform, 0.1},...
%                      'CrossoverFcn', {@crossoverarithmetic,0.8},...
%                      'EliteCount',2,...
%                      'StallGenLimit',100,...
%                      'PlotFcns',{@gaplotbestf},...  
%                      'Display', 'iter'); 
rand('seed',1)
nVars = 9; % 
FitnessFcn = @FitFunc_KNN; 
chromosome = ga(FitnessFcn,nVars);
Best_chromosome = chromosome; % Best Chromosome
Feat_Index = find(Best_chromosome==1); % Index of Chromosome
end

%%% POPULATION FUNCTION
function [pop] = PopFunction(GenomeLength,~,options)
RD = rand;  
pop = (rand(options.PopulationSize, GenomeLength)> RD); % Initial Population
end

%%% FITNESS FUNCTION   You may design your own fitness function here
function [FitVal] = FitFunc_KNN(pop)
global a b
FeatIndex = find(pop==1); %Feature Index
a1 = a;% Features Set
b1 = grp2idx(b);% Class Information
a1 = a1(:,[FeatIndex]);

NumFeat = numel(FeatIndex);
Compute = ClassificationKNN.fit(a1,b1,'NSMethod','exhaustive','Distance','euclidean'); 
Compute.NumNeighbors = 3; % kNN = 3
FitVal = resubLoss(Compute)/(9-NumFeat);
end

