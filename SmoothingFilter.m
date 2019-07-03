%John Hampton
%Image Processing
%Smoothing Filter Example

clear;
figure;
inimage=imread('wizardofoznoisesquare.pgm');  %read input image

imshow(inimage);    %show input image
inimage = double(inimage)/255; %convert to double
[row,col] = size(inimage);  %get size of image

filter = 1/9; %1/9 for 3x3, 1/25 for 5x5, 1/49 for 7x7
step = 1; %1 for 3x3, 2 for 5x5, 3 for 7x7;
outimage = zeros(row,col);  %create black image with specified size

outimage = double(outimage)/255;     %convert to double

%loop through every pixel,except border pixels
for y = step + 1:1:row-step
    
    for x= step + 1:1:col-step
            %apply filter
            outimage(y,x)=sum(sum(inimage(y-step:y+step,x-step:x+step))) * filter; 
            
    end
    
end
figure;
imshow(outimage);   %show output image
imwrite(outimage,'WizardSmooth3.png');