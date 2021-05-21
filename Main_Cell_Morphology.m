%%%%%%%%%%%%%%%%%%%%%%%
%%% CELL MORPHOLOGY %%%
%%%%%%%%%%%%%%%%%%%%%%%

function [stats_new_stay]=Main_Cell_Morphology(folder,im_name)


file_name = fullfile(folder,im_name);

Image = (im2double(rgb2gray(imread(file_name)))); %Load Image (GL) 

Image_Strech = histeq(Image,256); % Histogram Equalization
% PLOT 
% figure (1);
% subplot(1,2,1);
% imshow(Image)
% subplot(1,2,2)
% imshow(Image_Strech)
%% 
% % Opening
% seDisk = strel('disk', 4);
% im_open = imopen(Image_Strech,seDisk);
% figure (2), 
% subplot(1,2,1);
% imshow(im_open)
% subplot(1,2,2)


%CANNY Edge Detection
Image_Canny = edge(Image_Strech,'Canny',[0.1 0.4],'Thinning');
% figure(3)
% imshowpair(Image_Strech,Image_Canny, 'montage')


% Dilation - Using lines with different angles
seLine60 = strel('line', 2, 60);
seLine30 = strel('line', 2, 30);
seLine90 = strel('line', 2, 90);
seLine45 = strel('line', 2, 45);
seLine180 = strel('line', 2, 180);
Image_Dilation= imdilate(Image_Canny,[seLine30,seLine60,seLine90,seLine45,seLine180]);
% figure(4); 
% imshowpair(Image_Canny,Image_Dilation, 'montage')

% FILL - Using fill function to fill the cells
Image_Fill= imfill(Image_Dilation,'holes');
% figure(5)
% imshowpair(Image_Dilation,Image_Fill, 'montage')

%Opening
seDisk = strel('disk', 6);
Image_Open = imopen(Image_Fill,seDisk);
% figure (6)
% imshowpair(Image_Fill,Image_Open,'montage')

%% Find Cell Parameters
stats = regionprops(Image_Open,'Area','Centroid','Eccentricity','MajorAxisLength','MinorAxisLength','Perimeter','Orientation','PixelList');

%% 
[len,~]=size(stats);

for i=1:len
    Area_vec(i,1)=stats(i).Area;
end

Mean_Area=mean(Area_vec);
thresh=0.9; % Chosen by trail and Error
Mean_Area_thres=Mean_Area*thresh;

stay=[];
for j=1:len
    if stats(j).Area>Mean_Area_thres
        stay=[stay j];
    end
end 

stats_new_stat=struct();
for k=1:length(stay)
    stats_new_stay(k)=stats(stay(k));
end

for i=1:length(stay)
    centroids(i,1:2)=stats_new_stay(i).Centroid;
end
figure(7);
imshow(Image_Strech)
hold on
plot(centroids(:,1),centroids(:,2), 'r*')
hold off

figure(8)
imshow(Image_Open)
hold on
plot(centroids(:,1),centroids(:,2), 'r*')
hold off  


end



