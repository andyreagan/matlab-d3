function d3main(f,width,height,plotted,xlabel,ylabel)

fprintf(f,'function loaded(figure) {\n');
fprintf(f,'\n');
fprintf(f,'var margin = {top: 0, right: 0, bottom: 0, left: 0},\n');
fprintf(f,'    figwidth = %g - margin.left - margin.right,\n',width);
fprintf(f,'    figheight = %g - margin.top - margin.bottom,\n',height);
fprintf(f,'    width = .775*figwidth,\n');
fprintf(f,'    height = .775*figheight;\n');
fprintf(f,'\n');
fprintf(f,'var canvas = figure.append("svg:svg")\n');
fprintf(f,'    .attr("width",figwidth)\n');
fprintf(f,'    .attr("height",figheight)\n');
fprintf(f,'    .attr("class","canvas")\n');
fprintf(f,'\n');
fprintf(f,'// create the x and y axis\n');
fprintf(f,'var x = d3.scale.linear()\n');
fprintf(f,'    .domain([0, 2])\n');
fprintf(f,'    .range([0, width]);\n');
fprintf(f,'var y = d3.scale.linear()\n');
fprintf(f,'    .domain([-4, 12])\n');
fprintf(f,'    .range([height, 0]);\n');
fprintf(f,'\n');
fprintf(f,'// zoom object for the axes\n');
fprintf(f,'var zoom = d3.behavior.zoom()\n');
fprintf(f,'    .x(x)\n');
fprintf(f,'    .y(y)\n');
fprintf(f,'    .on("zoom",zoomed);\n');
fprintf(f,'\n');
fprintf(f,'// create the axes themselves\n');
fprintf(f,'var axes = canvas.append("g")\n');
fprintf(f,'    .attr("transform", "translate(" + (0.125 * figwidth) + "," +\n');
fprintf(f,'       ((1 - 0.125 - 0.775) * figheight) + ")")\n');
fprintf(f,'    .attr("width", width)\n');
fprintf(f,'    .attr("height", height)\n');
fprintf(f,'    .attr("class", "main")\n');
fprintf(f,'    .call(zoom);\n');
fprintf(f,'\n');
fprintf(f,'// create the axes background\n');
fprintf(f,'axes.append("svg:rect")\n');
fprintf(f,'    .attr("width", width)\n');
fprintf(f,'    .attr("height", height)\n');
fprintf(f,'    .attr("class", "bg")\n');
fprintf(f,'    .attr("fill", "#FCFCFC");\n');
fprintf(f,'\n');
fprintf(f,'// axes creation functions\n');
fprintf(f,'var create_xAxis = function() {\n');
fprintf(f,'    return d3.svg.axis()\n');
fprintf(f,'    .scale(x)\n');
fprintf(f,'    .orient("bottom"); }\n');
fprintf(f,'var create_yAxis = function() {\n');
fprintf(f,'    return d3.svg.axis()\n');
fprintf(f,'    .scale(y)\n');
fprintf(f,'    .orient("left"); }\n');
fprintf(f,'\n');
fprintf(f,'// draw the axes\n');
fprintf(f,'var yAxis = create_yAxis();\n');
fprintf(f,'\n');
fprintf(f,'axes.append("g")\n');
fprintf(f,'  .attr("class", "y axis")\n');
fprintf(f,'  .attr("transform", "(0,0)")\n');
fprintf(f,'  .call(yAxis);\n');
fprintf(f,'\n');
fprintf(f,'var xAxis = create_xAxis();\n');
fprintf(f,'\n');
fprintf(f,'axes.append("g")\n');
fprintf(f,'  .attr("class", "x axis")\n');
fprintf(f,'  .attr("transform", "translate(0," + height + ")")\n');
fprintf(f,'  .call(xAxis);\n');
fprintf(f,'\n');
fprintf(f,'// create the clip boundary\n');
fprintf(f,'var clip = axes.append("svg:clipPath")\n');
fprintf(f,'  .attr("id","clip")\n');
fprintf(f,'  .append("svg:rect")\n');
fprintf(f,'  .attr("x",0)\n');
fprintf(f,'  .attr("y",0)\n');
fprintf(f,'  .attr("width",width)\n');
fprintf(f,'  .attr("height",height);\n');
fprintf(f,'\n');
fprintf(f,'// now something else\n');
fprintf(f,'var unclipped_axes = axes;\n');
fprintf(f,' \n');
fprintf(f,'axes = axes.append("g")\n');
fprintf(f,'  .attr("clip-path","url(#clip)");\n');

