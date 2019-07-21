<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard</title>

<%@ include file="/WEB-INF/views/admin/include/head.jsp"%>
<style>
#chartdiv {
  width: 100%;
  height: 500px;
}
#chartdiv1 {
  width: 50%;
  height: 500px;
}
</style>
<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
</head>
<body class="nav-md">
    <div class="container body">
		<div class="main_container">
      
		<!-- begin sidebar -->
		<%@ include file="/WEB-INF/views/admin/include/sideBar.jsp"%>
		<!-- end sidebar -->

		<!-- begin content -->
		
		<div class="right_col" role="main">
			<div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Weekly Statistics <small>purchase</small></h2>

                    <div id="container" style="min-width: 100%; height: 400px; margin: 0 auto"></div>
                  </div>
                  <div class="x_content">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                      <div class="tiles">
                        <div class="col-md-4 tile">
                          <span>Total Repurchase</span>
                          <h2 id="totalRebuy"></h2>
                          <span class="sparkline11 graph" style="height: 160px;">
                               <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                          </span>
                        </div>
                        <div class="col-md-4 tile">
                          <span>Total Purchase Via Photo</span>
                          <h2 id="totalBuyPhoto"></h2>
                          <span class="sparkline22 graph" style="height: 160px;">
                                <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                          </span>
                        </div>
                        <div class="col-md-4 tile">
                          <span>Total Purchase Via Photo</span>
                          <h2 id="totalBuyShop"></h2>
                          <span class="sparkline11 graph" style="height: 160px;">
                                 <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                          </span>
                        </div>
                      </div>

                    </div>


                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-md-6">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Weekly Statistics <small>purchase</small></h2>
					<div id="container1" style="min-width: 100%; height: 400px; margin: 0 auto"></div>
					<br>

                    
                  </div>






                </div>
              </div>
              <div class="col-md-6">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Weekly Statistics <small>purchase</small></h2>
					<div id="container2" style="min-width: 100%; height: 400px; margin: 0 auto"></div>
					<br>

                    
                  </div>






                </div>
              </div>
            </div>
		</div>
		  

        <!-- end content -->
		
		<!-- begin footer -->
		<%@ include file="/WEB-INF/views/admin/include/footer.jsp"%>
		<!-- end footer -->
		
		
		</div>
	</div>

</body>
</html>

<script>
var pNum = ${pNum};
var performanceJson = JSON.parse('${pList}');
console.log(performanceJson[pNum-1]);
console.log(pNum);

function percentageFn(num){
	var prdtPhotoNum =performanceJson[pNum-num].prdtPhoto;
	var photoViewNum =performanceJson[pNum-num].photoViews;
	var percent = prdtPhotoNum/photoViewNum;

	return percent*100;
}
percentageFn(5);


var totalRebuy = 0;
var totalBuyPhoto = 0;
var totalBuyShop = 0;

for(var i = pNum-5; pNum > i; i++) {
	totalRebuy +=  performanceJson[i].rebuy;
	totalBuyPhoto +=  performanceJson[i].buyPhoto;
	totalBuyShop +=  performanceJson[i].buyShop;
}

$('#totalRebuy').html(totalRebuy + "건");
$('#totalBuyPhoto').html(totalBuyPhoto + "건");
$('#totalBuyShop').html(totalBuyShop + "건");

Highcharts.chart('container', {
	colors: ['#3D96AE',
		   '#DB843D', '#92A8CD', '#A47D7C', '#B5CA92'],
    chart: {
        type: 'area'
    },
    title: {
        text: 'Purchase Pattern'
    },
    subtitle: {
        text: 'Tag #'
    },
    xAxis: {
        categories: [performanceJson[pNum-5].baseDate, performanceJson[pNum-4].baseDate, performanceJson[pNum-3].baseDate, performanceJson[pNum-2].baseDate, performanceJson[pNum-1].baseDate],
        tickmarkPlacement: 'on',
        title: {
            enabled: false
        }
    },
    yAxis: {
        title: {
            text: ''
        },
        labels: {
            formatter: function () {
                return this.value;
            }
        }
    },
    tooltip: {
        split: true,
        valueSuffix: '건'
    },
    plotOptions: {
        area: {
            stacking: 'normal',
            lineColor: '#666666',
            lineWidth: 2,
            marker: {
                lineWidth: 2,
                lineColor: '#fff',
                enabled: false
            }
        }
    },
    series: [{
        name: 'BuyPhoto',
        data: [performanceJson[pNum-14].buyPhoto,performanceJson[pNum-13].buyPhoto,performanceJson[pNum-12].buyPhoto,performanceJson[pNum-11].buyPhoto,performanceJson[pNum-10].buyPhoto,performanceJson[pNum-9].buyPhoto,performanceJson[pNum-8].buyPhoto,performanceJson[pNum-7].buyPhoto,performanceJson[pNum-6].buyPhoto,performanceJson[pNum-5].buyPhoto, performanceJson[pNum-4].buyPhoto, performanceJson[pNum-3].buyPhoto, performanceJson[pNum-2].buyPhoto, performanceJson[pNum-1].buyPhoto]
    }, {
        name: 'BuyShop',
        data: [performanceJson[pNum-14].buyShop, performanceJson[pNum-13].buyShop, performanceJson[pNum-12].buyShop, performanceJson[pNum-11].buyShop,performanceJson[pNum-10].buyShop, performanceJson[pNum-9].buyShop, performanceJson[pNum-8].buyShop, performanceJson[pNum-7].buyShop, performanceJson[pNum-6].buyShop,performanceJson[pNum-5].buyShop, performanceJson[pNum-4].buyShop, performanceJson[pNum-3].buyShop, performanceJson[pNum-2].buyShop, performanceJson[pNum-1].buyShop]
    }, {
        name: 'Rebuy',
        data: [performanceJson[pNum-14].rebuy, performanceJson[pNum-13].rebuy, performanceJson[pNum-12].rebuy, performanceJson[pNum-11].rebuy, performanceJson[pNum-10].rebuy,performanceJson[pNum-9].rebuy, performanceJson[pNum-8].rebuy, performanceJson[pNum-7].rebuy, performanceJson[pNum-6].rebuy, performanceJson[pNum-5].rebuy,performanceJson[pNum-4].rebuy, performanceJson[pNum-3].rebuy, performanceJson[pNum-2].rebuy, performanceJson[pNum-1].rebuy]
    }]
});


