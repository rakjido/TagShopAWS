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
  height: 700px;
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

</head>
<body class="nav-md">
    <div class="container body">
		<div class="main_container">
      
		<!-- begin sidebar -->
		<%@ include file="/WEB-INF/views/admin/include/sideBar.jsp"%>
		<!-- end sidebar -->

		<!-- begin content -->
		
		<div class="right_col" role="main">
		
			<div class="row top_tiles">
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon" style="top:40px;"><i class="fa fa-caret-square-o-right"></i></div>
                  <div class="count" id= "percentageSignUp">123</div>
                  <h3>Sign ups</h3>
                  <p>Weekly</p>
                </div>
              </div>

              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon" style="top:40px;"><i class="fa fa-caret-square-o-right"></i></div>
                  <div class="count" id= "percentagePhotoViews"></div>
                  <h3>Photo Views</h3>
                  <p>Weekly</p>
                </div>
              </div>
              
			  <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"  style="top:40px;"><i class="fa fa-comments-o"></i></div>
                  <div class="count" id= "percentageUsers"></div>
                  <h3>Users</h3>
                  <p>Weekly</p>
                </div>
              </div>
              
              <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                <div class="tile-stats">
                  <div class="icon"  style="top:40px;"><i class="fa fa-comments-o"></i></div>
                  <div class="count" id= "percentageUsers2"></div>
                  <h3>Users</h3>
                  <p>Weekly</p>
                </div>
              </div>
            </div>
            
			<div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Weekly Statistics <small>users</small></h2>
                    <div id="chartdiv"></div>
                    
                  </div>
                  <div class="x_content">
                    <div class="col-md-12 col-sm-12 col-xs-12">

                      <div class="tiles">
                        <div class="col-md-4 tile">
                          <span>Total Users</span>
                          <h2 id="totalUsers"></h2>
                          <span class="sparkline11 graph" style="height: 160px;">
                               <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                          </span>
                        </div>
                        <div class="col-md-4 tile">
                          <span>Total SignUp</span>
                          <h2 id="totalSignUp"></h2>
                          <span class="sparkline22 graph" style="height: 160px;">
                                <canvas width="200" height="60" style="display: inline-block; vertical-align: top; width: 94px; height: 30px;"></canvas>
                          </span>
                        </div>
                        <div class="col-md-4 tile">
                          <span>Total View</span>
                          <h2 id="totalViews"></h2>
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

function numberFormat(number) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return number.toString().replace(regexp, ',');
}

var pNum = ${pNum};
var performanceJson = JSON.parse('${pList}');
var dateList = JSON.parse('${dateList2}');
console.log(performanceJson[pNum-1]);
console.log(pNum);

function percentageFn(num){
	var prdtPhotoNum =performanceJson[pNum-num].prdtPhoto;
	var photoViewNum =performanceJson[pNum-num].photoViews;
	var percent = prdtPhotoNum/photoViewNum;

	return percent*100;
}



var totalSignUp = 0;
var totalViews = 0;
var beforeSignUp = 0;
var beforePhotoView = 0;

for(var i = pNum-7; pNum > i; i++) {
	totalSignUp +=  performanceJson[i].signup;
	totalViews += performanceJson[i].photoViews;
}

var percentageUsers = performanceJson[pNum-1].users - performanceJson[pNum-8].users;
var percentageUsers2 = performanceJson[pNum-1].users - performanceJson[pNum-31].users;

$('#percentageUsers').html(percentageUsers);
$('#percentageUsers2').html(percentageUsers2);
$('#totalSignUp').html(totalSignUp + "명");
$('#totalViews').html(numberFormat(totalViews) + "건");
$('#totalUsers').html(performanceJson[pNum-1].users + "명");

for(var i = pNum-14; pNum-7 > i; i++) {
	beforePhotoView += performanceJson[i].photoViews
	beforeSignUp +=  performanceJson[i].signup;
}

var percentageSignUp = totalSignUp-beforeSignUp;
var percentagePhotoViews = totalViews-beforePhotoView;

$('#percentageSignUp').html(percentageSignUp);
$('#percentagePhotoViews').html(percentagePhotoViews);

