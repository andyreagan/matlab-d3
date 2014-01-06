function csvwritewh(fname,data,header)
% csvwritewh.m
%
% write a string header in front of the csv
% not terribly efficient
%
% written by Andy Reagan, 2014

csvwrite(sprintf('%s.tmp',fname),data);
system(sprintf('echo "%s" > %s; cat %s.tmp >> %s; rm %s.tmp',header,fname,fname,fname,fname));
