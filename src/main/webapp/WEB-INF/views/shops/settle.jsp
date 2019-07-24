<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Settlement</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	var url = "${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}";
	
	var payAmount = Number("${sessionScope.finalPrice}");
    var basketId = "결제내역 : ${sessionScope.basketId}";
    var userid = "${sessionScope.userid}";
    //alert(url);

    var IMP = window.IMP;
    IMP.init('iamport'); //  가맹점 식별코드 

    IMP.request_pay({
        pg : 'inicis', // version 1.1.0부터 지원.
        pay_method : 'card',
        merchant_uid : 'tagshop_' + new Date().getTime(),
        name :  basketId,
        amount : payAmount,
//        buyer_email : 'iamport@siot.do',
        buyer_name : userid,
//        buyer_tel : '010-1234-5678',
//        buyer_addr : '서울특별시 강남구 삼성동',
//        buyer_postcode : '123-456',
//        m_redirect_url : 'https://localhost:8080/instashop/test/complete'
    }, function(rsp) {
        if ( rsp.success ) {
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
            alert(msg);
            window.location.href = url;
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            alert(msg);
        }
        
    });

});

</script>

</head>
<body>
</body>
</html>