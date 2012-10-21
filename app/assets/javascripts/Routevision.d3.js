var width = 960,
    height = 1000,
    centered;

var projection = d3.geo.mercator()
    .scale(1416800)
    .translate([481900,160600]);

// var projection = d3.geo.albers()
//     .scale(305000)
//     .translate([100600,12000]);

var bus_projection = d3.geo.mercator()
    .scale(1423620)
    .translate([-544732,-91200]);

var path = d3.geo.path()
    .projection(projection);

var svg = d3.select("#map").append("svg")
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
    // .attr("transform", "rotate(36)")
    .attr("id", "cells");

var quantize = d3.scale.quantize()
    .range(d3.range(9));

d3.json("/assets/sf_dcp.geojson", function(json) {

      states.selectAll("path")
        .data(json.features)
        .enter().append("path")
          .attr("d", path)
          .attr("fill", "lightgrey");

});

plot_vehicles();
setInterval(plot_vehicles, (10 * 1000));

function plot_vehicles() {
    console.log("plotting vehicles");
    d3.json("/api/vehicles", function(json) {
        console.log(json);
          plot_bunch(json);
    });

    d3.json("/api/service_reports", function(json) {
        window.j = json;
        json.forEach( function (report) {
            console.log(report);
            // cells.selectAll("circle")[0][id_mapper.indexOf(String(6404))].style.fill="red";
            try {
                cells.selectAll("circle")[0][id_mapper.indexOf(String(report.vehicle_id))].style.fill="red";
                cells.selectAll("circle")[0][id_mapper.indexOf(String(report.vehicle_id))].setAttribute("r",7);
            }
            catch (err) {
                console.log("error with vehicle id :: " + String(report.vehicle_id));
            }
        })
    });
}

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

var id_mapper = [];
function plot_bunch(bunch) {
  window.bunch = bunch
    points = _.map(bunch, function(val) {
        id_mapper.push(val.id);
        return bus_projection([+val.lat+100, +val.lon+100]);
    });

    var positions = [];
    var names = [];

    cells.selectAll("path")
    .data(points)
    .enter()
        .append("circle")
            .attr("cx", function(d, i) { return (+d[0]); })
            .attr("cy", function(d, i) { return (+d[1]); })
            .attr("stroke", "white")
            .attr("stroke-opacity", 1)
            .attr("stroke-width", 1.2)
            .attr("fill", "black")
            .attr("fill-opacity", .7)
            .attr("r", 3.4);
}

// make our queue




// making line graphs...

// data2["displayNames"] = ["2xx","","",""];
// data3["displayNames"] = ["","2xx"];
// data2["colors"] = ["steelblue","clear","clear","clear"];
// data3["colors"] = ["clear", "steelblue"]
// data["scale"] = "linear";
// data["axis"] = ["right"];
// data["numAxisLabelsLinearScale"] = 3;
// data2["marginLeft"] = 20;
// data2["marginRight"] = 10;

// create graph now that we've added presentation config
var l1 = new LineGraph({containerId: 'graph1', data: data2});
var l2 = new LineGraph({containerId: 'graph2', data: data3});


setInterval(function() {
        /*
        * The following will simulate live updating of the data (see dataA, dataB, dataC etc in data.js which are real examples)
        * This is being simulated so this example functions standalone without a backend server which generates data such as data.js contains.
        */
        // for each data series ...
        var newData = [];
        data.values.forEach(function(dataSeries, index) {
            // take the first value and move it to the end
            // and capture the value we're moving so we can send it to the graph as an update
            var v = dataSeries.shift();
            dataSeries.push(v);
            // put this value in newData as an array with 1 value
            newData[index] = [v];
        })
        
        // we will reuse dataA each time
        dataA.values = newData;
        // increment time 1 step
        dataA.start = dataA.start + dataA.step;
        dataA.end = dataA.end + dataA.step; 
                    
        l1.slideData(dataA);
    }, 2000);




