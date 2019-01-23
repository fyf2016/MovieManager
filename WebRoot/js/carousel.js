;(function($){
	$.fn.carousel = function(param){
		var carousel = param.carousel,//轮播框架
		indexContainer = param.indexContainer,//下标框架
		list = $(carousel).children("li"),//轮播内容
		len = list.length,//轮播内容数量
		prev = param.prev,//上翻按钮
		next = param.next,//下翻按钮
		timing = param.timing,//自动轮播间隔时间
		animateTime = param.animateTime,//动画时间
		autoPlay = param.autoPlay,//自动播放 true/false
		timer,//定时器
		index = 1,//索引值
		indexList,//下标列表
		indexClassName = "js_index",//下标高亮类名
		action = true,//开始滚动 true/false
		totalWidtn = list.width()*(list.length+2),//轮播框架总宽度
		direction = param.direction;//滚动方向
		
		/*初始化*/
		for(var i = 1;i <= list.length;i++){
			$(indexContainer).append("<li>"+i+"</li>")
		}
		$(carousel).width(totalWidtn)
		.append($(list[0]).clone())
		.prepend($(list[list.length-1]).clone())
		.css("left","-"+list.width()+"px");
		list = $(carousel).children("li");
		indexList = $(indexContainer).children("li");
		$(indexList[index-1]).addClass(indexClassName);

		/*判断是否自动播放*/
		if (autoPlay) {
			startTiming();
			$(carousel+","+prev+","+next+","+indexContainer).hover(function(){
				window.clearInterval(timer);
			},function(){
				startTiming();
			});
		}

		/*计时方法*/
		function startTiming(){
			/*判断方向*/
			switch (direction) {
				case "right" :
					timer = window.setInterval("$.rightChangeImg();",timing);
				break;
				case "left" :
					timer = window.setInterval("$.leftChangeImg();",timing);
				break;
				default:
					timer = window.setInterval("$.leftChangeImg();",timing);
			}
		};

		/*切换高亮下标*/
		$.extend({changeIndex:function(index){
			$(indexList).removeClass(indexClassName);
			$(indexList[index]).addClass(indexClassName);
		}});
		

		/*向左切换图片*/
		$.extend({leftChangeImg:function(){
			action = false;
			if (index==len) {
				index = 0;
				$(carousel).stop(true,true).css("left","0px");
			}
			index++;
			$(carousel).stop(true,true).animate({
				left : "-="+list.width()+"px"
			},animateTime);
			setTimeout(function(){
				if (index==len) {
					index = 0;
					$(carousel).stop(true,true).css("left","0px");
				}
				action = true;
			},animateTime);
			$.changeIndex(index-1);
		}});

		/*向右切换图片*/
		$.extend({rightChangeImg:function(){
			action = false;
			if (index==0) {
				index = len;
				$(carousel).stop(true,true).css("left","-"+left+"px");
			}
			index--;
			var left = totalWidtn-list.width()*2;
			$(carousel).stop(true,true).animate({
				left : "+="+list.width()+"px"
			},animateTime);
			setTimeout(function(){
				if (index==0) {
					index = len;
					$(carousel).stop(true,true).css("left","-"+left+"px");
				}
				action = true;
			},animateTime);
			if (index == 0) {
				$.changeIndex(len-1);
			}else{
				$.changeIndex(index-1);
			}
		}});

		/*下翻点击处理*/
		$(next).on("click",function(){
			var nowLeft = Math.abs(parseInt($(carousel).css("left")));
			var left = totalWidtn-list.width()*2;
			if (action) {
				if (nowLeft == left) {
					index = 0;
					$(carousel).stop(true,true).css("left","0px");
				}
				$.leftChangeImg();
			}
		});

		/*上翻点击处理*/
		$(prev).on("click",function(){
			var nowLeft = Math.abs(parseInt($(carousel).css("left")));
			var left = totalWidtn-list.width()*2;
			if (action) {
				if (nowLeft == 0) {
					index = len;
					$(carousel).stop(true,true).css("left","-"+left+"px");
				}
				$.rightChangeImg();
			}
		});

		/*下标点击处理*/
		indexList.on("click",function(){
			var no = $(this).index()+1;
			if (action) {
				if (no > index) {
					$.changeIndex(no-1);
					action = false;
					var left = (no - index)*list.width();
					index = no;
					$(carousel).stop(true,true).animate({
						left : "-="+left+"px"
					},animateTime);
					setTimeout(function(){
						action = true;
					},animateTime);
				}else if (no < index) {
					$.changeIndex(no-1);
					action = false;
					var left = (index - no)*list.width();
					index = no;
					$(carousel).stop(true,true).animate({
						left : "+="+left+"px"
					},animateTime);
					setTimeout(function(){
						action = true;
					},animateTime);
				}
	
			}
		});
	}
})(jQuery);