<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.*, java.util.ArrayList" %>

<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	
		ArrayList<Board> cate1 = new ArrayList<Board>();
		ArrayList<Board> cate2 = new ArrayList<Board>();
		ArrayList<Board> cate3 = new ArrayList<Board>();
		ArrayList<Board> cate4 = new ArrayList<Board>();
	if(list.isEmpty()) {
		System.out.println("비어있음");
	} else {
		for (Board board : list) {
			switch (board.getCategory()) {
			case "결제":
				cate1.add(board);
				break;
			case "서비스":
				cate2.add(board);
				break;
			case "회원/등급":
				cate3.add(board);
				break;
			case "기타":
				cate4.add(board);
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이어드림 - FAQ</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
<link rel="styleSheet" href="<%= request.getContextPath() %>/css/board.css">
<style>
	.tableArea{width:700px;	height:100%; margin:auto; box-sizing: border-box;}
	.category{cursor: pointer; font-size:20px; text-align: center; padding: 10px;}
	.faq{text-align: center; cursor: pointer; display: none; font-size: 15px; line-height: 20px;}

	.con{ /* 내용 css */
		height: 120%; display: none; text-align: left;
		padding:12px 0;
		border-top:1px solid rgb(136, 136, 136); /* 상단라인색 */
		border-bottom:1px solid rgb(224, 224, 224); /* 하단라인색 */
		background:rgb(230, 141, 150, 0.2);  /* 배경색 */ 
		color:rgb(51, 51, 51); font-size:1em;/* 제목글자크기 */ 
		letter-spacing:0.1em}/* 제목띠어쓰기간격 */ 
	.bor {
		 border-top: 1px solid rgb(200, 200, 200); border-bottom: 1px solid rgb(200, 200, 200); line-height: 40px;
	}
</style>
</head>
<body>
	
	<%@ include file="../../common/mainmenu.jsp" %>
	
	<div class="outer">
		<div class="wrapper">
			<div class="main">
				<div class="pageTitle">
					<h1>FAQ</h1>
				</div>
				<br>
				<div class="tableArea">
					<% if(list.isEmpty()) { /* list에 아무것도 담겨있지 않을 때 */%>
							조회된 FAQ가 없습니다.
					<% } else { /* list에 값이 있을 경우 */%>		
						<div class="category" id="cate1"><div class="bor">결제</div>
							<% for(Board board : cate1) { %>
							<div class="faq" id="faq1"><%= board.getTitle() %>
								<div class="con"><%= board.getContent() %></div>
							</div>
							<% } %>
						<br><br>
						</div>
						<div class="category" id="cate2"><div class="bor">서비스</div>
							<% for(Board board : cate2) { %>
							<div class="faq"><%= board.getTitle() %>
								<div class="con"><%= board.getContent() %></div>
							</div>
							<% } %>
						<br><br>
						</div>
						<div class="category" id="cate3"><div class="bor">회원/등급</div>
							<% for(Board board : cate3) { %>
							<div class="faq"><%= board.getTitle() %>
								<div class="con"><%= board.getContent() %></div>
							</div>
							<% } %>
						<br><br>
						</div>
						<div class="category" id="cate4"><div class="bor">기타</div>
							<% for(Board board : cate4) { %>
							<div class="faq"><%= board.getTitle() %>
								<div class="con"><%= board.getContent() %></div>
							</div>
							<% } %>
						</div>
					<% } %>
				</div>
			</div>
		</div>
	</div>

	<script>
		$('.category').click(function() {
			$(this).children().slideDown();
		});
		
		$('.faq').slideDown(function() {
			$(this).children().slideUp();
		});
		
		$('.faq').click(function() {
			$(this).children().slideToggle();			
		});
	</script>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>