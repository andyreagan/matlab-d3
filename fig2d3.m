function fig2d3(h,fname)
% fig2d3.m
%
% pulls out the basic data from a matlab figure, makes a d3 skeleton
% ex: plot(1:10,randn(1,10)); fig2d3(gcf,'test.js');
%
% written by Andy Reagan, 2014

rng('shuffle','twister');

% first, pull out the data
axesObjs = get(h, 'Children');
if length(axesObjs) > 1
    error('we only support one plot for now');
    % dataObjs = get(axesObjs{1}, 'Type');
else
    dataObjs = get(axesObjs, 'Children');
end

tmpfname = sprintf('%s.js.tmp',fname);

objTypes = get(dataObjs, 'Type');
disp(objTypes);

plotted = zeros(1,length(objTypes));

f = fopen(tmpfname,'w');
% stuff you should understand first
width=800;
height=500;


% grab axis labels quickly
xlabelStruct = get(get(axesObjs,'XLabel'));
ylabelStruct = get(get(axesObjs,'YLabel'));

for i=1:length(objTypes)
    if strcmp(objTypes{i},'line')
        tmpStruct = get(dataObjs(i));
        xdata = tmpStruct.XData;
        ydata = tmpStruct.YData;
        % save it as a csv
        csvwritewh(sprintf('%s_%02d.csv',fname,i),[xdata' ydata'],'x,y');
        % disp(tmpStruct.LineStyle)
        % handle lines and markers separately
        if strcmp(tmpStruct.LineStyle,'-')
            fprintf('making line %d\n',i);
            plotted(i) = 1;
            
            fprintf(f,'var line%02d = d3.svg.line()\n',i);
            fprintf(f,'    .x(function(d) { return x(d.x); })\n');
            fprintf(f,'    .y(function(d) { return y(d.y); })\n');
            fprintf(f,'    .interpolate("linear");\n');
            fprintf(f,'d3.csv("%s_%02d.csv", function(error, data) {\n',fname,i);
            fprintf(f,'  data.forEach(function(d) {\n');
            fprintf(f,'    d.x = d.x;\n');
            fprintf(f,'    d.y = d.y;\n');
            fprintf(f,'  });\n');
                      
            fprintf(f,'    svg.append("path")\n');
            fprintf(f,'      .datum(data)\n');
            fprintf(f,'      .attr("class", "line%02d")\n',i);
            fprintf(f,'      .attr("d", line%02d)\n',i);
            fprintf(f,'      .attr("stroke","blue")\n');
            fprintf(f,'      .attr("stroke-width",3)\n');
            fprintf(f,'      .attr("fill","none");\n');
            
            fprintf(f,'    data%02d = data;\n',i);
            
            fprintf(f,'    if (!--csvLoadsRemaining) loaded();\n');
            fprintf(f,'});\n');
        end
        if strcmp(tmpStruct.LineStyle,'none')
            fprintf('line %d is not a line, drawing circles\n',i);
            plotted(i) = 1;
            
            fprintf(f,'var line%02d = d3.svg.symbol();\n',i);
            fprintf(f,'d3.csv("%s_%02d.csv", function(error, data) {\n',fname,i);
            fprintf(f,'  data.forEach(function(d) {\n');
            fprintf(f,'    d.x = d.x;\n');
            fprintf(f,'    d.y = d.y;\n');
            fprintf(f,'  });\n');
            
            
            fprintf(f,'    svg.selectAll(".line%02d")\n',i);
            fprintf(f,'      .data(data)\n');
            fprintf(f,'      .enter().append("path")\n');
            fprintf(f,'      .attr("class", "line%02d")\n',i);
            fprintf(f,'      .attr("transform", function(d) { return "translate(" + x(d.x) + "," + y(d.y) + ")"; })\n');
            fprintf(f,'      .attr("d", line%02d);\n',i);
            
            fprintf(f,'    data%02d = data;\n',i);
            
            fprintf(f,'    if (!--csvLoadsRemaining) loaded();\n');
            
            fprintf(f,'});\n');
        end
    end % if line
    if strcmp(objTypes{i},'text')
        % draw text object individually
        % use their matlab location (try to)
    end % if text
end % for objTypes



fprintf(f,'</script>\n');
fclose(f);

f = fopen(sprintf('%s.js',fname),'w');
d3header(f,width,height);
fprintf(f,'var csvLoadsRemaining = %d;\n',sum(plotted));
fclose(f);
system(sprintf('cat %s >> %s.js; rm %s;',tmpfname,fname,tmpfname));