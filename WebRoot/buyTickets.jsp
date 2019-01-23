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
	<title>猫咪购票</title>
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
			<div class="tags-panel">
		    	<ul class="tags-lines">
		       		<li class="tags-line">
			          	<div class="tags-title">日期:</div>
			          	<ul class="tags">
				            <li class="active">
				              <a data-act="tag-click" data-val="{TagName:'2018-11-19'}" data-bid="b_beyqev3w" href="?movieId=42964&amp;showDate=2018-11-19">
				                今天 11月19
				              </a>
				            </li>
				            <li class="">
				              <a data-act="tag-click" data-val="{TagName:'2018-11-20'}" data-bid="b_beyqev3w" href="?movieId=42964&amp;showDate=2018-11-20">
				                明天 11月20
				              </a>
				            </li>
				            <li class="">
				              <a data-act="tag-click" data-val="{TagName:'2018-11-21'}" data-bid="b_beyqev3w" href="?movieId=42964&amp;showDate=2018-11-21">
				                后天 11月21
				              </a>
				            </li>
				            <li class="">
				              <a data-act="tag-click" data-val="{TagName:'2018-11-22'}" data-bid="b_beyqev3w" href="?movieId=42964&amp;showDate=2018-11-22">
				                周四 11月22
				              </a>
				            </li>
			            </ul>
		        	</li>

		      
			        <li class="tags-line tags-line-border" data-type="brand">
			        	<div class="tags-title">品牌:</div>
			         		<ul class="tags">
					            <li class="active">
					              <a data-act="tag-click" data-val="{TagName:'全部', city_id:122}" data-id="-1" href="?movieId=42964&amp;brandId=-1" data-bid="b_n6nqkt97">全部</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'金逸影城', city_id:122}" data-id="1079568" href="?movieId=42964&amp;brandId=1079568" data-bid="b_n6nqkt97">金逸影城</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'中影国际影城', city_id:122}" data-id="23745" href="?movieId=42964&amp;brandId=23745" data-bid="b_n6nqkt97">中影国际影城</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'大地影院', city_id:122}" data-id="384262" href="?movieId=42964&amp;brandId=384262" data-bid="b_n6nqkt97">大地影院</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'金棕榈国际影城', city_id:122}" data-id="1067738" href="?movieId=42964&amp;brandId=1067738" data-bid="b_n6nqkt97">金棕榈国际影城</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'其他', city_id:122}" data-id="0" href="?movieId=42964&amp;brandId=0" data-bid="b_n6nqkt97">其他</a>
					            </li>
			          		</ul>

			        </li>

		        	<li class="tags-line tags-line-border" data-type="district">
		          		<div class="tags-title">行政区:</div>
		          			<ul class="tags">
					            <li class="active">
					              <a data-act="tag-click" data-val="{TagName:'全部', city_id:122}" data-id="-1" href="?movieId=42964&amp;districtId=-1" data-bid="b_ofl973zc">全部</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'地铁附近', city_id:122}" data-id="-2" href="?movieId=42964&amp;districtId=-2" data-bid="b_ofl973zc">地铁附近</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'海港区', city_id:122}" data-id="2131" href="?movieId=42964&amp;districtId=2131" data-bid="b_ofl973zc">海港区</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'北戴河区', city_id:122}" data-id="2133" href="?movieId=42964&amp;districtId=2133" data-bid="b_ofl973zc">北戴河区</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'昌黎县', city_id:122}" data-id="2134" href="?movieId=42964&amp;districtId=2134" data-bid="b_ofl973zc">昌黎县</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'山海关区', city_id:122}" data-id="2132" href="?movieId=42964&amp;districtId=2132" data-bid="b_ofl973zc">山海关区</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'青龙县', city_id:122}" data-id="5908" href="?movieId=42964&amp;districtId=5908" data-bid="b_ofl973zc">青龙县</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'抚宁区', city_id:122}" data-id="2135" href="?movieId=42964&amp;districtId=2135" data-bid="b_ofl973zc">抚宁区</a>
					            </li>
					            <li class="">
					              <a data-act="tag-click" data-val="{TagName:'卢龙县', city_id:122}" data-id="2136" href="?movieId=42964&amp;districtId=2136" data-bid="b_ofl973zc">卢龙县</a>
					            </li>
		          			</ul>
		        	</li>

		        	<li class="tags-line tags-line-border" data-type="hallType">
		          		<div class="tags-title">特殊厅:</div>
			          	<ul class="tags">
				            <li class="active">
				              <a data-act="tag-click" data-val="{TagName:'全部', city_id:122}" data-id="-1" href="?movieId=42964&amp;hallType=-1" data-bid="b_oz4r0rs9">全部</a>
				            </li>
				            <li class="">
				              <a data-act="tag-click" data-val="{TagName:'CGS中国巨幕厅', city_id:122}" data-id="3" href="?movieId=42964&amp;hallType=3" data-bid="b_oz4r0rs9">CGS中国巨幕厅</a>
				            </li>
				            <li class="">
				              <a data-act="tag-click" data-val="{TagName:'杜比全景声厅', city_id:122}" data-id="9" href="?movieId=42964&amp;hallType=9" data-bid="b_oz4r0rs9">杜比全景声厅</a>
				            </li>
				            <li class="">
				              <a data-act="tag-click" data-val="{TagName:'DTS:X 临境音厅', city_id:122}" data-id="25" href="?movieId=42964&amp;hallType=25" data-bid="b_oz4r0rs9">DTS:X 临境音厅</a>
				            </li>
			          	</ul>
		       		</li>
			
		    	</ul>
			</div>	

			<div class="cinemas-list">

		    	<h2 class="cinemas-list-header">影院列表</h2>
		    	
		    	<c:forEach var="u" items="${sessionScope.cinemaPage}" >
			      	<div class="cinema-cell">
			        	<div class="cinema-info">
				          <a href="/cinema/7349?poi=5453735&amp;movieId=42964" class="cinema-name" data-act="cinema-name-click" data-bid="b_wek7vrx9" data-val="{city_id: 121, cinema_id: 7349}">${u.name}</a>
				          <p class="cinema-address">${u.address}</p>
			       		</div>
	
				        <div class="buy-btn">
				          <a href="/MovieManager/QueryMovieSessionAction?cinemaId=${u.id}&movieId=${sessionScope.SingleMovie.id}" data-act="buy-btn-click" data-val="{city_id: 121, cinema_id: 7349}" data-bid="b_wek7vrx9">选座购票</a>
				        </div>
			        
				        <div class="price">
				            <span class="rmb red">￥</span>
				            <span class="price-num red"><span class="stonefont">28</span></span>
				            <span>起</span>
				        </div>
			      	</div>
			      	
				</c:forEach>
					      	
		  	</div>
				<div class="cinema-pager">
					<ul class="list-pager">
						<c:forEach begin="0" end="${sessionScope.totalPage}" varStatus="status">
						<c:if test="${sessionScope.pageNum == status.index}">	
								<li class="active" >
						</c:if>
						<c:if test="${sessionScope.pageNum != status.index}">	
								<li>
						</c:if>
							    	<a class="page_${status.index}" href="/MovieManager/FindCinemaByPageAction?pageIndex=${status.index}">${status.index+1}</a>
								</li>
						</c:forEach>
						<c:if test="${sessionScope.pageNum<sessionScope.totalPage}">
							<li>  
								<a class="page" href="/MovieManager/FindCinemaByPageAction?pageIndex=${sessionScope.pageNum+1}">下一页</a>
							</li>
						</c:if>
					</ul>
				</div>
		</div>
	</div>
	<div class="footer">
		
	</div>
	<script>

	</script>
</body>
</html>

