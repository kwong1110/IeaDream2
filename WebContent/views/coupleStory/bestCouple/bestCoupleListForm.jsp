<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.model.vo.*, common.*" %>    
    
<%
	ArrayList<Board> bcList = (ArrayList<Board>)request.getAttribute("bcList");
	ArrayList<Photo> pList = (ArrayList<Photo>)request.getAttribute("pList");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>이어드림_베스트커플_목록</title>
<style>

	.outer{
      width: 1000px; height: 680px; background: white;
      margin-left: auto; margin-right: auto; margin-top: 50px; margin-bottom: 50px;
   }
	
	.pageTitle{
		padding: 10px 0 10px 40px;
		margin: 60px 0 20px 0;
	}
	
	.option{
		padding: 3px 7px 6px 7px;
		background: #e75a82;
		border: none;
		color: white;
		font-weight: border;
		border-radius: 5px;
		cursor: pointer;
		text-shadow: 0 1px 1px rgba(0,0,0,.3);
		box-shadow: 0 1px 2px rgba(0,0,0,.2);
	}
	
	.optiondiv{
		display: inline-block;
	}
	
	.optionbox{
		margin-left: 800px;
		margin-bottom: .6%;
	}
	
	.main{
		display: inline-block;
		float:left;
		width: 960px;
		height: 670px;
	}
	
	.contents{
		width: 900px;
		height: 470px;
		border: 8px solid white;
		background: rgba(255, 255, 255, 0.4);
		box-shadow: 3px 3px 3px 3px gray;
		margin: 0 4% 0 4%;
		margin-bottom: 15px;
	}
	
	.contns{
		width: 100%;
		height: 400px;
	}
	
	.contn{
		margin-top: 40px;
		margin-left: 2%; 
		margin-right: 2%;
		width: 29.33333333333333%;
		float: left;
		margin-bottom: 55px;
	}
	
	.hit{
		margin: 0 0 2% 80%;
		font-size: 12px;
		cursor: default;
	}
	
	.img{
		width: 100%;
		height: 200px;
		background-size: cover;
		position: relative;
		margin-bottom: 20px;
		cursor: pointer;
	}
		
	.peoNum > p {
		background: #000; color: #fff;
		margin-bottom: 3px;
		padding: 3px 8px;
		font-size: 10px;
		border-radius: 5px;
	}
	
	.peoNum > p:hover{
		background: yellow;
		color:#000;
		transition: 0.5s;
		cursor: default;
	}
	
	.text{
		width: 100%;
		text-align: center;
	}
	
	#text1{
		font-size: 15px;
		font-weight: bold;
		margin: 5%;
	}
	
	#text2{
		font-size: 14px;
		margin: 4%;
	}
	
	#text3{
		font-size: 13px;
	}
	
	.date > p{
		text-align: center;
	}
	
	.sc-footer{
		width: 100%;
	}
	
	.button{
		width: 70%;
		text-align:center;
		margin: 0 auto;
	}
	
	.uploadbtn{
		width: 9%;
		height: 28px;
		margin: 0 50% 0 50%;
		background: #e75a82;
		color: white;
		font-weight: border;
	}
	
	.clear-both{
		height: 10px;
	}
	
	.sc-footer{text-decoration: none; padding: 30px 0;}
	.sc-footer button{background: none; border: 3px solid white; font-weight: bold; margin: 1em auto;
					  position: relative; cursor: pointer; text-transform: uppercase;}
	button:hover{cursor: pointer;}
	/* #numBtn{background: #B2CCFF;}
	#choosen{background: #FFD8D8;} */
	#listArea{margin: auto;}
	
	.footer{
		left:0;
		bottom:0;
		width: 100%;
		height: 90px;
		padding: 15px 0;
		text-align: center;
		color: white;
		background: gray;
		line-height: 22px;
	}
	
