clear all;  
clc; 
close all

%% read the HSI data being processed

a = dir;   
filename_path = a.folder;     
filename_path = strcat(filename_path,'\');
name_HSI = 'AVIRIS_WTC';     
filename = strcat(filename_path,name_HSI,'.mat');
load(filename);

X_cube = data;
clear('data');
[samples,lines,band_num]=size(X_cube);
pixel_num = samples * lines;

gt = map;
clear('map');

%% Perform anomaly detection with PTDPS
r_PTDPS = PTDPS(X_cube);

%% illustrate detection results
figure;
subplot(121), imagesc(gt); axis image;   title('Ground Truth')     
subplot(122), imagesc(r_PTDPS); axis image;   title('Detection map of PTDPS')    

%% evaluate detection results with ROC
 
r_255 = squeeze(r_PTDPS(:));
figure;
AUC = ROC(gt,r_255,'r')    
