function auc = ROC(map,result,color)
% Calculate the AUC value of result.
% INPUTS:
%   - result:  detection map (rows by columns);
%   - map:     groundtruth (rows by columns);
%   - display: display the ROC curve if display==1.
% OUTPUT:
%   - auc:     AUC values of 'y'.

    [M,N]=size(map);
    p_f=zeros(M*N,1);                    % false alarm rate
    p_d=zeros(M*N,1);                    % detection probability
    [~,ind]=sort(result(:),'descend');
    res=zeros(M*N,1);
    map=reshape(map,M*N,1);
    N_anomaly=sum(map);
    N_pixel=M*N;
    N_miss=0;
    Threshold = [];
    for i=1:M*N                          % calculate pixel by pixel
        res(ind(i))=1;                       
        Threshold = [Threshold,result(ind(i))];
        N_detected=res'*map;
        if map(ind(i))==0
            N_miss=N_miss+1;
        end
        p_f(i)=N_miss/(N_pixel-N_anomaly);
        p_d(i)=N_detected/N_anomaly;
    end
    auc=trapz(p_f,p_d);                  % calculate the AUC value
    

    
        plot(p_f,p_d, 'color', color  , 'LineWidth', 3); grid on
        axis([10^(-5) 1 0 1])

set(gca,'FontName','Times New Roman','FontWeight','bold','FontSize',10);grid on; box on;
set(gcf,'color','w');
  
    
    
end