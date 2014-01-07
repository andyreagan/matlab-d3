function d3axislabel(f,labelString,label)
%
%
% INPUTS
%     f: file handle
%     labelString: either 'x' or 'y'
%     label: the label string

fprintf(f,'svg.append("g")\n');
fprintf(f,'    .attr("class", "%s axis")\n',labelString);
if strcmp(labelString,'x')
    fprintf(f,'    .attr("transform", "translate(0," + height + ")")\n');
end
fprintf(f,'    .call(%sAxis)\n',labelString);
fprintf(f,'    .append("text")\n');
fprintf(f,'    .attr("class", "label")\n');

if strcmp(labelString,'y')
    fprintf(f,'    .attr("transform", "rotate(-90)")\n');
    fprintf(f,'    .attr("y", 6)\n');
    fprintf(f,'    .attr("dy", ".71em")\n');
else
    fprintf(f,'    .attr("x", width)\n');
    fprintf(f,'    .attr("y", -6)\n');

end

fprintf(f,'    .style("text-anchor", "end")\n');
fprintf(f,'    .text("%s")\n',label);