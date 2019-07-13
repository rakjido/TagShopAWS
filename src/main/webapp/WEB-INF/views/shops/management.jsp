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
                    <div class="regular-page-content-wrapper section-padding-80">
                        <div class="regular-page-text">
                            <h2>Marketing management</h2>
                            <div class="select-box d-flex mt-30 mb-30">
                                <div class="col-3">
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
                                <div class="col-3 mr0 pl0">
                                    <input type="text" class="form-control mr0" id="fromDatepicker" value="">
                                </div>
                                <div class="col-1 mr0 pl0">
                                	
                                    <img src="${pageContext.request.contextPath}/resources/img/sample-img/calendar.png" alt="">
                                </div>

                                <div class="col-1 mr0 pl0 pr0" align="center">
                                    ~
                                </div>

                                <div class="col-3 mr0 pl0">
                                    <input type="text" class="form-control mr0" id="toDatepicker" value="">
                                </div>
                                <div class="col-1 mr0 pl0">
                                    <img src="${pageContext.request.contextPath}/resources/img/sample-img/calendar.png" alt="">
                                </div>
                            </div>

                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>판매자</th>
                                            <th>상품명</th>
                                            <th>가격</th>
                                            <th>수량</th>
                                            <th>상태 코드</th>
                                            <th>배송비</th>
                                            <th>날짜</th>
                                        </tr>
                                    </thead>
                                    <tbody id="jqBody">

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>판매자</th>
                                            <th>상품명</th>
                                            <th>가격</th>
                                            <th>수량</th>
                                            <th>상태 코드</th>
                                            <th>배송비</th>
                                            <th>날짜</th>
                                        </tr>
                                    </tfoot>
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
	    	var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	    	$('#example').DataTable();
		    $("#fromDatepicker").datepicker({dateFormat: 'yy-mm-dd'});
		    $("#toDatepicker").datepicker({dateFormat: 'yy-mm-dd'});
		    
		    var curl = ctx + "/shops" +"/management";
		   
		    
		    
		    $('#fromDatepicker , #toDatepicker, #statusCode').change(function(){
		    	 console.log("안녕");
		    	 var data = {"fromDate" : $('#fromDatepicker').val(), "toDate" : $('#toDatepicker').val(),"orderStatusCode" : $('#orderStatusCode').val() };
			   	 
		    	 console.log(data);	
		    	 $.ajax({
					type : "GET",
					data : data,
					url : curl,
					success : function(data) {
						var jsonTable="";
						console.log(data);
						
						$.each(data,function(index, item){
                            jsonTable += '<tr><td>' + item.userid +'</td>' +
										'<td>' + item.productName +'</td>' +
										'<td>' + item.unitPrice +'</td>' +
										'<td>' + item.quantity +'</td>' +
										'<td>' + item.orderStatusCode +'</td>' +
										'<td>' + item.deliveryFee +'</td>' +
										'<td>' + item.dateTimes +'</td></tr>';
                            $('#jqBody').append(jsonTable);
                            
						});
										
					}
				});
		    });
		    
	    } );
	
	</script>