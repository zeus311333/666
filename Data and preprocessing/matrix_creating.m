function [purchase_matrix , user_list , item_list] = matrix_creating(list)
%MATRIX_CREATIING Generate the user-item purchase matrix.
% input
% list: The original interaction data, which is the Sheet 1 of 
% "steam-200k.xlsx".
% output
% purchase_matrix: The user-item interaction matrix sorted in descending 
% order, according to both user and item purchase count.
% user_list: List of user ID.
% item_list: List of item name.

user_list = [];   %initialize user list;
item_list = [];   %initialize item list;

for k = 1 : size(list , 1)
    x = list(k , :);   %the k-th row of the list;
    %update user list;
    if size(find(strcmp(x(1) , user_list)) , 1) == 0
        user_list = [user_list ; x(1)];
    end
    %update item list;
    if size(find(strcmp(x(2) , item_list)) , 1) == 0
        item_list = [item_list ; x(2)];
    end
end
%generate purchase matrix;
purchase_matrix = zeros(size(user_list , 1) , size(item_list , 1));
for k = 1 : size(list , 1)
    x = list(k , :);   %the k-th row of the list;
    a = find(strcmp(x(1) , user_list));
    b = find(strcmp(x(2) , item_list));
    purchase_matrix(a , b) = 1;
end
%user sorting (descending by purchase count);
sort_matrix = 0 * purchase_matrix;
user_list01 = user_list;
[~ , index01] = sort(sum(purchase_matrix , 2) , 'descend');
for i = 1 : size(purchase_matrix , 1)
    sort_matrix(i , :) = purchase_matrix(index01(i) , :);
    user_list01(i) = user_list(index01(i));
end
purchase_matrix = sort_matrix;
user_list = user_list01;
%item sorting (descending by purchase count);
sort_matrix = 0 * purchase_matrix;
item_list01 = item_list;
[~ , index02] = sort(sum(purchase_matrix , 1) , 'descend');
for j = 1 : size(purchase_matrix , 2)
    sort_matrix(: , j) = purchase_matrix(: , index02(j));
    item_list01(j) = item_list(index02(j));
end
purchase_matrix = sort_matrix;
item_list = item_list01;

