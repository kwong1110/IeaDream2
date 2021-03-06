<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 정회원 등업</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.gradeBtn{
	font-size: 16px;
	margin: 10px;
	padding: 10px 20px 10px 20px;
	margin: 0;
}
.gradeInfo{
	float: left;
	width: 500px;
	height: 400px;
	font-size: 12px;
	background-size: contain; 
	background-image: url('../../../images/myPage/memGradeUp2.png');
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp"%>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h2>정회원 등업</h2>
				</div>
				<div class="information">
					정회원 가입하기 버튼을 누르면 결제페이지로 이동합니다.<br>
					결제 후 바로 정회원으로 서비스 이용 가능 합니다.<br>
				</div>
				<div class="contents">
					<input type="button" class="defaultBtn gradeBtn" id="payment" value="정회원 가입하기">	
				</div>
				<div class="gradeInfo">
				</div>			
			</div>
		</div>
	</div>
</body>
<%@ include file="../../common/footer.jsp"%>
	<script>
		var IMP = window.IMP; // 생략가능
		IMP.init('imp40839518');
		
		$("#payment").click(function(){
			IMP.request_pay({
			    pg : 'html5_inicis', 
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '이어드림(IEADREAM) 정회원(365일) 이용권 구매',
			    amount : 1000,
			    buyer_email : '<%= loginUser.getEmail() %>',
			    buyer_name : '<%= loginUser.getUserName() %>',
			    buyer_tel : '<%= loginUser.getPhone() %>',
			    m_redirect_url : 'http://www.iamport.kr/mobile/landing'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.\n';
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '    카드 승인번호 : ' + rsp.apply_num;
			        alert(msg);
			        
			        $.ajax({
						url: '<%= request.getContextPath() %>/payment.mem',
						type: 'get',
						data: {userNo: '<%= loginUser.getUserNo() %>'},
						success: function(data){
							if(data > 0){
						        var msg2 = '<%= loginUser.getUserName() %>님의 등급이 정회원으로 변경 되었습니다.'; 
						        alert(msg2);
							} else {
								alert("결제완료 후 회원등급 변경이 정상적으로 되지 않았습니다.\n 관리자에게 문의해주세요.");
							}
						}
					});			      
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			    }
			});
		});
	</script>
</html>