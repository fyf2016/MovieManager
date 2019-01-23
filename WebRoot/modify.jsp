<%@page import="com.entity.User"%>
<%@page import="com.entity.Movie"%>
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


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

  <head>
    <base href="<%=basePath%>">
    
    <title>login</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0"> 
    
	<link rel="icon" type="image/x-icon" href="img/title.ico"/>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/style2.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/header.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/main.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/footer.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/buyTickets.css">
	<script src="<%=path %>/js/jquery-2.1.1.min.js"></script>
	<title>修改</title>
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

  	</style>
  	
  	 <style>


@font-face{
 font-family: Bebas Neue;

}

.Modifyform {
  height: 18.75em;
  width: 46em;
  margin-top: 150px;
  background: #fff;
  position: absolute;
 
  left: 50%;
  transform: translate(-50%,-50%);
  text-transform: lowercase;
  font-family: "Bebas Neue", Arial;
  color: #fff;
}

.Modifyform > div {
  
  height: 6.25em;
  width: 100%;
}

.username {
  background-color: #4daf7c;
}

.username::after {
  content: "";
  width: 0px;
  height: 0px;
  position: absolute;
  border-style: solid;
  border-width: 0.5em 0.469em 0 0.469em;
  border-color: #4daf7c transparent transparent transparent;
  top: 6.25em;
  left: 50%;
  margin-left: -0.496em;
}

.password {
  background-color: #404241;
}

.password::after {
  content: "";
  width: 0px;
  height: 0px;
  position: absolute;
  border-style: solid;
  border-width: 0.5em 0.469em 0 0.469em;
  border-color: #404241 transparent transparent transparent;
  top: 12.5em;
  left: 50%;
  margin-left: -0.496em;
}
.type{
	background-color: purple;
}
.type::after{
  content: "";
  width: 0px;
  height: 0px;
  position: absolute;
  border-style: solid;
  border-width: 0.5em 0.469em 0 0.469em;
  border-color: purple transparent transparent transparent;
  top: 18.7em;
  left: 50%;
  margin-left: -0.496em;

}
.login {
  background-color: #e9c85d;
  display: table;
}

.login span {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
  font-size:3em;
  cursor: pointer;
}

.ModifyInput {
  height: 1.8em;
  width: 19.125em;
  font-size: 2em;
  text-align:center;
  border: 0;
  outline: 0;
  color: #fff;
  background: transparent;
  border:0.033em #fff solid;
  margin-left: 2.1875em;
  margin-top: 0.8em;
  font-family: "Bebas Neue", Arial;
}

::placeholder {
  color: #fff;
}

::-moz-placeholder {
  color: #fff;
}

:-ms-input-placeholder {
  color: #fff;
}

