<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - FAQ 작성</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<style>
	.outer{
      width: 1000px; height: 100%; background: white;
      margin-left: auto; margin-right: auto; margin-top: 50px; margin-bottom: 50px;
   }
	.main{width: 80%; height: 100%;}
	.pageTitle{margin: 1em auto;}
	/* .tableArea{margin: auto; padding: auto;} */
	.listArea{width: 800px;}
	.tableArea {table-layout:fixed;}
	.tableArea tr { width: -webkit-fill-available;}
	.tableArea th {/* 게시판제목라인 */
		padding:12px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		background:#f9f9f9;  /* 제목배경색 */ 
		color:rgb(51, 51, 51); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em}/* 제목띠어쓰기간격 */ 
	.tableArea td {line-height: 10px;}
		
	#th_title {width:10%; text-align:rigth;}
	#th_title_input {width:50%;text-align:left;}
	#th_cate {width:20%;text-align: center;}
	#th_cate_select{width: 20%;}
	
	.select {
			width: 80px;
			padding: .8em .5em;
			border: 1px solid rgb(136, 136, 136);
			border-radius: 0;
			background: url('<%= request.getContextPath() %>/images/arrow.jpg') no-repeat 95% 50%;
			background-color: white;
			-webkit-appearance: none;
			}
	#title {
		padding: .8em .5em;
		border: 1px solid rgb(136, 136, 136);
	}
	#con {
		font-size: 15px;
		width: 100%
	}
	
	
	*:focus { outline:none; }
	
</style>
</head>
<body>
	
	<%@ include file="../../common/mainmenu.jsp" %>
	
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>FAQ 작성</h1>
				</div>
				<div class="listArea">
					<form action="<%= request.getContextPath() %>/insert.faq" method="post">
						<table class="tableArea">
							<tr>
								<th id="th_title">제목</th>
								<th id="th_title_input">
									<input type="text" size="80%" name="title" id="title" placeholder="제목을 넣어주세요" required>
								</th>
								<th id="th_cate">카테고리</th>
								<th id="th_cate_select">
									<div class="cateCss" style="width: 20px;">
										<select class="select" name="category">
											<option value="결제">결제</option>
											<option value="서비스">서비스</option>
											<option value="회원/등급">회원/등급</option>
											<option value="기타">기타</option>
										</select>
									</div>
								</th>
							</tr>
							<tr>
								<td colspan="4">
									<textarea id="con" name="con" rows="20" cols="100%" style="resize:none;" placeholder="내용을 입력해주세요" required></textarea>
								</td>
							</tr>
						</table>
						<br>
						<div class="btnBox" style="display: relative;">
							<button type="submit" id="insertFaqBtn" class="defaultBtn">등록</button>
							<button type="button" onclick="location.href='javascript:history.go(-1);'" class="defaultBtn cancelBtn" id="cancelBtn">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


</body>
<%@ include file="../../common/footer.jsp" %>
</html>