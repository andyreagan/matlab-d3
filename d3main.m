function d3main(f,width,height,plotted,xlabel,ylabel,figure_hash,plot_hash)

fprintf(f,'function plot%s(figure) {\n',plot_hash);
fprintf(f,'\n');
fprintf(f,'var margin%s = {top: 0, right: 0, bottom: 0, left: 0},\n',plot_hash);
fprintf(f,'    figwidth%s = %g - margin%s.left - margin%s.right,\n',plot_hash,width,plot_hash,plot_hash);
fprintf(f,'    figheight%s = %g - margin%s.top - margin%s.bottom,\n',plot_hash,height,plot_hash,plot_hash);
fprintf(f,'    width%s = .775*figwidth%s,\n',plot_hash,plot_hash);
fprintf(f,'    height%s = .775*figheight%s;\n',plot_hash,plot_hash);
fprintf(f,'\n');
fprintf(f,'// remove an old one if it exists\n');
fprintf(f,'figure.select(".canvas%s").remove();\n',plot_hash);
fprintf(f,'\n');
fprintf(f,'var canvas%s = figure.append("svg:svg")\n',plot_hash);
fprintf(f,'    .attr("width",figwidth%s)\n',plot_hash);
fprintf(f,'    .attr("height",figheight%s)\n',plot_hash);
fprintf(f,'    .attr("class","canvas%s")\n',plot_hash);
fprintf(f,'\n');
fprintf(f,'// create the x and y axis\n');
fprintf(f,'var x%s = d3.scale.linear()\n',plot_hash);
fprintf(f,'    .domain([0, 2])\n');
fprintf(f,'    .range([0, width%s]);\n',plot_hash);
fprintf(f,'var y%s = d3.scale.linear()\n',plot_hash);
fprintf(f,'    .domain([-4, 12])\n');
fprintf(f,'    .range([height%s, 0]);\n',plot_hash);
fprintf(f,'\n');
fprintf(f,'// zoom object for the axes\n');
fprintf(f,'var zoom%s = d3.behavior.zoom()\n',plot_hash);
fprintf(f,'    .x(x%s)\n',plot_hash);
fprintf(f,'    .y(y%s)\n',plot_hash);
fprintf(f,'    .on("zoom",zoomed%s);\n',plot_hash);
fprintf(f,'\n');
fprintf(f,'// create the axes themselves\n');
fprintf(f,'var axes%s = canvas%s.append("g")\n',plot_hash,plot_hash);
fprintf(f,'    .attr("transform", "translate(" + (0.125 * figwidth%s) + "," +\n',plot_hash);
fprintf(f,'       ((1 - 0.125 - 0.775) * figheight%s) + ")")\n',plot_hash);
fprintf(f,'    .attr("width", width%s)\n',plot_hash);
fprintf(f,'    .attr("height", height%s)\n',plot_hash);
fprintf(f,'    .attr("class", "main%s")\n',plot_hash);
fprintf(f,'    .call(zoom%s);\n',plot_hash);
fprintf(f,'\n');
fprintf(f,'// create the axes background\n');
fprintf(f,'axes%s.append("svg:rect")\n',plot_hash);
fprintf(f,'    .attr("width", width%s)\n',plot_hash);
fprintf(f,'    .attr("height", height%s)\n',plot_hash);
fprintf(f,'    .attr("class", "bg%s")\n',plot_hash);
fprintf(f,'    .attr("fill", "#FCFCFC");\n');
fprintf(f,'\n');
fprintf(f,'// axes creation functions\n');
fprintf(f,'var create_xAxis%s = function() {\n',plot_hash);
fprintf(f,'    return d3.svg.axis()\n');
fprintf(f,'    .scale(x%s)\n',plot_hash);
fprintf(f,'    .orient("bottom"); }\n');
fprintf(f,'var create_yAxis%s = function() {\n',plot_hash);
fprintf(f,'    return d3.svg.axis()\n');
fprintf(f,'    .scale(y%s)\n',plot_hash);
fprintf(f,'    .orient("left"); }\n');
fprintf(f,'\n');
fprintf(f,'// draw the axes\n');
fprintf(f,'var yAxis%s = create_yAxis%s();\n',plot_hash,plot_hash);
fprintf(f,'\n');
fprintf(f,'axes%s.append("g")\n',plot_hash);
fprintf(f,'  .attr("class", "y axis %s")\n',plot_hash);
fprintf(f,'  .attr("transform", "(0,0)")\n');
fprintf(f,'  .call(yAxis%s);\n',plot_hash);
fprintf(f,'\n');
fprintf(f,'var xAxis%s = create_xAxis%s();\n',plot_hash,plot_hash);
fprintf(f,'\n');
fprintf(f,'axes%s.append("g")\n',plot_hash);
fprintf(f,'  .attr("class", "x axis %s")\n',plot_hash);
fprintf(f,'  .attr("transform", "translate(0," + height%s + ")")\n',plot_hash);
fprintf(f,'  .call(xAxis%s);\n',plot_hash);
fprintf(f,'\n');
fprintf(f,'// create the clip boundary\n');
fprintf(f,'var clip%s = axes%s.append("svg:clipPath")\n',plot_hash,plot_hash);
fprintf(f,'  .attr("id","clip%s")\n',plot_hash);
fprintf(f,'  .append("svg:rect")\n');
fprintf(f,'  .attr("x",0)\n');
fprintf(f,'  .attr("y",0)\n');
fprintf(f,'  .attr("width",width%s)\n',plot_hash);
fprintf(f,'  .attr("height",height%s);\n',plot_hash);
fprintf(f,'\n');
fprintf(f,'// now something else\n');
fprintf(f,'var unclipped_axes%s = axes%s;\n',plot_hash,plot_hash);
fprintf(f,' \n');
fprintf(f,'axes%s = axes%s.append("g")\n',plot_hash,plot_hash);
fprintf(f,'  .attr("clip-path","url(#clip%s)");\n',plot_hash);

