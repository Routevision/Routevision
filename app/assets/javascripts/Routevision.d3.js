var width = 960,
    height = 1000,
    centered;

var projection = d3.geo.albersUsa()
    .scale(305100)
    .translate([100790.75,11750]);

var path = d3.geo.path()
    .projection(projection);

var svg = d3.select("body").append("svg")
    .attr("width", width)
    .attr("height", height);

svg.append("rect")
    .attr("class", "background")
    .attr("width", width)
    .attr("height", height);

var states = svg.append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
  .append("g")
    .attr("id", "states")
    .attr("class", "Blues");

var cells = svg.append("g")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
    .append("g")
    .attr("id", "cells");

var quantize = d3.scale.quantize()
    .range(d3.range(9));

d3.json("/assets/sf_dcp.geojson", function(json) {

      states.selectAll("path")
        .data(json.features)
        .enter().append("path")
          .attr("d", path);

});

// d3.csv("APC_Stops_Sept2012-small.txt", function(airports) {
//     var positions = [];
//     var names = [];

//     airports.forEach(function(airport) {
//       positions.push(projection([+airport.LONGITUDE, +airport.LATITUDE]));
//     });

//     cells.selectAll("path")
//         .data(airports)
//       .enter()
//       .append("circle")
//         .attr("cx", function(d, i) { return (positions[i][0]-391080); })
//         .attr("cy", function(d, i) { return (positions[i][1]+652850); })
//         .attr("stroke", "darkslategrey")
//         .attr("stroke-width", 1.2)
//         .attr("fill", "red")
//         .attr("fill-opacity", 1)
//         .attr("r", 3)
//         .on("mouseover", function(d) { return tooltip(Math.floor(relative_data[d.id]) + "% of goal met, " + Math.floor(absolute_data[d.id]) + " registered", 
//           d.properties.Name.substr(0,d.properties.Name.length-15),
//           'width:220'); }) 
//         .on("mouseout", function(d) { return hideTip(); });
//   });

// d3.csv("APC_SCH_ADHERENCE_Sept2012-small.txt", function(airports) {
//   var positions = [];
//   var names = [];

//   airports.forEach(function(airport) {
//     positions.push(projection([+airport.LONGITUDE, +airport.LATITUDE]));
//   });
// });

function plot_bunch(bunch) {
    points = _.map(bunch, function(val) {
        return [val.lat, val.lng]
    });
    cells.selectAll("path")
    .data(points)
    .enter()
        .append("circle")
            .attr("cx", function(d, i) { return (positions[i][0]-391080); })
            .attr("cy", function(d, i) { return (positions[i][1]+652850); })
            .attr("stroke", "darkslategrey")
            .attr("stroke-width", 1.2)
            .attr("fill", "blue")
            .attr("fill-opacity", 1)
            .attr("r", 3);
}
