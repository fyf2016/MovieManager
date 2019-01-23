<%@page import="com.entity.User"%>
<%@page import="com.entity.Movie"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	User u = (User)session.getAttribute("user");
	if(u==null)
		response.sendRedirect("/MovieManager/index.jsp");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 	
 	<title>猫眼电影</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <base href="<%=basePath%>">
	 
    <link rel="icon" type="image/x-icon" href="img/title.ico"/>
  	<link rel="stylesheet" type="text/css" href="<%=path %>/css/style2.css">
  	<link rel="stylesheet" type="text/css" href="<%=path %>/css/header.css">
  	<link rel="stylesheet" type="text/css" href="<%=path %>/css/main.css">
 	<link rel="stylesheet" type="text/css" href="<%=path %>/css/footer.css">
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
	    	width:160px;
	    	height:220px;
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
 		.movie-list li {
		    height: 300px;
		}
		.movie-sale a {
	    	border-top: 1px solid #ccc;
		}
		.main .panel {
    		margin-top: 120px;
		}
		.main .movie-grid {
    		width: 100%;
		}
		label{
			float: left;
    		font-size: 25px;
			
			margin-right:30px;
		}
		.innerInput{
			font-size: 20px;
		    font-family: none;
		    width: 260px;
		    height: 40px;
		    display: block;
		    border-radius:5px;
		}
		textarea{
			resize:none
		}
		.addTextarea{
			font-size: 20px;
		    font-family: none;
		    width: 260px;
		    height: 140px;
		    display: block;
		    border-radius: 5px;
		}
		.addSubmit{
		padding: 4px 10px;
	     height: 40px;
	     width: 240px;
	     text-align: center;
	     line-height: 35px;
	     position: relative;
	     cursor: pointer;
	     background: #44bbff;
	    color: #FFFFFF;
	    border: 1px solid #ddd;
	    border-radius: 4px;
     	overflow: hidden;
	     display: inline-block;
		left: 190px;   
		font-size:23px; 
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
  		
  	</div>
  	<div class="main">
  		<div class="main-inner">
  			<div class="addMovie" style="margin-bottom:50px;height:215px;">
  				<img alt="" src="img/addMovie.png" style="display:block;width:190;height:190;float:left;cursor:pointer;" id="addMovie">
  				<span style="font-size: large;float: left;display: block;clear: both;margin-left: 58px;">添加电影</span>
  			</div>
  			<div class="movie-grid">

  				<div class="panel-header">
  				<!--  
				    <span class="panel-more">
				    
				        <a href="javascript:void(0)" class="textcolor_red" data-act="all-playingMovie-click">
				            <span>全部</span>
				        </a>
				        <span class="panel-arrow panel-arrow-red"></span>
				    
				    </span>
				    -->
				    <span class="panel-title">
				        <span class="textcolor_red">正在热映（19部）</span>
				    </span>
				</div>
				<div class="panel-content">
					<ul class="movie-list">
							<c:forEach var="u" items="${sessionScope.movie}">
								<li>
								    <div class="movie-item">
								      	<a href="javascript:void(0)" target="_blank" data-act="playingMovie-click" data-val="${u.id}">
								      		<div class="movie-poster">
										        <img src="${u.picture}">
										        <div class="movie-overlay movie-overlay-bg">
										          	<div class="movie-info">
											            <div class="movie-score"><i class="integer">${u.score}</i></div>
											            <div class="movie-title movie-title-padding" title="${u.name}">${u.name}</div>
										        	</div>
									        	</div>
								    		</div>
								      	</a>
										<div class="movie-detail movie-detail-strong movie-sale">
										  <a href="/MovieManager/FindMovieByIdAction?update=modify&movieId=${u.id }" class="active" target="_blank" data-act="salePlayingMovie-click" data-val="{movieid:42964}">修改</a>
										 
										</div>
										<div class="movie-detail movie-detail-strong movie-sale" >
											 <span id="deleteId" style="display:none;">${u.id}</span>
											 <a href="javascript:void(0);" class="active" onclick="deleteConfirm(${u.id})" data-act="salePlayingMovie-click"   id="delete">删除</a>
										</div>
								      	<c:if test="${u.id  == '1'|| u.id  == '2'}">
											<div class="movie-ver"><i class="imax3d"></i></div>
										</c:if>
								    </div>		  
								</li>
							
							</c:forEach>
					</ul>
				</div>
				<!-- 
				<div class="panel">
					<div class="panel-header">
						<span class="panel-more">
					        <a href="javascript:void(0)" class="textcolor_blue" data-act="all-upcomingMovie-click">
					          <span>全部</span>
					        </a>
				        	<span class="panel-arrow panel-arrow-blue"></span>
				      	</span>
				      	<span class="panel-title">
				        	<span class="textcolor_blue">即将上映（244部）</span>
				      	</span>
					</div>
					<div class="panel-content">
						<ul class="movie-list">
							<li>
							    <div class="movie-item">
							      	<a href="" target="_blank" data-act="playingMovie-click" data-val="{movieid:42964}">
							      		<div class="movie-poster">
									        <img src="img/movies/movie2.jpg">
									        <div class="movie-overlay movie-overlay-bg">
									          	<div class="movie-info">
										            <div class="movie-score"><i class="integer">7.7</i></div>
										            <div class="movie-title movie-title-padding" title="神奇动物：格林德沃之罪">神奇动物：格林德沃之罪</div>
									        	</div>
								        	</div>
							    		</div>
							      	</a>
							      	<div class="movie-detail movie-wish"><span class="stonefont">200</span>人想看</div>
									<div class="movie-detail movie-detail-strong movie-presale">
									  <a class="movie-presale-sep">预告片</a>
									  <a data-act="presaleUpcomingMovie-click" data-val="{movieid:1236504}">预 售</a>
									</div>
							      	<!-- <div class="movie-ver"><i class="imax3d"></i></div> -->
							    </div>		  
							    
							</li>
						</ul>
					</div>
				</div>
  			</div>
  		</div>
  	</div>
  	<div class="footer">
  		<input id="handle" name="handle" value="" hidden="hidden">
  		<form id="addMovieDialog">
  			<input type="text/html"  palceholder="gun"/>
  		</form>
  	</div>
  	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="./js/carousel.js"></script>
	<script type="text/javascript" src="./js/layer.js"></script>
	<script type="text/javascript">
	
		$("#addMovie").click(function(){
			
			layer.open({
			  type: 1 //Page层类型
			  ,area: ['500px', '600px']
			  ,title: '添加电影信息。'
			  ,shade: 0.6 //遮罩透明度
			  ,maxmin: true //允许全屏最小化
			  ,anim: 1 //0-6的动画形式，-1不开启
			  ,content: '<div style="padding:50px;"><form action="/MovieManager/UpdateMovieAction?update=add"  method="post"><br>'+
			 ' <label for="name">电影片名: </label><input type="text/html" class="innerInput" name="name" id="name"/><br>'+
			 ' <label>图片路径: </label><input type="text/html" class="innerInput" name="picture"/><br>'+
			  '<label>电影类型: </label><input type="text/html" class="innerInput" name="type"/><br>'+
			  '<label>电影简介: </label><textarea name="detail" class="addTextarea"></textarea><br>'+
			  '<input type="submit" value="添加" class="addSubmit"/>'+
			 ' </form></div>'
			});    
		});
		
		
	
		function addMovie() {
			this.location = "/MovieManager/UpdateMovieAction?update=add";
		}
		function deleteConfirm(id)
		{
			if(confirm("确定要删除吗?"))
			{
				this.location = "/MovieManager/UpdateMovieAction?update=delete&movieid="+id;
			}
		}
		$(function(){
			$(".carousel-content").carousel({
				carousel : ".carousel",//轮播图容器
				indexContainer : ".img-index",//下标容器
				prev : ".carousel-prev",//左按钮
				next : ".carousel-next",//右按钮
				timing : 3000,//自动播放间隔
				animateTime : 700,//动画时间
				autoPlay : true,//是否自动播放 true/false
				direction : "left",//滚动方向 right/left
			});

			$(".carousel-content").hover(function(){
				$(".carousel-prev,.carousel-next").fadeIn(300);
			},function(){
				$(".carousel-prev,.carousel-next").fadeOut(300);
			});

			$(".carousel-prev").hover(function(){
				$(this).find("img").attr("src","./img/left2.png");
			},function(){
				$(this).find("img").attr("src","./img/left1.png");
			});
			$(".carousel-next").hover(function(){
				$(this).find("img").attr("src","./img/right2.png");
			},function(){
				$(this).find("img").attr("src","./img/right1.png");
			});
		});
	</script>
  </body>
</html>