</style>
</head>
<body>
	<%@ include file="../../common/mainmenu.jsp" %>
	<section>
		<div class="outer">
			<div class="wrapper">
				<div class="main">
					<div class="pageTitle"><h1>이달의 베스트 커플</h1></div>
					
					<div class="optionbox">
						<div class="optiondiv">
							<select  class="option" id="year">
								<option>-----</option>
								<option value="2019">2019년</option>
								<option value="2020">2020년</option>
								<option value="2021">2021년</option>
								<option value="2022">2022년</option>
							</select>					
						</div>
						
						<div class="optiondiv">
							<select class="option" id="month">
								<option>-----</option>
								<option value="1">1월</option>
								<option value="2">2월</option>
								<option value="3">3월</option>
								<option value="4">4월</option>
								<option value="5">5월</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8">8월</option>
								<option value="9">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
					</div>
					
					<div class="contents">
						<div class="contns">
							<% 
								for(int i = 0; i < bcList.size(); i++){
									Board bc = bcList.get(i);
							%>
								<div class="contn">
									<p class="hit">HIT : <%= bc.getHit() %></p>
									<div class="img">
										<input type="hidden" value="<%= bc.getPostNo() %>">
										<% 
											for(int j = 0; j < pList.size(); j++){
												Photo p = pList.get(j);		
										%>
											<% if(bc.getPostNo() == p.getPostNo()){ %>
												<img src="<%= request.getContextPath() %>/photo_uploadFiles/<%= p.getChangeName() %>" style="width:inherit; height:inherit;">
											<% } %>
										<% } %>
									</div>
									<div class="text">
										<p id="text1"><%= bc.getTitle() %></p>
										<p id="text2"><%= bc.getUserId() %></p>
										<p id="text3"><%= bc.getCreateDate() %></p>
									</div>
								</div>
									
								<% } %>
							</div>
							
						 <div class="clear-both"></div>
						
						 <div class="sc-footer">
						 	<% if(!bcList.isEmpty()) { %>
								<div class="button">
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=1'">&lt;&lt;</button>
									
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= currentPage-1 %>'" id="beforeBtn">PREV</button>
									<script>
										if(<%= currentPage %> <= 1){
											var before = $('#beforeBtn');
											before.attr('disabled', 'true');
										}
									</script>
									
									<% for(int p = startPage; p <= endPage; p++) { %>
										<% if(p == currentPage) { %>
											<button id="choosen" disabled><%= p %></button>
										<% } else{ %>
											<button id="numBtn" onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= p %>'"><%= p %></button>
										<% } %>	
									<% } %>
									
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= currentPage + 1%>'" id="afterBtn">NEXT</button>
									<script>
										if(<%= currentPage %> >= <%= maxPage %>){
											var after = $("#afterBtn");
											after.attr('disabled', 'true');
										}
									</script>
								
									<button onclick="location.href='<%= request.getContextPath() %>/list.bc?currentPage=<%= maxPage %>'">&gt;&gt;</button>
								</div>
							<% } %>
						</div>
					</div>
					
					<div class="uploadbtndv">
						<button class="uploadbtn" onclick='location.href="views/coupleStory/bestCouple/bestCoupleInsertForm.jsp"'>UPLOAD</button>
					</div>
				</div>	
			</div>
		</div>
		
		<script>
			$(function(){
				$('.contn').click(function(){
					var pNo = $(this).children().children().eq(0).val();
					location.href="<%= request.getContextPath() %>/detail.bc?pNo=" + pNo;
				});
			});
		</script>
		
	</section>
</body>
<footer>
		<div class="footer">
		대표이사  박소현 |  사업자 111-11-111111  | TEL 02)0202-0202 <br> 
		본사 ) 서울특별시 연애하구 사랑동 행복로 잘되길 12-3<br>
		E-MAIL love_manager@ieadream.com <br>
		Copyright © 1998-2019 Couple Matching Service All Right Reserved
		</div>
</footer>
</html>