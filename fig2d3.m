function fig2d3(h,fname)
% fig2d3.m
%
% pulls out the basic data from a matlab figure, makes a d3 skeleton
% ex: plot(1:10,randn(1,10)); fig2d3(gcf);
%
% written by Andy Reagan

% first, pull out the data
axesObjs = get(h, 'Children');
dataObjs = get(axesObjs, 'Children');
objTypes = get(dataObjs, 'Type');
disp(objTypes);

f = fopen(sprintf('%s.js',fname),'w');
% stuff you should understand first
fprintf(f,'<script>\n');
fprintf(f,'var margin = {top: 20, right: 20, bottom: 30, left: 50},\n');
fprintf(f,'    width = 960 - margin.left - margin.right,\n');
fprintf(f,'    height = 500 - margin.top - margin.bottom;\n'); 
fprintf(f,'var x = d3.time.scale()\n');
fprintf(f,'    .range([0, width]);\n');
fprintf(f,'var y = d3.scale.linear()\n');
fprintf(f,'    .range([height, 0]);\n');
fprintf(f,'var xAxis = d3.svg.axis()\n');
fprintf(f,'    .scale(x)\n');
fprintf(f,'    .orient("bottom");\n');
fprintf(f,'var yAxis = d3.svg.axis()\n');
fprintf(f,'    .scale(y)\n');
fprintf(f,'    .orient("left");\n');
fprintf(f,'var line = d3.svg.line()\n');
fprintf(f,'    .x(function(d) { return x(d.x)); })\n');
fprintf(f,'    .y(function(d) { return y(d.y); });\n');
fprintf(f,'var svg = d3.select("body").append("svg")\n');
fprintf(f,'    .attr("width", width + margin.left + margin.right)\n');
fprintf(f,'    .attr("height", height + margin.top + margin.bottom)\n');
fprintf(f,'    .append("g")\n');
fprintf(f,'    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");\n');

% handle labels quickly
xlabelStruct = get(get(axesObjs,'XLabel'));
ylabelStruct = get(get(axesObjs,'YLabel'));
if ~isempty(ylabelStruct.String)
    fprintf(f,'svg.append("g")\n');
    fprintf(f,'    .attr("class", "y axis")\n');
    fprintf(f,'    .call(yAxis)\n');
    fprintf(f,'    .append("text")\n');
    fprintf(f,'    .attr("class", "label")\n');
    fprintf(f,'    .attr("transform", "rotate(-90)")\n');
    fprintf(f,'    .attr("y", 6)\n');
    fprintf(f,'    .attr("dy", ".71em")\n');
    fprintf(f,'    .style("text-anchor", "end")\n');
    fprintf(f,'    .text("%s")\n',ylabelStruct.String);
end
if ~isempty(xlabelStruct.String)
    fprintf(f,'svg.append("g")\n');
    fprintf(f,'    .attr("class", "x axis")\n');
    fprintf(f,'    .attr("transform", "translate(0," + height + ")")\n');
    fprintf(f,'    .call(xAxis)\n');
    fprintf(f,'    .append("text")\n');
    fprintf(f,'    .attr("class", "label")\n');
    fprintf(f,'    .attr("x", width)\n');
    fprintf(f,'    .attr("y", -6)\n');
    fprintf(f,'    .style("text-anchor", "end")\n');
    fprintf(f,'    .text("%s");\n',xlabelStruct.String);
end
      
for i=1:length(objTypes)
    if strcmp(objTypes{i},'line')
        tmpStruct = get(dataObjs(i));
        xdata = tmpStruct.XData;        
        ydata = tmpStruct.YData;
        % save it as a csv
        csvwrite(sprintf('%s_%02d.csv',fname,i),xdata',ydata');
        disp(tmpStruct.LineStyle)
        % handle lines and markers separately
    end
    if strcmp(objTypes{i},'text')
        % draw text object individually
    end
end


fprintf(f,'</script>\n');
fclose(f);