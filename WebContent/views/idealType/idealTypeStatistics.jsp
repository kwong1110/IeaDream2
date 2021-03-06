<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
import="account.model.vo.*"
import="account.model.service.*"
import="idealType.model.vo.*"
import="idealType.model.service.*"        
    
%>

<%

	
	Stat[] height = new Stat[4];
	String[] hval = (String[])request.getAttribute("hval");
	double[] hprop = (double[])request.getAttribute("hprop");
	System.out.println("" + hval + ", " + hprop);
	
	Stat[] shape = (Stat[])request.getAttribute("shape");
	Stat[] style = (Stat[])request.getAttribute("style");
	Stat[] age = (Stat[])request.getAttribute("age");
	Stat[] religion = (Stat[])request.getAttribute("religion");
	Stat[] drink = (Stat[])request.getAttribute("drink");
	Stat[] smoke = (Stat[])request.getAttribute("smoke");
	Stat[] job = (Stat[])request.getAttribute("job");
	Stat[] scholar = (Stat[])request.getAttribute("scholar");
	Stat[] region = (Stat[])request.getAttribute("region");
	Stat[] interest = (Stat[])request.getAttribute("interest");
	
	Stat[][] st = new Stat[11][];
	st[0] = height;
	st[1] = shape;
	st[2] = style;
	st[3] = age;
	st[4] = religion;
	st[5] = drink;
	st[6] = smoke;
	st[7] = job;
	st[8] = scholar;
	st[9] = region;
	st[10] = interest;
	
	for ( int i=0; i<st.length ; i++){
  		for (int j=0; j < 4 && j < st[i].length; j++){
  			st[i][j] = new Stat();		
  		}
  	}
	for (int i=0; i<st.length ; i++){
		for (int j=0; j<st[i].length ; j++){
      		switch(i){
      		case 0:
      			switch(st[i][j].getItem()){
      				case "150" :st[i][j].setItem("155 미만");break;
      				case "155" :st[i][j].setItem("155 ~ 160");break;
      				case "160" :st[i][j].setItem("160 ~ 165");break;
      				case "165" :st[i][j].setItem("165 ~ 170");break;
      				case "170" :st[i][j].setItem("170 ~ 175");break;
      				case "175" :st[i][j].setItem("175 ~ 180");break;
      				case "180" :st[i][j].setItem("180 ~ 185");break;
      				case "185" :st[i][j].setItem("185 이상");break;
      				}
      			break;
      		case 3:
      			switch(st[i][j].getItem()){
      				case "-2" :st[i][j].setItem("3살 초과 연하");break;
      				case "-1" :st[i][j].setItem("3살 이내 연하");break;
      				case "0" :st[i][j].setItem("동갑");break;
      				case "1" :st[i][j].setItem("3살 이내 연상");break;
      				case "2" :st[i][j].setItem("3상 초과 연상");break;
      				}
				break;
      		case 5:
      			switch(st[i][j].getItem()){
      				case "3" :st[i][j].setItem("주 3회 이상");break;
      				case "2" :st[i][j].setItem("주 1회");break;
      				case "1" :st[i][j].setItem("월 1회");break;
      				case "0" :st[i][j].setItem("안 마심");break;
      				}
				break;
      		case 6:
      			switch(st[i][j].getItem()){
      				case "1" :st[i][j].setItem("피움");break;
      				case "0" :st[i][j].setItem("안 피움");break;
      				}
      			break;
      		case 8:
      			switch(st[i][j].getItem()){
      				case "0" :st[i][j].setItem("고졸");break;
      				case "2" :st[i][j].setItem("초대졸");break;
      				case "4" :st[i][j].setItem("대졸");break;
      				case "6" :st[i][j].setItem("석사");break;
      				case "8" :st[i][j].setItem("박사");break;
      				}		
      			break;
      		case 9:
      			switch(st[i][j].getItem()){
      				case "11" :st[i][j].setItem("서울");break;
      				case "12" :st[i][j].setItem("인천");break;
      				case "13" :st[i][j].setItem("경기");break;
      				case "20" :st[i][j].setItem("강원");break;
      				case "31" :st[i][j].setItem("충북");break;
      				case "32" :st[i][j].setItem("충남");break;
      				case "33" :st[i][j].setItem("대전");break;
      				case "41" :st[i][j].setItem("전북");break;
      				case "42" :st[i][j].setItem("전남");break;
      				case "43" :st[i][j].setItem("광주");break;
      				case "51" :st[i][j].setItem("경북");break;
      				case "52" :st[i][j].setItem("대구");break;
      				case "53" :st[i][j].setItem("경남");break;
      				case "54" :st[i][j].setItem("부산");break;
      				case "55" :st[i][j].setItem("울산");break;
      				case "60" :st[i][j].setItem("제주");break;
      				}		
      			break;
      		case 10:
      			switch(st[i][j].getItem()){
						case "movie": st[i][j].setItem("영화&드라마"); break;
						case "musical": st[i][j].setItem("연극&뮤지컬"); break;
						case "comic": st[i][j].setItem("만화&서브컬처"); break;
						case "picture": st[i][j].setItem("사진&영상 촬영"); break;
						case "books": st[i][j].setItem("독서"); break;
						case "music": st[i][j].setItem("음악 감상"); break;
						case "sing": st[i][j].setItem("노래&춤"); break;
						case "instrument": st[i][j].setItem("악기 연주"); break;
						case "cook": st[i][j].setItem("요리&음식"); break;
						case "camp": st[i][j].setItem("여행&캠핑"); break;
						case "exercise": st[i][j].setItem("운동"); break;
						case "sports": st[i][j].setItem("스포츠 경기"); break;
						case "vgame": st[i][j].setItem("비디오 게임"); break;
						case "bgame": st[i][j].setItem("보드게임"); break;
						case "sns": st[i][j].setItem("SNS"); break;
						case "drink": st[i][j].setItem("술&모임"); break;
						case "beauty": st[i][j].setItem("뷰티&패션"); break;
						case "pet": st[i][j].setItem("반려동물"); break;
						case "diy": st[i][j].setItem("DIY"); break;
						case "money": st[i][j].setItem("재테크"); break;
      			}break;
      		}
		}
	}
		
