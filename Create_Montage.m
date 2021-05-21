%% CREATE MONTAGE OF IMAGES %%

folder='A';
im_name='19.19 if.jpg';

[stats_A1]=Main_Cell_Morphology(folder,im_name);





%%%%%%%%%%%%%%%%%%
%% Low Confluency %%
%
multi_name={'1 out.jpg','2 out.jpg','3 out.jpg','4 out.jpg','5 out.jpg'};
multi_nameBW={'1 outBW.jpg','2 outBW.jpg','3 outBW.jpg','4 outBW.jpg','5 outBW.jpg'};
montage(multi_name,'Size', [5 1])
montage(multi_nameBW,'Size', [5 1])

%% High Confluency 

multi_name={'19.14 out.jpg','19.15 out.jpg','19.16 out.jpg','19.17 out.jpg','19.18 out.jpg','19.19 out.jpg'};
multi_nameBW={'19.14 outBW.jpg','19.15 outBW.jpg','19.16 outBW.jpg','19.17 outBW.jpg','19.18 outBW.jpg','19.19 outBW.jpg'};
montage(multi_name,'Size', [6 1])
montage(multi_nameBW,'Size', [6 1])

%% ANOTHER WAY IF THE FIRST DOESNT WORK 
folder='PBS';
file_name1 = fullfile(folder,'19.14 out.jpg');
file_name2 = fullfile(folder,'19.15 out.jpg');
file_name3 = fullfile(folder,'19.16 out.jpg');
file_name4 = fullfile(folder,'19.17 out.jpg');
file_name5 = fullfile(folder,'19.18 out.jpg');
file_name6 = fullfile(folder,'19.19 out.jpg');

subplot(6,1,1)
imshow(imread(file_name1))
subplot(6,1,2)
imshow(imread(file_name2))
subplot(6,1,3)
imshow(imread(file_name3))
subplot(6,1,4)
imshow(imread(file_name4))
subplot(6,1,5)
imshow(imread(file_name5))
subplot(6,1,6)
imshow(imread(file_name6))


