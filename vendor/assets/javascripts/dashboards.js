/* Webarch Admin Dashboard
 /* This JS is only for DEMO Purposes - Extract the code that you need
 -----------------------------------------------------------------*/
$(document).ready(function() {

// var novembro = new Date('11/01/2014').getTime();
// var dezembro = new Date('12/01/2014').getTime();
// var janeiro = new Date('01/01/2015').getTime();

// var data = [ { x: novembro, y: 10 }, { x: dezembro, y: 50 }, { x: janeiro, y: 100 } ];
// //new Date() / 1000;

// var graph = new Rickshaw.Graph( {
//         element: document.querySelector("#ricksaw"),
//         width: 600,
//         height: 300,
//         renderer: 'bar',
//         series: [ {
//                 color: 'steelblue',
//                 data: data
//         },
//         {
//                 color: 'steelblue',
//                 data: [{ x: dezembro, y: 50 }]
//         } ]
// } );

// var xAxis = new Rickshaw.Graph.Axis.X({
//   graph: graph,
//   tickFormat: function(x){
//     var date = new Date(x).getMonth();
//     switch (date) {
//         case 10:
//             day = "novembro";
//             break;
//         case 11:
//             day = "dezembro";
//             break;
//         case 0:
//             day = "janeiro";
//             break;
//     }
//      return day;
//     }
// })
// xAxis.render();

// var yAxis = new Rickshaw.Graph.Axis.Y({
//   graph: graph,
//   tickFormat: function(x){
//      return x;
//     }
// })
// yAxis.render();

// graph.render();

    loadSalesSparkline();

    loadSampleChart();

    function loadSampleChart(){


        var seriesData_5 = [ [], [],[]];

        var random = new Rickshaw.Fixtures.RandomData(50);

        for (var i = 0; i < 50; i++) {
            random.addData(seriesData_5);
        }
        console.log(seriesData_5);
        ricksaw = new Rickshaw.Graph( {
            element: document.querySelector('#ricksaw'),
            height: 200,
            renderer: 'bar',
            series: [
                {
                    data: seriesData_5[0],
                    color: '#736086',
                    name:'novembro/2014'
                },{
                    data: seriesData_5[1],
                    color: '#f8a4a3',
                    name:'dezembro/2014'
                },
                {
                    data: seriesData_5[2],
                    color: '#eceff1',
                    name:'janeiro/2015'
                }
            ]
        } );

        var hoverDetail = new Rickshaw.Graph.HoverDetail( {
            graph: ricksaw
        });

            random.addData(seriesData_5);
        ricksaw.update();

        var ticksTreatment = 'glow';

        var xAxis = new Rickshaw.Graph.Axis.Time( {
            graph: ricksaw,
            ticksTreatment: ticksTreatment,
            timeFixture: new Rickshaw.Fixtures.Time()
        });

        xAxis.render();

        var yAxis = new Rickshaw.Graph.Axis.Y( {
            graph: ricksaw,
            tickFormat: Rickshaw.Fixtures.Number.formatKMBT,
            ticksTreatment: ticksTreatment
        });

        var legend = new Rickshaw.Graph.Legend( {
            graph: ricksaw,
            element: document.getElementById('legend')
        });

        yAxis.render();

        var shelving = new Rickshaw.Graph.Behavior.Series.Toggle( {
            graph: ricksaw,
            legend: legend
        } );

        var order = new Rickshaw.Graph.Behavior.Series.Order( {
            graph: ricksaw,
            legend: legend
        } );

        var highlighter = new Rickshaw.Graph.Behavior.Series.Highlight( {
            graph: ricksaw,
            legend: legend
        } );

        //Sparkline Charts
        $("#mini-chart-orders").sparkline([1,4,6,2,0,5,6,4,6], {
            type: 'bar',
            height: '30px',
            barWidth: 6,
            barSpacing: 2,
            barColor: '#f35958',
            negBarColor: '#f35958'
        });
        //Sparkline Charts
        $("#mini-chart-other").sparkline([1,4,6,2,0,5,6,4], {
            type: 'bar',
            height: '30px',
            barWidth: 6,
            barSpacing: 2,
            barColor: '#0aa699',
            negBarColor: '#0aa699'
        });
    }

    function loadSalesSparkline(){
        $("#sales-sparkline").sparkline([4,6,5,7,5,5], {
            type: 'line',
            width: '100%',
            height: '20%',
            lineColor: '#ffffff',
            lineWidth: 2,
            fillColor: '#0aa699',
            spotColor: '#ffffff',
            minSpotColor: '#ffffff',
            maxSpotColor: '#f35958',
            spotRadius: 5,
            normalRangeMin: 1
        });
    }

    $("#earnings-chart").sparkline([0,4,4,5,6,8,3,2,2,4,6,7], {
        type: 'line',
        width: '100%',
        height: '150px',
        lineColor: 'rgba(255, 255, 255, 0.2)',
        fillColor: 'rgba(255, 255, 255, 0.2)'});

});
