/**
 * Created by yorge on 2017/9/9.
 */
$(function(){
	
	var mydate = new Date();
	var hour = mydate.getHours();
	var minute = mydate.getMinutes();
	var second = mydate.getSeconds();

	//带时分的日历
	$("#optsdate").jeDate({
	    isinitVal: true,
	    festival: false,
	    trigger: "click mouseenter focus",
	    isTime:true,
	    minDate:'2015-06-16',
	    maxDate:'2017-12-16',
	    hmsSetVal:{hh:hour,mm:minute,ss:second},
	    ishmsVal: true,
	    format: "YYYY-MM-DD hh:mm:ss",
	    zIndex: 3000,
	    choosefun:function() { },  //选中日期后的回调
	    clearfun:function() { },   //清除日期后的回调
	    okfun:function() { }       //点击确定后的回调
	})
	$("#reservationtime_update").jeDate({
	    isinitVal: true,
	    festival: false,
	    trigger: "click mouseenter focus",
	    isTime:true,
	    minDate:'2015-06-16',
	    maxDate:'2017-12-16',
	    hmsSetVal:{hh:hour,mm:minute,ss:second},
	    ishmsVal: true,
	    format: "YYYY-MM-DD hh:mm:ss",
	    zIndex: 3000,
	    choosefun:function() { },  //选中日期后的回调
	    clearfun:function() { },   //清除日期后的回调
	    okfun:function() { }       //点击确定后的回调
	})
	$("#optsdate4").jeDate({
	    isinitVal: true,
	    festival: false,
	    trigger: "click mouseenter focus",
	    isTime:true,
	    minDate:'2015-06-16',
	    maxDate:'2017-12-16',
	    hmsSetVal:{hh:hour,mm:minute,ss:second},
	    ishmsVal: true,
	    format: "YYYY-MM-DD hh:mm:ss",
	    zIndex: 3000,
	    choosefun:function() { },  //选中日期后的回调
	    clearfun:function() { },   //清除日期后的回调
	    okfun:function() { }       //点击确定后的回调
	})
	$("#sidingTime_update").jeDate({
	    isinitVal: true,
	    festival: false,
	    trigger: "click mouseenter focus",
	    isTime:true,
	    minDate:'2015-06-16',
	    maxDate:'2017-12-16',
	    hmsSetVal:{hh:hour,mm:minute,ss:second},
	    ishmsVal: true,
	    format: "YYYY-MM-DD hh:mm:ss",
	    zIndex: 3000,
	    choosefun:function() { },  //选中日期后的回调
	    clearfun:function() { },   //清除日期后的回调
	    okfun:function() { }       //点击确定后的回调
	})

	
	//普通日历
	$("#optsdate2").jeDate({
	    isinitVal: false,
	    festival: false,
	    trigger: "click mouseenter focus",
	    isTime:false,
	    minDate:'2015-06-16',
	    maxDate:'2017-12-16',
	    ishmsVal: true,
	    format: "YYYY-MM-DD",
	    zIndex: 3000,
	    choosefun:function() { },  //选中日期后的回调
	    clearfun:function() { },   //清除日期后的回调
	    okfun:function() { }       //点击确定后的回调
	})
	$("#optsdate22").jeDate({
	    isinitVal: false,
	    festival: false,
	    trigger: "click mouseenter focus",
	    isTime:false,
	    minDate:'2015-06-16',
	    maxDate:'2017-12-16',
	    ishmsVal: true,
	    format: "YYYY-MM-DD",
	    zIndex: 3000,
	    choosefun:function() { },  //选中日期后的回调
	    clearfun:function() { },   //清除日期后的回调
	    okfun:function() { }       //点击确定后的回调
	})
	
	//判断optsdate2  的时间是否大于  optsdate22 的时间
	$("#jedatebox").on("click",function(){
		alert("fasdfajsdf23423")
	})
	$("#jedatebox").click(function(){
		alert("fasdfajsdf23423")
	})
	$(".jedatebox").click(function(){
		alert("fasdfajsdf23423")		
	})
	$(".jedateblue").click(function(){
		alert("fasdfajsdf23423")		
	})
	$("#jedatebox").change(function(){
		alert("asdf");
	})
	$("#optsdate22").blur(function(){
		var enddate = $(this).val();
		var startdate = $("#optsdate2").val();
		
		var enddate= new Date(enddate.replace("-","/").replace("-","/"));
		var startdate= new Date(startdate.replace("-","/").replace("-","/"));
		
		if( enddate <= startdate){
			
			alert("结束日期不能小于开始日期");
		}
	})
	
})
