% Simple Random Forest Toolbox for Matlab
% written by Mang Shao and Tae-Kyun Kim, June 20, 2014.
% updated by Tae-Kyun Kim, Feb 09, 2017

% This is a guideline script of simple-RF toolbox.
% The codes are made for educational purposes only.
% Some parts are inspired by Karpathy's RF Toolbox

% Under BSD Licence
clear all; clc;
% % Initialisation
% init;
% 
% % Select dataset
% [data_train, data_test] = getData('Toy_Spiral'); % {'Toy_Gaussian', 'Toy_Spiral', 'Toy_Circle', 'Caltech'}
% 
% 
% %%%%%%%%%%%%%
% % check the training and testing data
%     % data_train(:,1:2) : [num_data x dim] Training 2D vectors
%     % data_train(:,3) : [num_data x 1] Labels of training data, {1,2,3}
%     
% plot_toydata(data_train);
% 
%     % data_test(:,1:2) : [num_data x dim] Testing 2D vectors, 2D points in the
%     % uniform dense grid within the range of [-1.5, 1.5]
%     % data_train(:,3) : N/A
%     
% scatter(data_test(:,1),data_test(:,2),'.b');

%% Bagging

% N = 1:size(data_train,1); 
% NumSamples =  150;
% R = 1; %replacement
% 
% for i = 1:4
%     % Randsample (N, num of sample, replacement)
%     rand_index =  randsample(N, NumSamples,R)';
%     data_set{:,i}=data_train(rand_index,:);
%     subplot(2,2,i)
%     plot_toydata(data_set{i});
%     %calculating uniqueness 
%     u = length(unique(data_set{i}, 'rows' ))/length(data_set{i})*100;   
%     title(['Data Set: ', num2str(i), ', Uniqueness: ' ,num2str(u),'%' ]) 
%     
%     %calculating prob distribution of classes in each bag
%     temp_bag = cell2mat(data_set(i));
%     class1 = sum( temp_bag(:,3) == 1); class2 = sum( temp_bag(:,3) == 2);
%     class3 = sum( temp_bag(:,3) == 3); total = class1 + class2 + class3;
%     prob_distr(i,:) = [class1/total class2/total class3/total];
% end


%% Split Node

% Set the random forest parameters for instance, 
% figure; 
% param.num = 10;         % Number of trees
% param.depth = 5;        % trees depth
%for s = 1:50
%     param.splitNum = 15;     % Number of split functions to try
%     param.weakLearner = 'axis-aligned'; %weak  learner function
%     param.split = 'IG'; % Currently support 'information gain' only
%     
%     param.num = 2;         % Number of trees
%     param.depth = 70;        % trees depth     
    
    %node.idx = [1:NumSamples]';    %data (index only) which split into this node
%     node.idx = rand_index;
    % node.t =        %threshold of split function
    % node.dim =       %feature dimension of split function
    % node.prob =      %class distribution of data in this node
    % node.leaf_idx=    %leaf node index (empty if it is not a leaf node) 
    % 
    %data = cell2mat(data_set(1));

    %data = cell2mat(data_set(4)); 
    
%     data = data_train; 
%     [node,nodeL,nodeR,ig_best] = splitNode(data,node,param);

%  subplot(4,1,1)
% figure;
%    i = 1;
%   for o =   ["axis-aligned" ,"linear","quad-features", "cube-features"]  
%     param.weakLearner = o;
%     subplot(4,1,i)
%     [node,nodeL,nodeR,ig_best] = splitNode(data,node,param);
%     hold on;
%     i = i+1;
%   end
    
   % ig(s) = ig_best;
%end




