 
PHOW_Sizes = [4 8 10]; % Multi-resolution, these values determine the scale of each layer.
PHOW_Step = 8; % The lower the denser. Select from {2,4,8,16}
 
I =  imread('./Caltech_101/101_ObjectCategories/umbrella/image_0007.jpg' );
imshow(I)

h = vl_phow(single(I),'Sizes',PHOW_Sizes,'Step',PHOW_Step);


foo =  knnsearch(  indx', cell2mat(desc_tr)');

for i = 1:max(foo)
   tally(i) =  sum(foo == i);
end
bar(tally)