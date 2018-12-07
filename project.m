%%%%%%%%%%%%%%%%%% Dushan Eranga %%%%%%%%%%%%%%%%%%%
clear
clc

im=imread('4.jpg'); %load the` image from the directery
im = imcrop(im,[50 10 581 346]); %crop outer boader to remove unnessasary noises
figure(1);subplot(3,3,1);imshow(im);title('original image');    
Ibw=im2bw(im,0.35); %convert the image to a binary image

Ibw = imcomplement(Ibw) %get compliment of the binary image 
Ibw = medfilt2(Ibw);    %filter the noise
Ibw = imfill(Ibw,'holes');  %fill uncomplete holes of the binary complimented image
figure(1);subplot(3,3,2);imshow(Ibw);title('imfill image'); 

    se1 = strel('disk',35); %create morphological structuring element of disk shape
    Irde = imerode(Ibw,se1);    %erade the image withthe created morphological element
    figure(1);subplot(3,3,3);imshow(Irde);title('imerode image');   
    
    se2 = strel('disk',50); %create morphological structuring element of disk shape
    Idlt = imdilate(Irde,se2);    %dilate the eroded image
    figure(1);subplot(3,3,4);imshow(Idlt);title('imdilate image');
    
    Isub = imsubtract(Ibw,Idlt);    %subtract the Ibw from Idlt image to get only the fingers
    se3 = strel('disk',7);
    Irde2 = imerode(Isub,se3);  %enhance the subtracted image to get rid of small noises
    figure(1);subplot(3,3,5);imshow(Irde2);title('imsubtract image');

Irde2=im2bw(Irde2); %convert the subtracted image again to the binaary of 0 & 1 (the subtracted image gives a b&w image of consisting -1 and this is leading to error object counting)

[L,N]=bwlabel(Irde2,4); %counting objects
imtool(Irde2)
%imtool(Irde2)
N

if N==1
    fprintf('You showed number 1');
elseif N==2
    fprintf('You showed number 2');
elseif N==3
    fprintf('You showed number 3');
elseif N==4
    fprintf('You showed number 4');
elseif N==5
    fprintf('You showed number 5');
else
    fprintf('Try again');
end