# Local Collaborative Filtering
Local Collaborative Filtering
This experiment is conducted for the paper "Local Collaborative Filtering: A Collaborative Filtering Method that Utilizes Local Similarities among Users", where the method is referred to as LCF.

The experimental data originates from a dataset concerning Steam (https://www.kaggle.com/datasets/tamber/steam-video-games/data), and the code is based on Matlab.

Operating Steps:

Folder "Data and preprocessing": Using the function "matrix_creating.m", generate "purchase_matrix.mat", "user_list.mat", and "item_list.mat" based on the original data "steam200k.xlsx".

Folder "correlation coefficient": Using the function"correlation_coefficient_matrix_creating.m", generate correlation_coefficient_matrix "R.mat". Corresponding to Section 3.2.1 of the article.

Folder "Stability of correlation coefficient": Using the function"calculate_MAE.m", assess the stability of item CTR. Corresponding to Section 3.2.2 of the article.

Folder "Effect of personalization coefficient": First, use the function"subsets_creating.m" to generate the subsets. Then conduct cross-experiments based on the subsets and the function "HR_k_fold.m". Corresponding to Section 3.3 of the article.
