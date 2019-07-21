<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

</style>

</head>
<body class="nav-md">
    <div class="container body">
		<div class="main_container">
      
		<!-- begin sidebar -->
		<%@ include file="/WEB-INF/views/admin/include/sideBar.jsp"%>
		<!-- end sidebar -->

		<!-- begin content -->
		
		<!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Users</span>
              <div class="count" id="totalUsers"></div>

            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> New Sign Up</span>
              <div class="count" id="signUp"></div>

            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Sales</span>
              <div class="count green" id="sales"></div>

            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Photo Views</span>
              <div class="count" id="photoViews"></div>

            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Purchase via Photo</span>
              <div class="count" id="buyPhoto"></div>

            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Purchase via Shop</span>
              <div class="count" id="buyShop"></div>

            </div>
          </div>
          <!-- /top tiles -->

<div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Joined Number <small>Monthly progress</small></h2>

                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <div class="col-md-9 col-sm-12 col-xs-12">          
                      <div id="chartdiv"></div>
                      
                    </div>

                    <div class="col-md-3 col-sm-12 col-xs-12">
                      <div>
                        <div class="x_title">
                          <h2>Monthly Information</h2>
                          <ul class="nav navbar-right panel_toolbox">

                          </ul>
                          <div class="clearfix"></div>
                        </div>
                        <ul class="list-unstyled top_profiles scroll-view">
                        	<c:set var="list" value="${topList}"></c:set>
                        	<c:set var="dateList" value="${topDateList}"></c:set>
                          <c:forEach var="i" begin="${list.size()-5}" end="${list.size()-1}">
                          	<li class="media event">
	                            <div class="media-body">
	                              <a class="title" href="#">${dateList[i]}</a>
	                              <p><strong>${list[i].signup } </strong> sign up </p>
	                              <p> <small>${list[i].sales } Sales Today</small>
	                              </p>
	                            </div>
                          	</li>
                          </c:forEach>
                        </ul>
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

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/kelly.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>



<script>

function numberFormat(number) {
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return number.toString().replace(regexp, ',');
}

var pNum = ${pNum};
var dateList = JSON.parse('${dateList2}');
var performanceJson = JSON.parse('${pList}');

$('#totalUsers').html(performanceJson[pNum-1].users);
$('#signUp').html(performanceJson[pNum-1].signup);
$('#buyPhoto').html(performanceJson[pNum-1].buyPhoto);
$('#buyShop').html(performanceJson[pNum-1].buyShop);
$('#photoViews').html(performanceJson[pNum-1].photoViews);
$('#sales').html(performanceJson[pNum-1].sales);
am4core.ready(function() {

	// Themes begin
	am4core.useTheme(am4themes_kelly);
	am4core.useTheme(am4themes_animated);
	// Themes end



	// Create chart instance
	var chart = am4core.create("chartdiv", am4charts.XYChart);

	// Add data
	chart.data = [{
      "date": dateList[pNum-1],
      "price": performanceJson[pNum-1].signup
    }, {
      "date": dateList[pNum-2],
      "price": performanceJson[pNum-2].signup
    }, {
      "date": dateList[pNum-3],
      "price": performanceJson[pNum-3].signup
    }, {
      "date": dateList[pNum-4],
      "price": performanceJson[pNum-4].signup
    }, {
      "date": dateList[pNum-5],
      "price": performanceJson[pNum-5].signup
    }, {
      "date": dateList[pNum-6],
      "price": performanceJson[pNum-6].signup
    }, {
      "date": dateList[pNum-7],
      "price": performanceJson[pNum-7].signup
    }, {
      "date": dateList[pNum-8],
      "price": performanceJson[pNum-8].signup
    }, {
      "date": dateList[pNum-9],
      "price": performanceJson[pNum-9].signup
    }, {
      "date": dateList[pNum-10],
      "price": performanceJson[pNum-10].signup
    }, {
      "date": dateList[pNum-11],
      "price": performanceJson[pNum-11].signup
    }, {
      "date": dateList[pNum-12],
      "price": performanceJson[pNum-12].signup
    }, {
      "date": dateList[pNum-13],
      "price": performanceJson[pNum-13].signup
    }, {
      "date": dateList[pNum-14],
      "price": performanceJson[pNum-14].signup
    }];

	// Create axes
	var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
	dateAxis.renderer.grid.template.location = 0;
	dateAxis.renderer.minGridDistance = 50;

	var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis.logarithmic = true;
	valueAxis.renderer.minGridDistance = 20;

	// Create series
	var series = chart.series.push(new am4charts.LineSeries());
	series.dataFields.valueY = "price";
	series.dataFields.dateX = "date";
	series.tensionX = 0.8;
	series.strokeWidth = 3;

	var bullet = series.bullets.push(new am4charts.CircleBullet());
	bullet.circle.fill = am4core.color("#fff");
	bullet.circle.strokeWidth = 3;

	// Add cursor
	chart.cursor = new am4charts.XYCursor();
	chart.cursor.fullWidthLineX = true;
	chart.cursor.xAxis = dateAxis;
	chart.cursor.lineX.strokeWidth = 0;
	chart.cursor.lineX.fill = am4core.color("#000");
	chart.cursor.lineX.fillOpacity = 0.1;



	}); // end am4core.ready()
</script>
