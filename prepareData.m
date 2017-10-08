% prepare the data function
function [trainImages,tkImages,trainLabels,tkLabels] = prepareData(dir)

f=fopen(fullfile(dir, 'train-images-idx3-ubyte'),'r') ;
x1=fread(f,inf,'uint8');
fclose(f) ;
trainImages=permute(reshape(x1(17:end),28,28,60e3),[2 1 3]) ;

f=fopen(fullfile(dir, 't10k-images-idx3-ubyte'),'r') ;
x2=fread(f,inf,'uint8');
fclose(f) ;
tkImages=permute(reshape(x2(17:end),28,28,10e3),[2 1 3]) ;

f=fopen(fullfile(dir, 'train-labels-idx1-ubyte'),'r') ;
y1=fread(f,inf,'uint8');
fclose(f) ;
trainLabels=double(y1(9:end)')+1 ;

f=fopen(fullfile(dir, 't10k-labels-idx1-ubyte'),'r') ;
y2=fread(f,inf,'uint8');
fclose(f) ;
tkLabels=double(y2(9:end)')+1 ;