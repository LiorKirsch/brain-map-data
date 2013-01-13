function [dataMat,allFieldNames] =  textFile2cell(filename,delimeter,comment_symbol)
%
% read text file, put headers (col. / field names) in one array and data in a
% matrix
% terms
% Input:    filename  - web source we got the data from
%                   comment_symbol - skip indicator, for example in NCBI files, we want to skip rows that begin with '#'
%
% Output:   dataMat, allFieldNames
%
fid=fopen(filename,'r');
if fid<1
    error('textFile2cell: can not open file');
end

% get header terms
tline=fgets(fid) ;

if(~exist('delimeter','var'))
    delimeter = '\t';
end

if(exist('comment_symbol','var'))
    while (strcmp(tline(1),comment_symbol)==1)
        tline=fgets(fid) ;
    end
end
allFieldNames = '';
curr_term =1;
remainder = strrep(tline, ' ', '_');
while (any(remainder))
    [chopped,remainder] = strtok(remainder);
    allFieldNames{curr_term} = chopped;
    curr_term = curr_term+1;
end

%create format string
format_str = '%*[^\n]';
for ii=1:length(allFieldNames)
    format_str =  ['%s\t',format_str];
end
dataMat = textscan(fid,format_str,'delimiter', '\t','BufSize',101024,'CollectOutput', 1);
dataMat = dataMat{1,1};

fclose all ;
return
end