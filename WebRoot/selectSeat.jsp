<%@page import="com.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	User u = (User)session.getAttribute("user");
	if(u==null)
		response.sendRedirect("/MovieManager/index.jsp");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   	<title>选购座位</title>
 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="icon" type="image/x-icon" href="img/title.ico"/>
	<link rel="stylesheet" type="text/css" href="./css/style2.css">
	<link rel="stylesheet" type="text/css" href="./css/header.css">
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" type="text/css" href="./css/footer.css">
	<link rel="stylesheet" type="text/css" href="./css/selectSeat.css">
	<style>
  	*{
			margin: 0;
			padding: 0;
	}
	ul{
		list-style: none;
	}
	a{
		text-decoration: none;
	}
	a:active, a:hover {
    	outline-width: 0;
	}
	img {
    	border-style: none;
	}
  	body{
  	    font-family: Microsoft YaHei,Helvetica,Arial,sans-serif;
	    background-color: #fff;
	    -webkit-font-smoothing: subpixel-antialiased;
  	}
	input{
		outline:none;
	}
	input[type=search]::-webkit-search-cancel-button{
    	-webkit-appearance: none;  //此处去掉默认的小×
	}
	img 
	{
	    border-style: none;
	}
	
	</style>
  </head>
  
  <body>
    <div class="header">
		<div class="header-top">
			<div class="header-inner">
	  			<h1>
	  				<a href="javascript:void(0)" class="logo"></a>
	  			</h1>
	  			<div class="nav">
	  				<ul>
	  					<li><a href="/MovieManager/MovieAction">首页</a></li>
	  					<li><a href="/MovieManager/SortMoviesAction?order=boxOffice*boxOfficeUnit">电影</a></li>
	  					<li><a href="javascript:void(0)">影院</a></li>
	  					<li><a href="javascript:void(0)">榜单</a></li>
	  					
	  					<c:if test="${sessionScope.user.role == 1}">
	  						<li><a href="/MovieManager/MovieAction?update=manager">管理</a></li>
	  					</c:if>
	  				</ul>
	  			</div>
	  			<div class="app-download">
	  				
	  			</div>
	  			<div class="user-info">
	  				<div class="user-avatar J-login">
		              <img src="${sessionScope.user.headImg}">
		              <span class="caret"></span>
		              <ul class="user-menu">
		                <li><a href="javascript:void 0">登录</a></li>
		              </ul>
	            	</div>
	  			</div>
	  			<form action="">
	  				<input name="searchMovie" class="search" type="search" maxlength="32" placeholder="找影视剧、影人、影院" autocomplete="off">
	            	<input class="submit" type="submit" value="">
	  			</form>
	  			
	  		</div>
		</div>
  		<div class="banner2">
  			<div class="wrapper clearfix">
    			<div class="cinema-left">
			      <div class="avatar-shadow">
			        <img class="avatar" src="https://p1.meituan.net/deal/__32772470__1178368.jpg@292w_292h_1e_1c">
			        <div class="avatar-num">查看全部21张图片</div>
			      </div>
    			</div>

			    <div class="cinema-main clearfix">
			      	<div class="cinema-brief-container">
			       		<h3 class="name text-ellipsis">${sessionScope.SingleCinema.name}</h3>
			        	<div class="address text-ellipsis">${sessionScope.SingleCinema.address}</div>
			        	<div class="telphone">电话：0335-2661222</div>
			        
			        	<div class="features-group">
			          		<div class="group-title">影院服务</div>

			          		<div class="feature">
			           		 	<span class="tag ">3D眼镜</span>
			            		<p class="desc text-ellipsis" title="免押金">免押金</p>
			          		</div>
			        	</div>
			      	</div>
			    </div>
					
			</div>
	</div>
	<div class="main">
		<div class="main-inner">
			<div class="movie-list-container" data-cinemaid="8330">
        		<div class="movie-list">
			        <div class="movie" data-index="0" data-movieid="42964" data-bid="b_uup5nnq7" data-act="cinema-movie-click" data-val="{city_id:121, movie_id:42964, cinema_id:8330}">
			        	<img src="https://p0.meituan.net/movie/363e3a7e614d29b2847ff4e62afcd3f42168651.jpg@170w_235h_1e_1c" alt="">
			        </div>
		          	<div class="movie" data-index="1" data-movieid="1208282" data-bid="b_uup5nnq7" data-act="cinema-movie-click" data-val="{city_id:121, movie_id:1208282, cinema_id:8330}">
		            	<img src="https://p0.meituan.net/movie/3e7696319c840d4890e947b926259d532809641.jpg@170w_235h_1e_1c" alt="">
		          	</div>
		          	<div class="movie active" data-index="2" data-movieid="1221035" data-bid="b_uup5nnq7" data-act="cinema-movie-click" data-val="{city_id:121, movie_id:1221035, cinema_id:8330}">
		            	<img src="${sessionScope.SingleMovie.picture }" alt="">
		          	</div>
		          	<div class="movie" data-index="3" data-movieid="337129" data-bid="b_uup5nnq7" data-act="cinema-movie-click" data-val="{city_id:121, movie_id:337129, cinema_id:8330}">
		            	<img src="https://p0.meituan.net/movie/5317132f94b74c720255b6462438d36a376518.jpg@170w_235h_1e_1c" alt="">
		          	</div>
		          	<div class="movie " data-index="4" data-movieid="1207271" data-bid="b_uup5nnq7" data-act="cinema-movie-click" data-val="{city_id:121, movie_id:1207271, cinema_id:8330}">
		            	<img src="https://p0.meituan.net/movie/677dce9488e154c11afa8fb2fef0725a831453.png@170w_235h_1e_1c" alt="">
		          	</div>

          			<span class="pointer" style="left: 411px;"></span>
        		</div>

		        <span class="scroll-prev scroll-btn"></span>
		        <span class="scroll-next scroll-btn"></span>
      		</div>

      		<div class="show-list active" data-index="0">
        			<div class="movie-info">
  						<div>
  							
    						<h3 class="movie-name">${sessionScope.SingleMovie.name}</h3>
							<span class="score sc">${sessionScope.SingleMovie.score}</span>

  						</div>

	  					<div class="movie-desc">
	    					<div>
							    <span class="key">时长 :</span>
							    <span class="value">${sessionScope.SingleMovie.duration}</span>
	    					</div>
	    					<div>
						    	<span class="key">类型 :</span>
						    	<span class="value"> ${sessionScope.SingleMovie.type} </span>
	    					</div>
	    					<div>
						      	<span class="key">导演 :</span>
						      	<span class="value"> ${sessionScope.SingleMovie.staring}</span>
	    					</div>
	  					</div>
					</div>
				
				
					<div class="show-date">
				  		<span>观影时间 :</span>
				  		<c:forEach items="${sessionScope.movieSession}" var="u" varStatus="status">
				  			
					    		<span class="date-item active" data-index="${status.index}">${u.date}</span>
					    	
					    </c:forEach>
					    
					</div>
				
  					<div class="plist-container active">
	      				<table class="plist">
		  					<thead>
							    <tr>
							      <th>放映时间</th>
							      <th>语言版本</th>
							      <th>放映厅</th>
							      <th>售价（元）</th>
							      <th>选座购票</th>
							    </tr>
		  					</thead>

	  						<tbody>
	  							<c:forEach items="${sessionScope.movieSession}" var="u" varStatus="status">
	  								
	  								
	    						<tr class="">
	    							
							      	<td>
								        <span class="begin-time">${u.time}</span>
								        <br>
								        <!-- <span class="end-time">15:18散场</span> -->
							      	</td>
								    <td>
								        <span class="lang">中文2D</span>
								    </td>
							      	<td>
							        	<span class="hall">${u.hallName}</span>
							      	</td>
							      	<td>
							        	<span class="sell-price"><span class="stonefont">${u.price}</span></span>
							      	</td>
							      	<td>
							        	<a href="/MovieManager/buySeat.jsp?sessionId=${u.session_Id}&hallId=${u.hall_Id}" class="buy-btn normal" data-tip="" data-act="show-click" data-bid="b_gvh3l8gg" data-val="{movie_id: 1208282, cinema_id:7349}">选座购票</a>
							      	</td>
	    						</tr>
	    						
							</c:forEach>
	  						</tbody>
						</table>
					</div>
			</div>
		</div>
	</div>
	<div class="footer">
		
	</div>
  </body>
</html>
