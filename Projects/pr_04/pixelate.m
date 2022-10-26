function colr = pixelate(A,lc,rc,tr,br,n)
% "Pixelate" a rectangular section of an image. Each block of the pixelated
% area has the "average color" of the block.  Assume an image is displayed
% in the figure window with hold on.
%
% A:  RGB data of the image, a 3-d uint8 array.
% lc: Leftmost column index of user-selected area for pixelation
% rc: rightmost column index of user-selected area for pixelation
% tr: topmost row index of user-selected area for pixelation
% br: bottommost row index of user-selected area for pixelation
% n:  Block size, i.e., each block is n-by-n pixels (n rows by n cols).
%     n is a positive integer value.
%      
% The actual area to be pixelated should be trimmed such that its number of 
%   rows and number of columns of pixels are each a multiple of n, starting 
%   from the top left corner (crop the right and bottom).  Then the number
%   of rows of blocks (nrb) and the number of columns of blocks (ncb) are
%   each an integer. If either nrb or ncb is less than 5, do not pixelate 
%   and stop program execution with the error message 
%   'Use smaller block size (n) or select larger area'
% 
% If pixelation can be done, then colr is the nrb-by-ncb-by-3 array storing
% the RGB color of the nrb*ncb blocks in the pixelation.  Each value in 
% colr is of type double in the range of 0 to 1.
%   colr(i,j,1) stores the average red intensity of the pixels in block i,j
%   colr(i,j,2) stores the average green intensity of the pixels in block i,j
%   colr(i,j,3) stores the average blue intensity of the pixels in block i,j
%
% Call DrawRectNoBorder to draw the pixelation on the image. 

lc 
rc 
tr 
br 
n
close all
figure
hold on
if floor((rc-(lc-1))/n)<5 || floor((br-(tr-1))/n)<5
    error('Use smaller block size (n) or select larger area')
end

% A(i*n:(i+1)*n j*n:(j+1)*n 1:3);

lc=lc-rem((rc-(lc-1)),n);
br=br-rem((br-(tr-1)),n);

nrb=(rc-(lc-1))/n;
ncb=(br-(tr-1))/n;

for i = 0:nrb-(n)
    for j = 0:ncb-(n)
         colr(1)=mean(A(i*n+1:(i)*n+n, j*n+1:(j)*n+n, 1),'all');
         colr(2)=mean(A(i*n+1:(i)*n+n, j*n+1:(j)*n+n, 2),'all');
         colr(3)=mean(A(i*n+1:(i)*n+n, j*n+1:(j)*n+n, 3),'all');
%         [lc+(i*n+1),tr+(j*n+1)]
         DrawRectNoBorder(lc+(i*n),tr+(j*n),n,n,colr(1:3)/255)
    end
end
hold off
end