::-webkit-input-placeholder {
  color: #fff;
}
.detailBox{
	height: 8.25em;
	background-color: #ccc;
}
#detail{
   height: 4.5em;
  width: 19.125em;
  font-size: 2em;
  text-align:center;
  border: 0;
  outline: 0;
  color: #fff;
  background: transparent;
  border:0.033em #fff solid;
  margin-left: 2.1875em;
  margin-top: 1em;
  font-family: "Bebas Neue", Arial;
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
					<div class="celeInfo-left">
				        <div class="avatar-shadow">
				          	<img class="avatar" src="${sessionScope.SingleMovie.picture}" alt="">
				            <div class="movie-ver"><i class="imax3d"></i></div>
				        </div>
			      	</div>
					
					<div class="celeInfo-right clearfix">
			        <div class="movie-brief-container">
				      		<h3 class="name">${sessionScope.SingleMovie.name}</h3>
				     		<div class="ename ellipsis">${sessionScope.SingleMovie.foreignName}</div>
				      		<ul>
						        <li class="ellipsis">${sessionScope.SingleMovie.type}</li>
						        <li class="ellipsis">
							        ${sessionScope.SingleMovie.duration}
				        		</li>
				       			<li class="ellipsis">${sessionScope.SingleMovie.releaseDate} ${sessionScope.SingleMovie.releasePoint}</li>
				     		</ul>
				   		</div>
				    	<div class="action-buyBtn">
				      		<div class="action clearfix" data-val="{movieid:42964}">
				        		<a class="wish " data-wish="false" data-score="" data-bid="b_gbxqtw6x">
				           			<div>
				           				<i class="icon wish-icon"></i>
				                		<span class="wish-msg" data-act="wish-click">想看</span>
				        			</div>
				        		</a>
				        		<a class="score-btn " data-bid="b_rxxpcgwd">
					          		<div>
					            		<i class="icon score-btn-icon"></i>
					            		<span class="score-btn-msg" data-act="comment-open-click">
					                	评分
					            		</span>
					          		</div>
				       			</a>
				     		</div>
				        	<a class="btn buy" href="/films/42964" target="_blank" data-act="more-detail-click" data-bid="b_ozuzh4j4">查看更多电影详情</a>
				    	</div>
	
				    	<div class="movie-stats-container">
	
				        	<div class="movie-index">
				          		<p class="movie-index-title">用户评分</p>
				          		<div class="movie-index-content score normal-score">
				             		<span class="index-left info-num ">
				                		<span class="stonefont">${sessionScope.SingleMovie.score}</span>
				              		</span>
				              		<div class="index-right">
				                		<div class="star-wrapper">
				                  			<div class="star-on" style="width:93%;"></div>
				                		</div>
				                 		<span class="score-num"><span class="stonefont">${sessionScope.SingleMovie.commentsCount}
				                 		<c:if test="${sessionScope.SingleMovie.commentsUnit == 10000}">
				                 			万
				                 		</c:if>
				                 		<c:if test="${sessionScope.SingleMovie.commentsUnit == 1}">
				                 			
				                 		</c:if>
				                 		</span>人评分</span>
				              		</div>
				          		</div>
				        	</div>   
	
				        	<div class="movie-index">
					          	<p class="movie-index-title">累计票房</p>
					          	<div class="movie-index-content box">
					            	<span class="stonefont">${sessionScope.SingleMovie.boxOffice}</span>
					            	<span class="unit">
						            	<c:if test="${sessionScope.SingleMovie.boxOfficeUnit == 10000}">
						            		万
						            	</c:if>
						            	<c:if test="${sessionScope.SingleMovie.boxOfficeUnit == 100000000}">
						            		亿
						            	</c:if>
					            	</span>
					          	</div>
				       		</div>
				    	</div>
	
	      			</div>
	  			</div>
	  		</div>
	  
	</div>
	<div class="main">
		<div class="main-inner">
			<form action="/MovieManager/UpdateMovieAction?update=modify&movieid=${ sessionScope.SingleMovie.id}" method="post" id="form">
			  	<div class="Modifyform">
					  <div class="username">
					    <input type="text" value="${sessionScope.SingleMovie.name}"  class="ModifyInput" name="name"/>
					  </div>
					  <div class="password">
					    <input type="text" value="${sessionScope.SingleMovie.picture}"  class="ModifyInput" name="picture"/>
					  </div>
					  <div class="type">
					    <input type="text" value="${sessionScope.SingleMovie.type}"  class="ModifyInput" name="type"/>
					  </div>
					  <div class="detailBox" style="height: 13.25em; ">
					  	<textarea id="detail" style="overflow:hidden; resize:none;" onfocus="deleteMsg()" name="detail"></textarea>
					    <!-- <input type="text"  id="detail" /> -->
					  </div>
					  <div class="login">
					  	
					    <span onclick="document.getElementById('form').submit()">修改</span>
					  </div>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">
		
	</div>
	<script type="text/javascript">
	var s = document.getElementById("detail");
	s.innerHTML = `${sessionScope.SingleMovie.detail}`;
	function deleteMsg(){
		document.getElementById("detail").innerHTML="";
	}
</script>
</body>
</html>
