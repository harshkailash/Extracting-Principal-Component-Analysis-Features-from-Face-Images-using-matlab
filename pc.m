D = 'D:\study\cbivr\lab record\lab 11-implementation of PCA\imgs';
S = dir(fullfile(D,'*.jpg')); % pattern to match filenames.
c=zeros(20,50);
q=imread('D:\study\cbivr\lab record\lab 11-implementation of PCA\imgs\3.jpg');
i1=rgb2gray(q);
i1=im2double(i1);
A=pca(i1);
B = maxk(maxk(A,1),50);
a=zeros(1,20);
a=string(a);
for k = 1:numel(S) %number of elements
   F=fullfile(D,S(k).name);
   a(k)=S(k).name;
   i=imread(F);
   title(i);
   i=rgb2gray(i);
   i=im2double(i);
   A=pca(i);
   B = maxk(maxk(A,1),50);
   c(k,:)=B;
end
sd=zeros(1,20);
mini=100;
for k=1:20
   D  = sqrt(sum((c(k,:) - B) .^ 2));
   sd(k)=D;
   if D<mini
       mini=D;
       val=k;
   end
end
req=fullfile('D:\study\cbivr\lab record\lab 11-implementation of PCA\imgs',a(val));
I=imread(req{1});
subplot(1,2,1);
imagesc(q);
title('Query Image');
subplot(1,2,2);
imagesc(I);
title('Output Image');
c=array2table(c);
writetable(c, 'avt.csv');