Highcharts.chart('container1', {
	  colors: ['#3D96AE',
		   '#DB843D', '#92A8CD', '#A47D7C', '#B5CA92'],
	  chart: {
	    type: 'column'
	  },
	  title: {
	    text: 'Product Views Via Photos Percentage'
	  },
	  subtitle: {
	    text: ''
	  },
	  xAxis: {
	    type: 'category'
	  },
	  yAxis: {
	    title: {
	      text: 'Product Views Via Photos percent(%)'
	    }

	  },
	  legend: {
	    enabled: false
	  },
	  plotOptions: {
	    series: {
	      borderWidth: 0,
	      dataLabels: {
	        enabled: true,
	        format: '{point.y:.1f}%'
	      }
	    }
	  },

	  tooltip: {
	    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
	  },

	  series: [
	    {
	      name: "Date",
	      colorByPoint: true,
	      data: [
	        {
	          name: performanceJson[pNum-5].baseDate,
	          y: percentageFn(5),
	          drilldown: null
	        },
	        {
	          name: performanceJson[pNum-4].baseDate,
	          y: percentageFn(4),
	          drilldown: null
	        },
	        {
	          name: performanceJson[pNum-3].baseDate,
	          y: percentageFn(3),
	          drilldown: null
	        },
	        {
	          name: performanceJson[pNum-2].baseDate,
	          y: percentageFn(2),
	          drilldown: null
	        },
	        {
	          name: performanceJson[pNum-1].baseDate,
	          y: percentageFn(1),
	          drilldown: null
	        }
	      ]
	    }
	  ]
	});
	
Highcharts.chart('container2', {
	  chart: {
	    zoomType: 'xy'
	  },
	  title: {
	    text: 'Photo Views and Sales'
	  },
	  subtitle: {
	    text: 'correlation'
	  },
	  xAxis: [{
	    categories: [performanceJson[pNum-5].baseDate, performanceJson[pNum-4].baseDate, performanceJson[pNum-3].baseDate, performanceJson[pNum-2].baseDate, performanceJson[pNum-1].baseDate],
	    crosshair: true
	  }],
	  yAxis: [{ // Primary yAxis
	    labels: {
	      format: '{value}$',
	      style: {
	        color: Highcharts.getOptions().colors[1]
	      }
	    },
	    title: {
	      text: 'Sales',
	      style: {
	        color: Highcharts.getOptions().colors[1]
	      }
	    }
	  }, { // Secondary yAxis
	    title: {
	      text: 'Photo Views',
	      style: {
	        color: Highcharts.getOptions().colors[0]
	      }
	    },
	    labels: {
	      format: '{value}',
	      style: {
	        color: Highcharts.getOptions().colors[0]
	      }
	    },
	    opposite: true
	  }],
	  tooltip: {
	    shared: true
	  },
	  legend: {
	    layout: 'vertical',
	    align: 'left',
	    x: 120,
	    verticalAlign: 'top',
	    y: 100,
	    floating: true,
	    backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || 'rgba(255,255,255,0.25)'
	  },
	  series: [{
	    name: 'photo views',
	    type: 'column',
	    yAxis: 1,
	    data: [performanceJson[pNum-5].photoViews, performanceJson[pNum-4].photoViews, performanceJson[pNum-3].photoViews, performanceJson[pNum-2].photoViews, performanceJson[pNum-1].photoViews],
	    tooltip: {
	      valueSuffix: ' mm'
	    }

	  }, {
	    name: 'sales',
	    type: 'spline',
	    data: [performanceJson[pNum-5].sales, performanceJson[pNum-4].sales, performanceJson[pNum-3].sales, performanceJson[pNum-2].sales, performanceJson[pNum-1].sales],
	    tooltip: {
	      valueSuffix: '°C'
	    }
	  }]
	});
</script>