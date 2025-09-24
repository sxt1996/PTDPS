function  [result_2D] = PTDPS(X_cube)
% paper:¡¶Non-parametric Hyperspectral Anomaly Detection via Topological Disassembly Guided Pixel-level Self-information¡·
% Input:
% X_cube£ºan HSI being processed;  
% Output:
% result: detection results


 
[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;
X_use = reshape(X_cube,pixel_num,band_num);
X = X_use.'; 
clear('X_cube', 'X_use');
e  = round(band_num/2);


%%  construction of parallel topological spaces
chessboard_card1 = [];
chessboard_cenvalue1 = [];
for i = 1:band_num
    X_dim = X(i,:);    
    [chessboard_i, X_dim_cen_i] = hist(X_dim, e);    
    chessboard_card1 = [chessboard_card1; chessboard_i];
    chessboard_cenvalue1 = [chessboard_cenvalue1; X_dim_cen_i];
end

card_max = max(chessboard_card1,[],2);
  
%% perform anomaly detection

weight = zeros(1, pixel_num);
result_max = zeros(1, pixel_num);
self_information = zeros(1, pixel_num);


for i = 1:pixel_num
    x = X(:,i);      
    x_card_set = [];
    x_index_set = [];
    SI_x = [];

    
    for j = 1:band_num    
        a = x(j);
        chessboard_card_j = chessboard_card1(j,:);
        [x_max_j_cardinality,index_max] = max(chessboard_card_j);
        X_dim_cen_j = chessboard_cenvalue1(j,:);
               
        
        [~, index] = min(abs(X_dim_cen_j(:) - a));
        x_index_set = [x_index_set, index];
        x_j_cardinality = chessboard_card1(j, index);
        if x_j_cardinality == 0
            x_j_cardinality=1;
        end 
        x_card_set = [x_card_set; x_j_cardinality];
        probability_x_j = x_j_cardinality/pixel_num;
        SI_x_j = - log2(probability_x_j);
        SI_x = [SI_x ; SI_x_j];   
        
    end

     self_information(i) = mean(SI_x);


     card_max_x = card_max./x_card_set;   %the deviation of testing pixels relative to large and dense populations
     
     weight(i) = mean(card_max_x(:));

end   
 


result = self_information .* weight;
r_255 = get_255(result);   
result_2D = reshape(r_255, samples, lines);   

end