% figure;
% plot([1:50],ig)
%%%%%%%%%%%%%%%%%%%%%%
% %% Train Random Forest
% 
% % Grow all trees
%  trees = growTrees(data_train,param);
% 
%  visualise_leaf
%  
% %tree_one
%  
%  for i = 1:(2^param.depth)-1
%      b{i} =  trees(1).node(i).leaf_idx;
%  end
%  b = cell2mat(b)
%  
%  for i = 1:(2^param.depth)-1
%      for j = 1:length(b)
%          if trees(1).node(i).leaf_idx == j
% %                 std_(j) =  std(trees(1).node(i).prob);   
%                s(:,j) = (trees(1).node(i).prob)
%             
%          end
%      end
% 
%  end
% %  
% first_tree = sum(s,2)/size(s,2);
% %tree_two
% 
% 
%  for i = 1:(2^param.depth)-1
%      r{i} =  trees(2).node(i).leaf_idx;
%  end
%  r = cell2mat(r)
%  
%  for i = 1:(2^param.depth)-1
%      for j = 1:length(r)
%          if trees(2).node(i).leaf_idx == j
% %                 std_(j) =  std(trees(1).node(i).prob);   
%                 sy(:,j) = (trees(2).node(i).prob)
%             
%          end
%      end
% 
%  end
%  
% sec_tree = sum(sy,2)/size(sy,2);
% 
% my_result = (first_tree + sec_tree)/3
% %%%%%%%%%%%%%%%%%%%%%%
% % Evaluate/Test Random Forest
% 
% % grab the few data points and evaluate them one by one by the leant RF
% test_point = [-.5 -.7; .4 .3; -.7 .4; .5 -.5];
% for n=1:4
%     leaves = testTrees([test_point(n,:) 0],trees);
%     % average the class distributions of leaf nodes of all trees
%     p_rf = trees(1).prob(leaves,:);
%     p_rf_sum = sum(p_rf)/length(trees);
% end
% 
% 
% % Test on the dense 2D grid data, and visualise the results ... 
% 
% % Change the RF parameter values and evaluate ... 
% 
% 
% 
% 
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% % experiment with Caltech101 dataset for image categorisation
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
init;
% imgSel=[15 15];
% numDescriptors=10e4;
% 
% % If using rf codebook, describe parameters
param.num = 5;         % Number of trees
param.depth = 5;        % trees depth
param.splitNum = 5;     % Number of split functions to try
param.split = 'IG';     % Currently support 'information gain' only
param.weakLearner = 'axis-aligned';
% 
% % Using rf-codebook or k - means
% % rf_codebook=0 : k-means
% % rf_codebook=1 : rf
% rf_codebook=0;
% 
% % If using K-means, define number of bins
% numBins=10;

% Select dataset
% we do bag-of-words technique to convert images to vectors (histogram of codewords)
% Set 'showImg' in getData.m to 0 to stop displaying training and testing images and their feature vectors
[data_train, data_test] = getData('Caltech', param);
%[data_train, data_test, folderName, classList, imgIdx_tr, imgIdx_te] = getData('Caltech',imgSel, numDescriptors, rf_codebook,numBins,param);

close all; 
trees = growTrees(data_train,param);
visualise_leaf

%  leaf classification 
for T = 1:size(trees, 2)   
   for i = 1:size(trees(T).leaf,2)
    c = find(trees(T).leaf(i).prob  ==  max( trees(T).leaf(i).prob));
     trees(T).leaf(i).class = c(1,:);
    
   end
end
    
 label = testTrees_fast(data_test(:,1:end-1),trees) 
c = mode(label,2)';
 




target = zeros(10,150); 
u = 1:15:150;

for j = 1:10  
       if j == 10  
         target ( j , u(j):150) = 1
         break;
    end
    target ( j , u(j):u(j+1) - 1) = 1
  
end

output =  mode(label,2)
final_result = zeros(10,150);
for j = 1:10

    if j == 10
        m =  output(u(j):150 )
        final_result(j , u(j):150 ) = ( m == j)'    
        break;
    end
    
    m =  output(u(j):u(j+1) - 1 )
    final_result(j , u(j):u(j+1) - 1 ) = ( m == j)'
    
end
plotconfusion(target, final_result)


% sos2 fix trees
% num_classes = size(trees(1).prob,2);
% 
% trees(1).prob = [ ones(1,num_classes)./num_classes; trees(1).prob];
% 
% 
%

% Set the random forest parameters ...
% Train Random Forest ...
% Evaluate/Test Random Forest ...
% show accuracy and confusion matrix ...


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% % random forest codebook for Caltech101 image categorisation
% % .....
% 
% 
% 