%>
<!doctype html>
<html>
<head>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common.css">
  <title>선호도 통계 </title>
  <meta charset="utf-8">
  <style>
  	.outer{
  		min-height: 1000px;
  	}
    section {
      padding: 15px;
    }
    .pageTitle{
    	height : 50px;
    }
    .graph { 
      position: relative;
      width: 200px; 
      border: 1px solid #B1D632; 
      font-size:11px;
      margin-bottom:3px;
      border-radius: 25px 25px;
    }
    .graph .bar { 
      display: block;
      position: relative;
      background: #B1D632; 
      text-align: center; 
      color: #333; 
      height: 1em; 
      line-height: 2em;    
      border-radius: 25px 25px;        
    }
    .graph .bar span { position: absolute; left: 1em; }
    .itemBox{
        display : flex;
        height : 90px;
        margin : 0px 10px;
    }
    .itemName{
        width:175px;
        text-align: center;
        font-size : 20pt;
        font-weight: 500;
        line-height: 70px;
        color:rgb(230, 141, 150);
    }
    .itemValue{
        display: flex;
        text-align: center;
        margin : 0px  5px auto;
    }
    .itemValueName{
    	width : 110px;
        line-height: 60px;
    }
    .itemSync{
    	display: block;
    }
    .itemSyncNo{
    	color:rgb(30, 180, 180);
    }
    .itemSyncGraph{
    	width: 100px;
    	height: 100px;
    }
    .itemCheck{
      width:50px;
      height:50px;
    }
  </style>
</head>
<body>
	<%@ include file="../common/mainmenu.jsp" %>
  <div class ="outer">
    <div class="wrapper">
      <div class ="main">
        <div class="pageTitle">
			<h1> 이상형 통계</h1>
		</div>
        <section id="items">  
          <article>
          <% 
          for (int i=0; i<st.length ; i++){
          
        	  String itemName = null;
        		switch(i){
        		case 0: itemName = "키" ; break;
        		case 1: itemName = "체형" ; break;
        		case 2: itemName = "매력" ; break;
        		case 3: itemName = "나이" ; break;
        		case 4: itemName = "종교" ; break;
        		case 5: itemName = "음주" ; break;
        		case 6: itemName = "흡연" ; break;
        		case 7: itemName = "직업" ; break;
        		case 8: itemName = "학력" ; break;
        		case 9: itemName = "거주 지역" ; break;
        		case 10: itemName = "관심 분야" ; break;
        		}
          %>
            <div class="itemBox">
            	<div class="itemName" id="">
            		<label><%= itemName %></label>
              	</div>
              	<%
              	for (int j=0; j<height.length ; j++){
              	%>
            	<div class="itemValue" id="">
                	<div class="itemValueName">
                 		<label><%= st[i][j].getItem() %></label>
                	</div>
                	<div class="itemSync">
                		<div class="itemSyncNo">
                			<label class="" id=""><%= st[i][j].getProp() %>%</label>
                		</div>
                		<div class="itemSyncGraph">
                		<%
                			String imagePath = null;
                			if (st[i][j].getProp() > 0.65) {imagePath = request.getContextPath() + "/images/common/wifi high.png";}
                		else if (st[i][j].getProp() > 0.5) {imagePath = request.getContextPath() + "/images/common/wifi mid.png";}
                		else if (st[i][j].getProp() > 0.32) {imagePath = request.getContextPath() + "/images/common/wifi low.png";}
                		else 								{imagePath = request.getContextPath() + "/images/common/wifi none.png";}
                		%>
                		
                			<img src="<%= imagePath %>" width="50px" height="50px">
                		</div>
                	</div>
            	</div>
            	<%
            	if (j == 3){break;}
            	} 
            	%>
            </div>
            <% } %>
          </article>
        </section>
      </div>
    </div>
  </div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
</html>