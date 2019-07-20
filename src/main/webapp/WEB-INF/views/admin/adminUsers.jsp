<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Dashboard</title>

<%@ include file="/WEB-INF/views/admin/include/head.jsp"%>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
</head>
<body class="nav-md">
    <div class="container body">
		<div class="main_container">
      
		<!-- begin sidebar -->
		<%@ include file="/WEB-INF/views/admin/include/sideBar.jsp"%>
		<!-- end sidebar -->

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
          </div>
          <br />
		

		  <table id="example" class="table table-striped table-bordered" style="width:100%">
				<thead>
		             <tr>
		                 <th>userid</th>
		                 <th>enabled</th>
		                 <th>email</th>
		                 <th>phone</th>
		                 <th>createDate</th>
		                 <th>updateDate</th>
		             </tr>
		         </thead>
	      </table>
		</div>
        <!-- end content -->
		
		<!-- begin footer -->
		<%@ include file="/WEB-INF/views/admin/include/footer.jsp"%>
		<!-- end footer -->
		
		
		</div>
	</div>
</body>
</html>

<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
  	
<script>
var performanceJson = JSON.parse('${pList}');
var pNum = ${pNum};
$('#totalUsers').html(performanceJson[pNum-1].users);
$('#signUp').html(performanceJson[pNum-1].signup);
$('#buyPhoto').html(performanceJson[pNum-1].buyPhoto);
$('#buyShop').html(performanceJson[pNum-1].buyShop);
$('#photoViews').html(performanceJson[pNum-1].photoViews);
$('#sales').html(performanceJson[pNum-1].sales);
$(function(){
	var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	var curl = ctx + "/admin" +"/usersList";
	$('#example').dataTable({
        pageLength: 5,
        bPaginate: true,
        bLengthChange: true,
        lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
        bAutoWidth: false,
        processing: true,
        ordering: true,
        serverSide: false,
        searching: true,
        ajax : {
            "url":curl,
            "type":"POST",
            "data": function (d) {
                d.userStatCd = "NR";
            }
        },
        columns : [
        	{data: "userid"},
            {data: "enabled"},
            {data: "email"},
            {data: "phone"},
            {data: "createDate"},
            {data: "updateDate"}
        ]

    });
});

</script>