for i=1:length(plotted)
    if plotted(i) == 1
        fprintf(f,'var line%02d = d3.svg.line()\n',i);
        fprintf(f,'  .x(function(d) { return x(d.x); })\n');
        fprintf(f,'  .y(function(d) { return y(d.y); })\n');
        fprintf(f,'  .interpolate("linear");\n');
        fprintf(f,'\n');
        fprintf(f,'axes.append("path")\n');
        fprintf(f,'   .datum(data%02d)\n',i);
        fprintf(f,'   .attr("class", "line%02d")\n',i);
        fprintf(f,'   .attr("d", line%02d)\n',i);
        fprintf(f,'   .attr("stroke","red")\n');
        fprintf(f,'   .attr("stroke-width",3)\n');
        fprintf(f,'   .attr("fill","none");\n');
        fprintf(f,'\n');
    end
    if plotted(i) == .01
        fprintf(f,'var line%02d = d3.svg.symbol();\n',i);
        fprintf(f,'\n');
        fprintf(f,'axes.selectAll(".line%02d")\n',i);
        fprintf(f,'   .data(data%02d)\n',i);
        fprintf(f,'   .enter().append("path")\n');
        fprintf(f,'   .attr("class", "line%02d")\n',i);
        fprintf(f,'   .attr("stroke","blue")\n');
        fprintf(f,'   .attr("transform", function(d) { return "translate(" + x(d.x) + "," + y(d.y) + ")"; })\n');
        fprintf(f,'   .attr("d", line%02d);\n',i);
        fprintf(f,'\n');
    end
end

fprintf(f,'    canvas.append("text")\n');
fprintf(f,'        .text("%s")\n',xlabel);
fprintf(f,'        .attr("class", "axes-text")\n');
fprintf(f,'        .attr("x",width/2+(figwidth-width)/2)\n');
fprintf(f,'        .attr("y",3*(figheight-height)/4+height)+10\n');
fprintf(f,'        .attr("font-size", "12.0px")\n');
fprintf(f,'        .attr("fill", "#000000")\n');
fprintf(f,'        .attr("transform", "rotate(-0.0," + (width/2+(figwidth-width)/2) + "," + (3*(figheight-height)/4+height+10) + ")")\n');
fprintf(f,'        .attr("style", "text-anchor: middle;")\n');
    
fprintf(f,'    canvas.append("text")\n');
fprintf(f,'        .text("%s")\n',ylabel);
fprintf(f,'        .attr("class", "axes-text")\n');
fprintf(f,'        .attr("x",(figwidth-width)/4)\n');
fprintf(f,'        .attr("y", figheight/2)\n');
fprintf(f,'        .attr("font-size", "12.0px")\n');
fprintf(f,'        .attr("fill", "#000000")\n');
fprintf(f,'        .attr("transform", "rotate(-90.0," + ((figwidth-width)/4) + "," + (figheight/2) + ")")\n');
fprintf(f,'        .attr("style", "text-anchor: middle;")\n');
    
%     canvas.append("text")
%         .text("Matlab Plot Rendered in D3!")
%         .attr("class", "axes-text")
%         .attr("x", 246.0)
%         .attr("y", figheight - 293.555555556)
%         .attr("font-size", "14.0px")
%         .attr("fill", "#000000")
%         .attr("transform", "rotate(-0.0,246.0," + (figheight - 293.555555556) + ")")
%         .attr("style", "text-anchor: middle;")

fprintf(f,'    function zoomed() {\n');
fprintf(f,'        d3.select(".x.axis").call(xAxis);\n');
fprintf(f,'        d3.select(".y.axis").call(yAxis);\n');
fprintf(f,'\n');

for i=1:length(plotted)
    if plotted(i) == 1
        fprintf(f,'        axes.select(".line%02d")\n',i);
        fprintf(f,'          .attr("d",line%02d(data%02d));\n',i,i);
        fprintf(f,'\n');
    end
    if plotted(i) == .01
        fprintf(f,'        axes.selectAll(".line%02d")\n',i);
        fprintf(f,'          .attr("transform", function(d) { return "translate(" + x(d.x) + "," + y(d.y) + ")"; })\n');

    end
end
fprintf(f,'     };\n');
fprintf(f,'};\n');
fprintf(f,'</script>\n');