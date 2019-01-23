<%@page import="com.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <meta charset="UTF-8">
    <title>电影</title>
    
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
	<link rel="stylesheet" type="text/css" href="./css/movieList.css">
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
	</div>

	<div class="main">
		<div class="main-inner">
			<div class="movies-channel">
  				<div class="tags-panel">
   				<ul class="tags-lines">
	      			<li class="tags-line" data-val="{tagTypeName:'cat'}">
	        			<div class="tags-title">类型 :</div>
	        			
	        			<ul class="tags">
				            <li class="active" data-state-val="{ catTagName:'全部'}">
					            <a data-act="tag-click" data-val="{全部}" href="/MovieManager/SortMoviesAction?order=boxOffice*boxOfficeUnit" style="cursor: default">全部</a>
				          	</li> 
				          	<li>
				            	<a data-act="tag-click" data-val="{爱情}" href="/MovieManager/SortMoviesAction?type=爱情&order=boxOffice*boxOfficeUnit">爱情</a>
				         	</li>
				            <li>
				             	<a data-act="tag-click" data-val="{喜剧}" href="/MovieManager/SortMoviesAction?type=喜剧&order=boxOffice*boxOfficeUnit">喜剧</a>
				          	</li>
				          	<li>
				            	<a data-act="tag-click" data-val="{动画}" href="/MovieManager/SortMoviesAction?type=动画&order=boxOffice*boxOfficeUnit">动画</a>
				          	</li>
				          	<li>
				            	<a data-act="tag-click" data-val="{剧情}" href="/MovieManager/SortMoviesAction?type=剧情&order=boxOffice*boxOfficeUnit">剧情</a>
				          	</li>
				       
				          	<li>
				            	<a data-act="tag-click" data-val="{TagName:'惊悚'}" href="/MovieManager/SortMoviesAction?type=惊悚&order=boxOffice*boxOfficeUnit">惊悚</a>
				         	</li>
				          	<li>
				            	<a data-act="tag-click" data-val="{TagName:'科幻'}" href="/MovieManager/SortMoviesAction?type=科幻&order=boxOffice*boxOfficeUnit">科幻</a>
				          	</li>
				          	<li>
				            	<a data-act="tag-click" data-val="{TagName:'动作'}" href="/MovieManager/SortMoviesAction?type=动作&order=boxOffice*boxOfficeUnit">动作</a>
				          	</li>
				          	<li>
				            	<a data-act="tag-click" data-val="{TagName:'悬疑'}" href="/MovieManager/SortMoviesAction?type=悬疑&order=boxOffice*boxOfficeUnit">悬疑</a>
				          	</li>
				          	<li>
				            	<a data-act="tag-click" data-val="{TagName:'犯罪'}" href="/MovieManager/SortMoviesAction?type=犯罪&order=boxOffice*boxOfficeUnit">犯罪</a>
				          	</li>
				          	<li>
				            	<a data-act="tag-click" data-val="{TagName:'冒险'}" href="/MovieManager/SortMoviesAction?type=冒险&order=boxOffice*boxOfficeUnit">冒险</a>
				          	</li>
				       
				          	<li>
				            	<a data-act="tag-click" data-val="{TagName:'运动'}" href="/MovieManager/SortMoviesAction?type=运动&order=boxOffice*boxOfficeUnit">运动</a>
				          	</li>
				          	<li>
				            	<a data-act="tag-click" data-val="{TagName:'家庭'}" href="/MovieManager/SortMoviesAction?type=家庭&order=boxOffice*boxOfficeUnit">家庭</a>
				          	</li>
				          	<li>
				            	<a data-act="tag-click" data-val="{TagName:'古装'}" href="/MovieManager/SortMoviesAction?type=古装&order=boxOffice*boxOfficeUnit">古装</a>
				          	</li>
				          	
				         
				          	<li>
				            	<a data-act="tag-click" data-val="{TagName:'其他'}" href="Javascript:void(0)">其他</a>
				          	</li>
	       			 	</ul>
	      			</li>
			        <li class="tags-line tags-line-border" data-val="{tagTypeName:'source'}">
				        <div class="tags-title">区域 :</div>
				        <ul class="tags">
				          <li class="active" data-state-val="{ sourceTagName:'全部'}">
				            <a data-act="tag-click" data-val="{TagName:'全部'}" href="javascript:void(0);" style="cursor: default">全部</a>
				          </li>
				        </ul>
			        </li>
			      	<li class="tags-line tags-line-border" data-val="{tagTypeName:'year'}">
				        <div class="tags-title">年代 :</div>
				        <ul class="tags">
				          <li class="active" data-state-val="{ yearTagName:'全部'}">
				            <a data-act="tag-click" data-val="{TagName:'全部'}" href="javascript:void(0);" style="cursor: default">全部</a>
				          </li>
				        </ul>
			      	</li>
    			</ul>
  				</div>
			</div>

			<div class="movies-panel">
				<div class="movies-sorter">
			      	<div class="cat-sorter">
				        <ul>
				          <li>
				          	
				            <span class="sort-control-group" data-act="sort-click" data-val="{tagId: 1 }"  onclick="location.href='/MovieManager/SortMoviesAction?type=${sessionScope.sortType}&order=boxOffice*boxOfficeUnit'">
				              <c:if test="${sessionScope.sortOrder=='boxOffice*boxOfficeUnit' }">
				              	 <span class="sort-control sort-radio sort-radio-checked"></span>
				              </c:if>
				               <c:if test="${sessionScope.sortOrder !='boxOffice*boxOfficeUnit' }">
				              	 <span class="sort-control sort-radio"></span>
				              </c:if>
				              <span class="sort-control-label">按热门排序</span>
				            </span>
				          </li>
				          <li>
				            <span class="sort-control-group" data-act="sort-click" data-val="{tagId: 2 }" data-href="?sortId=2" onclick="location.href='/MovieManager/SortMoviesAction?type=${sessionScope.sortType}&order=releaseDate'">
				              
				               <c:if test="${sessionScope.sortOrder =='releaseDate' }">
				              	 <span class="sort-control sort-radio sort-radio-checked"></span>
				              </c:if>
				               <c:if test="${sessionScope.sortOrder !='releaseDate' }">
				              	 <span class="sort-control sort-radio"></span>
				              </c:if>
				              <span class="sort-control-label">按时间排序</span>
				            </span>
				          </li>
				          <li>
				            <span class="sort-control-group" data-act="sort-click" data-val="{tagId: 3 }" data-href="?sortId=3" onclick="location.href='/MovieManager/SortMoviesAction?type=${sessionScope.sortType}&order=score'">
				              
				               <c:if test="${sessionScope.sortOrder =='score' }">
				              	 <span class="sort-control sort-radio sort-radio-checked"></span>
				              </c:if>
				               <c:if test="${sessionScope.sortOrder !='score' }">
				              	<span class="sort-control sort-radio"></span>
				              </c:if>
				              <span class="sort-control-label">按评价排序</span>
				            </span>
				          </li>
				        </ul>
			      	</div>  	
			    </div>
				
				<div class="movies-list">
	    			<ul class="movie-list">
	    			
	    			<c:forEach var="u" items="${sessionScope.ContidionMovie }" >
	    			
		    			<li>
		    				<div class="movie-item">
					            <a href="/MovieManager/FindMovieByIdAction?update=detail&movieId=${u.id}" target="_blank" data-act="movie-click" data-val="{movieid:1208282}">
					              	<div class="movie-poster">
					                	
					                	<img src="${u.picture}">
					              	</div>
					            </a>
					        	<div class="channel-action channel-action-sale">
					 				<a>购票</a>
								</div>

		      					<div class="movie-ver"></div>
		    				</div>
						    <div class="channel-detail movie-item-title" title="${u.name }">
						      <a href="/MovieManager/FindMovieByIdAction?update=detail&movieId=${u.id}" target="_blank" data-act="movies-click" data-val="{movieId:1208282}">${u.name }</a>
						    </div>
						    
							<div class="channel-detail channel-detail-orange"><i class="integer">${u.score}</i>
							</div>
		  
	  					</li>	
	  				</c:forEach>
	  	
	    			</ul>
    			</div>




			</div>
		</div>
	</div>
		
	<div class="footer">
		
	</div>
	<script src="js/jquery.min.js"></script>
	<script>
			var active=new Array(17);
		
		 $("[data-act='tag-click']").each(function(key,value){
			if($(this).html()=="${sessionScope.sortType}"){
				$(this).parent().addClass('active').siblings().removeClass('active');
			}
            active[key] = $(this).html();      //如果是其他标签 用 html();
        });
		
	</script>
  </body>
</html>