am4core.ready(function() {

	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var chart = am4core.create("chartdiv", am4charts.XYChart);

	// Add data
	chart.data = [{
    
    "date" : dateList[pNum - 1],
            "market1" : performanceJson[pNum - 1].signup,
            "sales1" : performanceJson[pNum - 1].users
        }, {
            "date" : dateList[pNum - 2],
            "market1" : performanceJson[pNum - 2].signup,
            "sales1" : performanceJson[pNum - 2].users
        }, {
            "date" : dateList[pNum - 3],
            "market1" : performanceJson[pNum - 3].signup,
            "sales1" : performanceJson[pNum - 3].users
        }, {
            "date" : dateList[pNum - 4],
            "market1" : performanceJson[pNum - 4].signup,
            "sales1" : performanceJson[pNum - 4].users
        }, {
            "date" : dateList[pNum - 5],
            "market1" : performanceJson[pNum - 5].signup,
            "sales1" : performanceJson[pNum - 5].users
        }, {
            "date" : dateList[pNum - 6],
            "market1" : performanceJson[pNum - 6].signup,
            "sales1" : performanceJson[pNum - 6].users
        }, {
            "date" : dateList[pNum - 7],
            "market1" : performanceJson[pNum - 7].signup,
            "sales1" : performanceJson[pNum - 7].users
        }, {
            "date" : dateList[pNum - 8],
            "market1" : performanceJson[pNum - 8].signup,
            "sales1" : performanceJson[pNum - 8].users
        }, {
            "date" : dateList[pNum - 9],
            "market1" : performanceJson[pNum - 9].signup,
            "sales1" : performanceJson[pNum - 9].users
        }, {
            "date" : dateList[pNum - 10],
            "market1" : performanceJson[pNum - 10].signup,
            "sales1" : performanceJson[pNum - 10].users
        }, {
            "date" : dateList[pNum - 11],
            "market1" : performanceJson[pNum - 11].signup,
            "sales1" : performanceJson[pNum - 11].users
        }, {
            "date" : dateList[pNum - 12],
            "market1" : performanceJson[pNum - 12].signup,
            "sales1" : performanceJson[pNum - 12].users
        }, {
            "date" : dateList[pNum - 13],
            "market1" : performanceJson[pNum - 13].signup,
            "sales1" : performanceJson[pNum - 13].users
        }, {
            "date" : dateList[pNum - 14],
            "market1" : performanceJson[pNum - 14].signup,
            "sales1" : performanceJson[pNum - 14].users
        }];

	// Create axes
	var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
	//dateAxis.renderer.grid.template.location = 0;
	//dateAxis.renderer.minGridDistance = 30;

	var valueAxis1 = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis1.title.text = "Sales";

	var valueAxis2 = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis2.title.text = "SignUp";
	valueAxis2.renderer.opposite = true;
	valueAxis2.renderer.grid.template.disabled = true;

	// Create series
	var series1 = chart.series.push(new am4charts.ColumnSeries());
	series1.dataFields.valueY = "sales1";
	series1.dataFields.dateX = "date";
	series1.yAxis = valueAxis1;
	series1.name = "Sales";
	series1.tooltipText = "{name}\n[bold font-size: 20]${valueY}[/]";
	series1.fill = chart.colors.getIndex(0);
	series1.strokeWidth = 0;
	series1.clustered = false;
	series1.columns.template.width = am4core.percent(40);


	var series3 = chart.series.push(new am4charts.LineSeries());
	series3.dataFields.valueY = "market1";
	series3.dataFields.dateX = "date";
	series3.name = "SignUp";
	series3.strokeWidth = 2;
	series3.tensionX = 0.7;
	series3.yAxis = valueAxis2;
	series3.tooltipText = "{name}\n[bold font-size: 20]{valueY}[/]";

	var bullet3 = series3.bullets.push(new am4charts.CircleBullet());
	bullet3.circle.radius = 3;
	bullet3.circle.strokeWidth = 2;
	bullet3.circle.fill = am4core.color("#fff");



	// Add cursor
	chart.cursor = new am4charts.XYCursor();

	// Add legend
	chart.legend = new am4charts.Legend();
	chart.legend.position = "top";

	// Add scrollbar
	chart.scrollbarX = new am4charts.XYChartScrollbar();
	chart.scrollbarX.series.push(series1);
	chart.scrollbarX.series.push(series3);
	chart.scrollbarX.parent = chart.bottomAxesContainer;

	}); // end am4core.ready()
</script>