for i=1:length(plotted)
    if plotted(i) == 1
        fprintf(f,'var line%s%02d = d3.svg.line()\n',plot_hash,i);
        fprintf(f,'  .x(function(d) { return x%s(d[0]); })\n',plot_hash);
        fprintf(f,'  .y(function(d) { return y%s(d[1]); })\n',plot_hash);
        fprintf(f,'  .interpolate("linear");\n');
        fprintf(f,'\n');
        fprintf(f,'axes%s.append("path")\n',plot_hash);
        fprintf(f,'   .datum(data_%s%02d)\n',figure_hash,i);
        fprintf(f,'   .attr("class", "line%s%02d")\n',plot_hash,i);
        fprintf(f,'   .attr("d", line%s%02d)\n',plot_hash,i);
        fprintf(f,'   .attr("stroke","red")\n');
        fprintf(f,'   .attr("stroke-width",3)\n');
        fprintf(f,'   .attr("fill","none");\n');
        fprintf(f,'\n');
    end
    if plotted(i) == .01
        fprintf(f,'var line%s%02d = d3.svg.symbol();\n',plot_hash,i);
        fprintf(f,'\n');
        fprintf(f,'axes%s.selectAll(".line%s%02d")\n',plot_hash,plot_hash,i);
        fprintf(f,'   .data(data_%s%02d)\n',figure_hash,i);
        fprintf(f,'   .enter().append("path")\n');
        fprintf(f,'   .attr("class", "line%s%02d")\n',plot_hash,i);
        fprintf(f,'   .attr("stroke","blue")\n');
        fprintf(f,'   .attr("transform", function(d) { return "translate(" + x%s(d[0]) + "," + y%s(d[1]) + ")"; })\n',plot_hash,plot_hash);
        fprintf(f,'   .attr("d", line%s%02d);\n',plot_hash,i);
        fprintf(f,'\n');
    end
end

fprintf(f,'    canvas%s.append("text")\n',plot_hash);
fprintf(f,'        .text("%s")\n',xlabel);
fprintf(f,'        .attr("class", "axes-text %s")\n',plot_hash);
fprintf(f,'        .attr("x",width%s/2+(figwidth%s-width%s)/2)\n',plot_hash,plot_hash,plot_hash);
fprintf(f,'        .attr("y",3*(figheight%s-height%s)/4+height%s+10)\n',plot_hash,plot_hash,plot_hash);
fprintf(f,'        .attr("font-size", "12.0px")\n');
fprintf(f,'        .attr("fill", "#000000")\n');
fprintf(f,'        .attr("transform", "rotate(-0.0," + (width%s/2+(figwidth%s-width%s)/2) + "," + (3*(figheight%s-height%s)/4+height%s+10) + ")")\n',plot_hash,plot_hash,plot_hash,plot_hash,plot_hash,plot_hash);
fprintf(f,'        .attr("style", "text-anchor: middle;");\n');
    
fprintf(f,'    canvas%s.append("text")\n',plot_hash);
fprintf(f,'        .text("%s")\n',ylabel);
fprintf(f,'        .attr("class", "axes-text %s")\n',plot_hash);
fprintf(f,'        .attr("x",(figwidth%s-width%s)/4)\n',plot_hash,plot_hash);
fprintf(f,'        .attr("y", figheight%s/2)\n',plot_hash);
fprintf(f,'        .attr("font-size", "12.0px")\n');
fprintf(f,'        .attr("fill", "#000000")\n');
fprintf(f,'        .attr("transform", "rotate(-90.0," + ((figwidth%s-width%s)/4) + "," + (figheight%s/2) + ")")\n',plot_hash,plot_hash,plot_hash);
fprintf(f,'        .attr("style", "text-anchor: middle;");\n');

fprintf(f,'    function zoomed%s() {\n',plot_hash);
fprintf(f,'        d3.select(".x.%s.axis").call(xAxis%s);\n',plot_hash,plot_hash);
fprintf(f,'        d3.select(".y.%s.axis").call(yAxis%s);\n',plot_hash,plot_hash);
fprintf(f,'\n');

for i=1:length(plotted)
    if plotted(i) == 1
        fprintf(f,'        axes%s.select(".line%s%02d")\n',plot_hash,plot_hash,i);
        fprintf(f,'          .attr("d",line%s%02d(data_%s%02d));\n',plot_hash,i,figure_hash,i);
        fprintf(f,'\n');
    end
    if plotted(i) == .01
        fprintf(f,'        axes%s.selectAll(".line%s%02d")\n',plot_hash,plot_hash,i);
        fprintf(f,'          .attr("transform", function(d) { return "translate(" + x%s(d[0]) + "," + y%s(d[1]) + ")"; })\n',plot_hash,plot_hash);

    end
end
fprintf(f,'     };\n');
fprintf(f,'};\n');
fprintf(f,'</script>\n');