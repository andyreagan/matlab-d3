<div id="figured8V1P8H5cYWaFZQXXcvV5580gp3"></div>

<script>
var csvLoadsRemaining = 3;
d3.text("storylab_d8V1P8H5cYWaFZQXXcvV5580gp301.csv", function(text) {
    var data = d3.csv.parseRows(text).map(function(row) {
      return row.map( function(value) {
        return +value;
      });
    });
    data_d8V1P8H5cYWaFZQXXcvV5580gp301 = data;
    console.log(data_d8V1P8H5cYWaFZQXXcvV5580gp301);    if (!--csvLoadsRemaining) plotsHBwqEb6x(d3.select("#figured8V1P8H5cYWaFZQXXcvV5580gp3"));
});
d3.text("storylab_d8V1P8H5cYWaFZQXXcvV5580gp302.csv", function(text) {
    var data = d3.csv.parseRows(text).map(function(row) {
      return row.map( function(value) {
        return +value;
      });
    });
    data_d8V1P8H5cYWaFZQXXcvV5580gp302 = data;
    console.log(data_d8V1P8H5cYWaFZQXXcvV5580gp302);    if (!--csvLoadsRemaining) plotsHBwqEb6x(d3.select("#figured8V1P8H5cYWaFZQXXcvV5580gp3"));
});
d3.text("storylab_d8V1P8H5cYWaFZQXXcvV5580gp303.csv", function(text) {
    var data = d3.csv.parseRows(text).map(function(row) {
      return row.map( function(value) {
        return +value;
      });
    });
    data_d8V1P8H5cYWaFZQXXcvV5580gp303 = data;
    console.log(data_d8V1P8H5cYWaFZQXXcvV5580gp303);    if (!--csvLoadsRemaining) plotsHBwqEb6x(d3.select("#figured8V1P8H5cYWaFZQXXcvV5580gp3"));
});
function plotsHBwqEb6x(figure) {

var marginsHBwqEb6x = {top: 0, right: 0, bottom: 0, left: 0},
    figwidthsHBwqEb6x = 600 - marginsHBwqEb6x.left - marginsHBwqEb6x.right,
    figheightsHBwqEb6x = 500 - marginsHBwqEb6x.top - marginsHBwqEb6x.bottom,
    widthsHBwqEb6x = .775*figwidthsHBwqEb6x,
    heightsHBwqEb6x = .775*figheightsHBwqEb6x;

// remove an old one if it exists
figure.select(".canvassHBwqEb6x").remove();

var canvassHBwqEb6x = figure.append("svg:svg")
    .attr("width",figwidthsHBwqEb6x)
    .attr("height",figheightsHBwqEb6x)
    .attr("class","canvassHBwqEb6x")

// create the x and y axis
var xsHBwqEb6x = d3.scale.linear()
    .domain([0, 2])
    .range([0, widthsHBwqEb6x]);
var ysHBwqEb6x = d3.scale.linear()
    .domain([-4, 12])
    .range([heightsHBwqEb6x, 0]);

// zoom object for the axes
var zoomsHBwqEb6x = d3.behavior.zoom()
    .x(xsHBwqEb6x)
    .y(ysHBwqEb6x)
    .on("zoom",zoomedsHBwqEb6x);

// create the axes themselves
var axessHBwqEb6x = canvassHBwqEb6x.append("g")
    .attr("transform", "translate(" + (0.125 * figwidthsHBwqEb6x) + "," +
       ((1 - 0.125 - 0.775) * figheightsHBwqEb6x) + ")")
    .attr("width", widthsHBwqEb6x)
    .attr("height", heightsHBwqEb6x)
    .attr("class", "mainsHBwqEb6x")
    .call(zoomsHBwqEb6x);

// create the axes background
axessHBwqEb6x.append("svg:rect")
    .attr("width", widthsHBwqEb6x)
    .attr("height", heightsHBwqEb6x)
    .attr("class", "bgsHBwqEb6x")
    .attr("fill", "#FCFCFC");

// axes creation functions
var create_xAxissHBwqEb6x = function() {
    return d3.svg.axis()
    .scale(xsHBwqEb6x)
    .orient("bottom"); }
var create_yAxissHBwqEb6x = function() {
    return d3.svg.axis()
    .scale(ysHBwqEb6x)
    .orient("left"); }

// draw the axes
var yAxissHBwqEb6x = create_yAxissHBwqEb6x();

axessHBwqEb6x.append("g")
  .attr("class", "y axis sHBwqEb6x")
  .attr("transform", "(0,0)")
  .call(yAxissHBwqEb6x);

var xAxissHBwqEb6x = create_xAxissHBwqEb6x();

axessHBwqEb6x.append("g")
  .attr("class", "x axis sHBwqEb6x")
  .attr("transform", "translate(0," + heightsHBwqEb6x + ")")
  .call(xAxissHBwqEb6x);

// create the clip boundary
var clipsHBwqEb6x = axessHBwqEb6x.append("svg:clipPath")
  .attr("id","clipsHBwqEb6x")
  .append("svg:rect")
  .attr("x",0)
  .attr("y",0)
  .attr("width",widthsHBwqEb6x)
  .attr("height",heightsHBwqEb6x);

// now something else
var unclipped_axessHBwqEb6x = axessHBwqEb6x;
 
axessHBwqEb6x = axessHBwqEb6x.append("g")
  .attr("clip-path","url(#clipsHBwqEb6x)");
var linesHBwqEb6x01 = d3.svg.line()
  .x(function(d) { return xsHBwqEb6x(d[0]); })
  .y(function(d) { return ysHBwqEb6x(d[1]); })
  .interpolate("linear");

axessHBwqEb6x.append("path")
   .datum(data_d8V1P8H5cYWaFZQXXcvV5580gp301)
   .attr("class", "linesHBwqEb6x01")
   .attr("d", linesHBwqEb6x01)
   .attr("stroke","red")
   .attr("stroke-width",3)
   .attr("fill","none");

var linesHBwqEb6x02 = d3.svg.symbol();

axessHBwqEb6x.selectAll(".linesHBwqEb6x02")
   .data(data_d8V1P8H5cYWaFZQXXcvV5580gp302)
   .enter().append("path")
   .attr("class", "linesHBwqEb6x02")
   .attr("stroke","blue")
   .attr("transform", function(d) { return "translate(" + xsHBwqEb6x(d[0]) + "," + ysHBwqEb6x(d[1]) + ")"; })
   .attr("d", linesHBwqEb6x02);

var linesHBwqEb6x03 = d3.svg.line()
  .x(function(d) { return xsHBwqEb6x(d[0]); })
  .y(function(d) { return ysHBwqEb6x(d[1]); })
  .interpolate("linear");

axessHBwqEb6x.append("path")
   .datum(data_d8V1P8H5cYWaFZQXXcvV5580gp303)
   .attr("class", "linesHBwqEb6x03")
   .attr("d", linesHBwqEb6x03)
   .attr("stroke","red")
   .attr("stroke-width",3)
   .attr("fill","none");

    canvassHBwqEb6x.append("text")
        .text("test x label")
        .attr("class", "axes-text sHBwqEb6x")
        .attr("x",widthsHBwqEb6x/2+(figwidthsHBwqEb6x-widthsHBwqEb6x)/2)
        .attr("y",3*(figheightsHBwqEb6x-heightsHBwqEb6x)/4+heightsHBwqEb6x+10)
        .attr("font-size", "12.0px")
        .attr("fill", "#000000")
        .attr("transform", "rotate(-0.0," + (widthsHBwqEb6x/2+(figwidthsHBwqEb6x-widthsHBwqEb6x)/2) + "," + (3*(figheightsHBwqEb6x-heightsHBwqEb6x)/4+heightsHBwqEb6x+10) + ")")
        .attr("style", "text-anchor: middle;");
    canvassHBwqEb6x.append("text")
        .text("test y label")
        .attr("class", "axes-text sHBwqEb6x")
        .attr("x",(figwidthsHBwqEb6x-widthsHBwqEb6x)/4)
        .attr("y", figheightsHBwqEb6x/2)
        .attr("font-size", "12.0px")
        .attr("fill", "#000000")
        .attr("transform", "rotate(-90.0," + ((figwidthsHBwqEb6x-widthsHBwqEb6x)/4) + "," + (figheightsHBwqEb6x/2) + ")")
        .attr("style", "text-anchor: middle;");
    function zoomedsHBwqEb6x() {
        d3.select(".x.sHBwqEb6x.axis").call(xAxissHBwqEb6x);
        d3.select(".y.sHBwqEb6x.axis").call(yAxissHBwqEb6x);

        axessHBwqEb6x.select(".linesHBwqEb6x01")
          .attr("d",linesHBwqEb6x01(data_d8V1P8H5cYWaFZQXXcvV5580gp301));

        axessHBwqEb6x.selectAll(".linesHBwqEb6x02")
          .attr("transform", function(d) { return "translate(" + xsHBwqEb6x(d[0]) + "," + ysHBwqEb6x(d[1]) + ")"; })
        axessHBwqEb6x.select(".linesHBwqEb6x03")
          .attr("d",linesHBwqEb6x03(data_d8V1P8H5cYWaFZQXXcvV5580gp303));

     };
};
</script>
