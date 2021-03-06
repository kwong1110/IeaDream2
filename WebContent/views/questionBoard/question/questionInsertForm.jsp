<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - 1:1문의</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
	
	#title, #category{
		height: 30px;
	}
	textarea, #title, #category{
		border-radius: 5px;
		font-size:15px;
		font-family:"ON I고딕";
		border:none;
	}
	textarea{margin-top:10px;}
	.outer{
		width:1000px; height: 100%; background: white;
		margin-left: auto; margin-right: auto; margin-top: 50px;
	} 
		button, input[type='button']{cursor: pointer;}
		.qinsertTable{
			vertical-align: middle;
		    margin: 0;
		    background: #f9f9f9;
		    width: 670px;
		}
		
		.qinsertTable td {/* 게시판제목라인 */
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224);
		}
		.qinsertTable th {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		background:#f9f9f9;  /* 제목배경색 */ 
		color:rgb(51, 51, 51); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em}/
		
		.qinsertTable{
	border-top:1px solid rgb(136, 136, 136); 
		background: #f9f9f9;
		}
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h2>1:1 문의</h2>
				</div>
				<div class="tableArea">
					<form action="<%= request.getContextPath() %>/insert.qu" method="post">
					<table class="qinsertTable">
						<tr>
							<th width=10%>제목</th>
							<td><input type="text" id="title"  name="title" size="40" placeholder="제목을 입력해주세요" required></td>
							<th>카테고리</th>
							<td>
								<select name="category" id="category" required>
									<option></option>
									<option value="결제">결제</option>
									<option value="서비스">서비스</option>
									<option value="회원/등급">회원/등급</option>
									<option value="기타">기타</option>
								</select>
							</td>	
						</tr>
						<tr>
							<td colspan="4">
								<textarea rows="15" cols="60" name="content" style="resize:none; width: 100%;" placeholder="문의글을 작성해주세요." required></textarea>
							</td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button type="submit" class="defaultBtn" id="insertBtn">등록하기</button>
						<button type="button" class="defaultBtn cancelBtn" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo() %>'">취소</button>
						<%-- <input type="button"  class="defaultBtn" id="cancelBtn" onclick="location.href='<%= request.getContextPath() %>/list.qu?userNo=<%= loginUser.getUserNo() %>'" value="취소"> --%>
					</div>
					</form>
				</div>	
			</div>	
		</div>	
	</div>
<script>
$(function(){
	$('#insertBtn').click(function(){
		if($('#category').val()== ''){
			alert('카테고리를 선택해주세요.');
			$('#category').focus();
		}
	});
	
});
</script>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>