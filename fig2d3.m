function fig2d3(h,fname)
% fig2d3.m
%
% pulls out the basic data from a matlab figure, makes a d3 skeleton
% ex: plot(1:10,randn(1,10)); fig2d3(gcf,'test.js');
%
% written by Andy Reagan, 2014

rng('shuffle','twister');
symbols = ['a':'z' 'A':'Z' '0':'9'];
MAX_ST_LENGTH = 50;
stLength = randi(MAX_ST_LENGTH);
nums = randi(numel(symbols),[1 stLength]);
figure_hash = symbols (nums);

% first, pull out the data
axesObjs = get(h, 'Children');
if length(axesObjs) > 1
    error('we only support one plot for now');
    % dataObjs = get(axesObjs{1}, 'Type');
else
    dataObjs = get(axesObjs, 'Children');
end

tmpfname1 = sprintf('%s.js.tmp1',fname);

objTypes = get(dataObjs, 'Type');
disp(objTypes);

plotted = zeros(1,length(objTypes));

f = fopen(tmpfname1,'w');
% stuff you should understand first
width=600;
height=500;
xlims = [0,1];
ylims = [0,1];

% grab axis labels quickly
xlabelStruct = get(get(axesObjs,'XLabel'));
ylabelStruct = get(get(axesObjs,'YLabel'));

num_plots = 1;
plot_hash_list = cell(num_plots,1);

stLength = randi(MAX_ST_LENGTH);
nums = randi(numel(symbols),[1 stLength]);
plot_hash = symbols (nums);
plot_hash_list{1} = plot_hash;

for i=1:length(objTypes)
    if strcmp(objTypes{i},'line')
        tmpStruct = get(dataObjs(i));
        xdata = tmpStruct.XData;
        ydata = tmpStruct.YData;
        xlims = [min([xlims(1) xdata]) max([xlims(2) xdata])]; 
        ylims = [min([ylims(1) ydata]) max([ylims(2) ydata])]; 
        % save it as a csv
        csvwrite(sprintf('%s_%s%02d.csv',fname,figure_hash,i),[xdata' ydata']);
        
        % handle lines and markers separately
        if strcmp(tmpStruct.LineStyle,'-')
            fprintf('making line %d\n',i);
            plotted(i) = 1;
            d3loadData(f,fname,i,figure_hash,plot_hash)
        end
        if strcmp(tmpStruct.LineStyle,'none')
            fprintf('line %d is not a line, drawing circles\n',i);
            plotted(i) = .01;  
            d3loadData(f,fname,i,figure_hash,plot_hash)
        end
    end % if line
    if strcmp(objTypes{i},'text')
        % draw text object individually
        % use their matlab location (try to)
    end % if text
end % for objTypes


% includ the bulk of the d3
tmpfname2 = sprintf('%s.js.tmp2',fname);
f = fopen(tmpfname2,'w');
d3main(f,width,height,plotted,xlabelStruct.String,ylabelStruct.String,figure_hash,plot_hash);
fclose(f);


f = fopen(sprintf('%s.js',fname),'w');
fprintf(f,'<div id="figure%s"></div>\n\n',figure_hash);
fprintf(f,'<script>\n');
fprintf(f,'var csvLoadsRemaining = %d;\n',sum(floor(plotted))+sum(100*(plotted-floor(plotted))));
fclose(f);
system(sprintf('cat %s %s >> %s.js; rm %s %s;',tmpfname1,tmpfname2,fname,tmpfname1,tmpfname2));

system(sprintf('cat plot-header.html %s.js plot-footer.html > %s.html;',fname,fname));

% system(sprintf('scp *.csv %s.html zoo:/users/a/r/areagan/public_html/',fname));
system(sprintf('echo "scp *.csv %s.html zoo:/users/a/r/areagan/public_html/" | pbcopy',fname));