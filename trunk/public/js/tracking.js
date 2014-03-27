var visitor_id = getCookie('visitor_id');	
if(visitor_id == null || visitor_id == ''){
	registerNewVisitor();
}else{
	sendTracking(visitor_id);
}

resend();	
sendIdentity();

function identity(formId){
	var visitor_id = getCookie('visitor_id');	
	if(visitor_id == null || visitor_id == ''){
		registerNewVisitor();
	}else{
		var form_url 	= document.URL;
		var identity_data 	= $('#'+formId).serialize()+'&visitor_id='+visitor_id+'&form_url='+form_url+'&browser='+window.navigator.userAgent;
		setCookie('iden_data',identity_data,0);			
		sendIdentity();
	}
}

function sendIdentity(){
	var identity_data = getCookie('iden_data');	
	if(identity_data != null && identity_data != ''){
		$.ajax({
			url: $('#trackingDomain').val()+'/front/tracking/identity',
			cache: false,
			type: "POST",
			async: false,
			data: identity_data, 
			// Open coment if cross domain, use jsonp
			//dataType: 'jsonp',
			success: function(res){		
				setCookie('iden_data','',0);		
				
			}
		});	
	}
}

function registerNewVisitor(){
	$.ajax({
		url: $('#trackingDomain').val()+'/front/tracking/guid',
		cache: false,
		type: "POST",
		data: "", 
		// Open coment if cross domain, use jsonp
		//dataType: 'jsonp',
		success: function(res){			
			// Open comment if cross domain
			//visitor_id = res[0];
			visitor_id = res;
            setCookie('visitor_id',visitor_id,0);				
			sendTracking(visitor_id);
		}
	});		
}

function resend(){
	var interval=setInterval(function(){get_mouse()},30000);     
	var stopTracking = true;
		function get_mouse(){
			if(stopTracking==true){
				var visitor_id = getCookie('visitor_id');
				if(visitor_id == null || visitor_id == ''){
					registerNewVisitor();
				}else{
					sendReTracking(visitor_id);
				}				
			}else{
				clearInterval(interval);
				
			}
			stopTracking=false;
		}
		$( "body" ).mousemove(function( event ) {
			stopTracking=true;
		});
	$(window).scroll(function(e){
		stopTracking=true;
	});		
}

function sendTracking(visitor){     
	var time 			= getTime();
	var reference_url 	= document.referrer;
	var curr_url   	  	= document.URL;
	var title    		= document.title;
	var my_domain		= window.location.hostname;
	var browser_name	= window.navigator.userAgent; 
	var post_url		= $('#trackingDomain').val()+'/front/tracking/tracking';  
	$.ajax({
		url: post_url,
		type: "POST",
		// Open comment if cross domain
		//dataType: 'jsonp',
		data: {visitor_id:visitor,refer_url:reference_url,current_url:curr_url,times:time,page_title:title,domain:my_domain,browser:browser_name},
		success: function(tracking_id){
			// Open comment if cross domain
			setCookie('tracking_id',tracking_id,0);		
		}
	});			
}

function sendReTracking(visitor){    
	var trackingid		= getCookie('tracking_id');
	var time 			= getTime();
	var reference_url 	= document.referrer;
	var curr_url   	  	= document.URL;
	var title    		= document.title;
	var my_domain		= window.location.hostname;
	var browser_name	= window.navigator.userAgent; 
	var post_url		= $('#trackingDomain').val()+'/front/tracking/retracking';  
	     
	$.ajax({
		url: post_url,
		type: "POST",
		// Open comment if cross domain
		//dataType: 'jsonp',
		data: {visitor_id:visitor,refer_url:reference_url,current_url:curr_url,times:time,page_title:title,domain:my_domain,browser:browser_name,tracking_id:trackingid},
		success: function(res){
			
		}
	});			
}

function setCookie(cookieName,cookieValue,nDays){
	 var today = new Date();
	 var expire = new Date();
	 if (nDays==null || nDays==0) nDays=1000;
	 expire.setTime(today.getTime() + 3600000*24*nDays);
	 document.cookie = cookieName+"="+escape(cookieValue) + ";expires="+expire.toGMTString() + ";path=/;domain=.maybanhang.net";
	 //document.cookie = cookieName+"="+escape(cookieValue) + ";expires="+expire.toGMTString();
}

function getCookie(c_name){
	var c_value = document.cookie;
	var c_start = c_value.indexOf(" " + c_name + "=");
	if (c_start == -1)
	  {
	  c_start = c_value.indexOf(c_name + "=");
	  }
	if (c_start == -1)
	  {
	  c_value = null;
	  }
	else
	  {
	  c_start = c_value.indexOf("=", c_start) + 1;
	  var c_end = c_value.indexOf(";", c_start);
	  if (c_end == -1)
	  {
	c_end = c_value.length;
	}
	c_value = unescape(c_value.substring(c_start,c_end));
	}
	return c_value;
}

function getTime(){
	var d = new Date();
	var curr_date = d.getDate();
	var curr_month = d.getMonth();
	var curr_year = d.getFullYear();			
	var curr_seconds= d.getSeconds();			
	var curr_minutes= d.getMinutes();			
	var cur_hour= d.getHours();
	var time = (curr_year + "-" + curr_month + "-" + curr_date + "-" + cur_hour + "-" + curr_minutes + "-" + curr_seconds);
	return time;
}