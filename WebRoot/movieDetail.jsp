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
    
    <title>电影详情</title>
	
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
	<link rel="stylesheet" type="text/css" href="./css/buyTickets.css">
    <link rel="stylesheet" type="text/css" href="./css/movieDetail.css">
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
	textarea:focus { oulilne:none; }
	textarea {
    	overflow: auto;
     	font: inherit;
	}

	.msgContainer{
	    position: relative;
	    width: 488px;
	    height: 158px;
	    margin: 10px 15px 20px;
	    border: 1px solid #d8d8d8;
	    border-radius: 4px;
	    padding: 10px 10px 30px;
	}
	.msgContainer textarea {
		
		width: 100%;
	    height: 100%;
	    border: none;
	    resize: none;
	}
	.writeBtn{
		color: #fff;
    	background-color: #df2d2d;
		cursor: pointer;
	    float: right;
	    margin-right: 15px;
	    width: 90px;
	    height: 40px;
	    border: none;
	    border-radius: 4px;
	    font-size: 16px;
	    line-height: 16px;
	}
	.deleteCom{
		cursor: pointer;
	    position: absolute;
	    top: -10px;
	    right: 0;
	    display: block;
	    height: 30px;
	    padding: 0 10px;
	    border-radius: 15px;
	    border: 1px solid #2d98f3;
	    text-align: center;
	    font-size: 14px;
	    line-height: 30px;
	    color: #2d98f3;
	}
	.approve{
		width: 60px;
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
			       			<li class="ellipsis"> ${sessionScope.SingleMovie.releaseDate} /${sessionScope.SingleMovie.releasePoint} </li>
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
			                		<span class="stonefont"> ${sessionScope.SingleMovie.score}</span>
			              		</span>
			              		<div class="index-right">
			                		<div class="star-wrapper">
			                  			<div class="star-on" style="width:93%;"></div>
			                		</div>
			                		<span class="score-num"><span class="stonefont">${sessionScope.SingleMovie.commentsCount}
				                 		
				                 		<c:if test="${sessionScope.SingleMovie.commentsUnit == '10000'}">
				                 			万
				                 		</c:if>
				                 		<c:if test="${sessionScope.SingleMovie.commentsUnit == '1'}">
				                 			
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
			<div class="main-content">
				<div class="tab-container">
					<div class="tab-title-container clearfix">
					
				        <div class="tab-title active" data-act="tab-desc-click">介绍</div>
				        <div class="tab-title " data-act="tab-celebrity-click">演职人员</div>
				        <div class="tab-title tab-disabled" data-act="tab-award-click">奖项</div>
				        <div class="tab-title " data-act="tab-img-click">图集</div>
			      	</div>

			      	<div class="tab-content-container">
        				<div class="tab-desc tab-content active" data-val="{tabtype:'desc'}">
        					<div class="module">
					            <div class="mod-title">
					              <h3>剧情简介</h3>
					            </div>
					            <div class="mod-content">
		                            <span class="dra">${sessionScope.SingleMovie.detail}
		                            </span>

					            </div>
 	 						</div>
							
							<div class="module  staringPeople" >
							    <div class="mod-title">
							      <h3>演职人员</h3>
							        <a class="more" href="#celebrity" data-act="all-actor-click">全部</a>
							    </div>
					    		<div class="mod-content">
					                <div class="celebrity-container clearfix">

						                <div class="celebrity-group">
										 	<div class="celebrity-type">
										    	导演
										    </div>
							 				<ul class="celebrity-list clearfix">
								      			<li class="celebrity " data-act="celebrity-click" data-val="{celebrityid:29844}">
												    <a href="/films/celebrity/29844" target="_blank" class="portrait">
												    	<img class="default-img" alt="" src="http://p1.meituan.net/moviemachine/231e87d37ebd5e191899e2210619b2dd41945.jpg@128w_170h_1e_1c">
												    </a>
													<div class="info">
													    <a href="/films/celebrity/29844" target="_blank" class="name">
													      ${sessionScope.SingleMovie.staring}
													    </a>
													</div>
												</li>

							  				</ul>
										</div>
									</div>
					        	</div>
        					</div>

							
							<div class="module">
							    <div class="mod-title">
							      <h3>热门短评</h3>
							    </div>

							    <div class="mod-content">
							        <div class="comment-list-container" data-hot="10">
										<ul>
											<c:forEach items="${sessionScope.comments}" var="u" varStatus="status">
					
							    			<li class="comment-container " data-val="{commentid:1044884745}">
							      				<div class="portrait-container">
							        				<div class="portrait">
							         					<img src="${u.headImg}" alt="">
							        				</div>
							        				<i class="level-4-icon"></i>
							      				</div>
								      				
											      <div class="main2">
											        
											        	<div class="main2-header clearfix">
											        	
													        <div class="user">
													        	
													        		 <span class="name">${u.userName}</span>	
												            		 <span class="tag">购</span>
												              
													        </div>
													        <div class="time" title="2018-11-16 12:06:10">
													            <span title="2018-11-16 12:06:10">11-16</span>
													            <ul class="score-star clearfix" data-score="10">
																    <li>
																	<i class="half-star left active"></i><i class="half-star right active"></i>    </li>
																	    <li>
																	<i class="half-star left active"></i><i class="half-star right active"></i>    </li>
																	    <li>
																	<i class="half-star left active"></i><i class="half-star right active"></i>    </li>
																	    <li>
																	<i class="half-star left active"></i><i class="half-star right active"></i>    </li>
																	    <li>
																	<i class="half-star left active"></i><i class="half-star right active"></i>    </li>
																</ul>
	
									          			     </div>
									          				<div class="approve " data-id="1044884745">
									          					<c:if test="${sessionScope.user.role == 1}">
	  																<i data-act="comment-approve-click" class="approve-icon"></i><a class="deleteCom" onclick="deleteConfirm(${u.id})">删除</a>
	  															</c:if>
									            				<c:if test="${sessionScope.user.role == 0 && sessionScope.user.id != u.user_Id}">
	  																<i data-act="comment-approve-click" class="approve-icon"></i><span class="num">4396</span>
	  															</c:if>
	  															<c:if test="${sessionScope.user.role == 0 && sessionScope.user.id == u.user_Id}">
	  																<i data-act="comment-approve-click" class="approve-icon"></i><a class="deleteCom updateBtn" data-val="${u.id}" data-act="${u.comments }">修改</a>
	  															</c:if>
									          				</div>
							        			  		</div>
							        			  		<div class="comment-content"> 
							        			  			${u.comments}
							        			  		</div>
							        			   
								      			 </div>
											      
							    			</li>
											 </c:forEach>
										</ul>
							        </div>
							       
							        <a class="comment-entry" data-act="comment-no-content-click">写短评</a>

							    </div>
							</div>


        				</div>

					</div>

				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		
	</div>
	<script src="js/jquery.min.js"></script>
	<script type="text/javascript" src="./js/carousel.js"></script>
	<script type="text/javascript" src="./js/layer.js"></script>
	<script>
	function deleteConfirm(id)
	{
		if(confirm("确定要删除吗?"))
		{
			this.location = "/MovieManager/QueryCommentsAction?update=delete&movieId=${sessionScope.SingleMovie.id}&commentsId="+id;
		}
	}
	function getCommentsId()
	{
		var s = $(".updateBtn").data("val");
		return s;
	}
	function getComments()
	{
		var s = $(".updateBtn").data("act");
		return s;
	}
	$(".updateBtn").click(function (){
	
		var cmId = getCommentsId();
		var cm = getComments();
		
		layer.open({
			  type: 1 //Page层类型
			  ,area: ['620px', '390px']
			  ,title: '修改评论'
			  ,shade: 0.6 //遮罩透明度
			  , skin: 'layui-layer-molv'
			  ,anim:2
			  ,maxmin: true //允许全屏最小化
			  ,anim: 1 //0-6的动画形式，-1不开启
			  ,content: '<form action="/MovieManager/QueryCommentsAction?" action="post"><input type="text" style="display:none;" name="movieId" value="${sessionScope.SingleMovie.id}"/>'
			  +'<input type="text" style="display:none;" name="commentsId" value="'+cmId+'" /><div style="padding:50px;" class="msgContainer"><textarea name="NewComments">'+cm+'</textarea></div>'+
			  '<input class="WriteBtn" type="submit" value="提交" data-act="comment-submit-click">'+
			  '<input type="text" style="display:none;" name="update" value="update"/></form>'
			});    
	})
	$(".comment-entry").click(function(){
			
			layer.open({
			  type: 1 //Page层类型
			  ,area: ['620px', '390px']
			  ,title: '填写评论'
			  ,shade: 0.6 //遮罩透明度
			  , skin: 'layui-layer-molv'
			  ,anim:2
			  ,maxmin: true //允许全屏最小化
			  ,anim: 1 //0-6的动画形式，-1不开启
			  ,content: '<form action="/MovieManager/QueryCommentsAction?" action="post"><input type="text" style="display:none;" name="userId" value="${sessionScope.user.id}"/>'
			  +'<input type="text" style="display:none;" name="movieId" value="${sessionScope.SingleMovie.id}" /><div style="padding:50px;" class="msgContainer"><textarea name="NewComments"></textarea></div>'+
			  '<input class="WriteBtn" type="submit" value="提交" data-act="comment-submit-click">'+
			  '<input type="text" style="display:none;" name="update" value="add"/></form>'
			});    
		});
	</script>
  </body>
</html>
