<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	
	<%@ include file="/WEB-INF/views/include/head.jsp"%>
	
	<!-- css 넣으세요 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/management.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 본문 시작 -->
	<!-- ##### Blog Wrapper Area Start ##### -->
    <div class="single-blog-wrapper">

        <!-- Single Blog Post Thumb -->
        <div class="single-blog-post-thumb">
            <img src="${pageContext.request.contextPath}/resources/img/bg-img/bg-8.jpg" alt="">
        </div>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-8">
				<div>
				<h2>Sales management</h2>
				</div>
				<div class="regular-page-content-wrapper section-padding-5">
					<div class="regular-page-text">
                            <div class="select-box d-flex mt-30 mb-30">
                                <div class="col-2 p-0 pr-4">
                                    <select name="select" id="orderStatusCode" class="w100">
                                        <option value="TOTL">전체</option>
										<option value="OR02">입금대기</option>
										<option value="OR03">결제완료</option>
										<option value="OR04">배송준비</option>
										<option value="OR05">배송중</option>
										<option value="OR06">배송완료</option>
										<option value="OR07">구매완료</option>
										<option value="OR08">리뷰작성</option>
										<option value="OR09">취소</option>
										<option value="OR10">교환</option>
										<option value="OR11">환불</option>
                                    </select>
                                </div>
                                <div>
                                    <input type="text" class="inputbox" id="fromDatepicker" value="">
                                </div>
                                <div>
                                    <img class="w50" src="${pageContext.request.contextPath}/resources/img/sample-img/calendar.png" alt="">
                                </div>

                                <div class="wave" align="center">
                                    ~
                                </div>

                                <div>
                                    <input type="text" class="inputbox" id="toDatepicker" value="">
                                </div>
                                <div>
                                    <img class="w50" src="${pageContext.request.contextPath}/resources/img/sample-img/calendar.png" alt="">
                                </div>
                                
                                <div class="leftmargin2">
                                    <a href="${pageContext.request.contextPath}/shops/${sessionScope.userid}/management/pdfDown">
                                    <img class="pdfdownload" src="${pageContext.request.contextPath}/resources/img/sample-img/pdf.png" alt="">
                                    </a>
                                </div>
                                
                                <div class="leftmargin">
                                <a href="${pageContext.request.contextPath}/shops/${sessionScope.userid}/management/excelDown">
                                    <img class="exceldownload" src="${pageContext.request.contextPath}/resources/img/sample-img/excel.png" alt="">
                                </a>
                                </div>
                           
							
	                            </div>
                            
                            
                            <table id="example" class="table table-striped table-bordered" style="width:100%">
									<thead>
							             <tr>
							                 <th>DATETIMES</th>
							                 <th>USERID</th>
							                 <th>DELIVERYFEE</th>
							                 <th>PRODUCTNAME</th>
							                 <th>UNITPRICE</th>
							                 <th>QUANTITY</th>
							                 <th>ORDERSTATUSCODE</th>
							             </tr>
							         </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Blog Wrapper Area End ##### -->
	<!-- 본문 끝 -->
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
    
    <!-- js파일 ! -->

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 	<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
  	<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
<script>
		
	    $( function() {
		    $("#fromDatepicker").datepicker({dateFormat: 'yy-mm-dd'});
		    $("#fromDatepicker").datepicker("setDate", -365);
		    
		    $("#toDatepicker").datepicker({dateFormat: 'yy-mm-dd'});
		    $("#toDatepicker").datepicker("setDate", "-0d");
		    
		    var curl = ctx + "/shops" +"/management";
		   
		    
		    $.getSalesTable = function (){
			    var param = {"fromDate" : $('#fromDatepicker').val(),
	    				 "toDate"   : $('#toDatepicker').val(),
	    				 "shopid"   : "${sessionScope.shopid}",
	    				 "orderStatusCode" : $('#orderStatusCode').val()};
			    
		    	 	$('#example').dataTable({
		    	 		    destroy : true,
		                pageLength: 3,
		                bPaginate: true,
		                bLengthChange: true,
		                lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
		                bAutoWidth: false,
		                processing: true,
		                ordering: true,
		                serverSide: false,
		                paging: false,
		                searching: false,
		                ajax : {
		                    "url":curl,
		                    "type":"POST",
		                    "data": param
		                },
		                columns : [
		                	{data: "dateTimes"},
		                    {data: "userid"},
		                    {data: "deliveryFee"},
		                    {data: "productName"},
		                    {data: "unitPrice"},
		                    {data: "quantity"},
		                    {data: "orderStatusCode"}
		                ]
		 
		       });
		    }
		    
		    $.getSalesTable();
		    
		    $('#fromDatepicker , #toDatepicker, #orderStatusCode').change(function(){
		    		$.getSalesTable();
    			});
		    
	   });
	
	</script>