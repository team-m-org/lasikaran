
define(function(require){
	var	menuObj	= require("./menu");
	var tmpl_h 	= require("text!../html/login.html");
	var tmpl_r 	= require("text!../html/register.html");
	var logObj = function() {};
	logObj.prototype = {
			userInfo : {},
			pagetoLoad : "",
			init : function (page){
				this.pagetoLoad = page;
				this.render();
				this.registerEvents();
			},
			render : function (){
				if(this.pagetoLoad=="login"){
					$(".util-container").html(Handlebars.compile(tmpl_h));
				}else{
					$(".util-container").html(Handlebars.compile(tmpl_r));
				}
				
			},
			registerEvents : function (){
				var self = this;
				$(".js_log_details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
			},
			validateHandler  :function(e,self){
				var url,inputArr;
				if(self.pagetoLoad=="login"){
					inputArr = $("#log_frm").serializeArray();
					url = "http://localhost/vac/json/authUser.php?mode=log&"+Math.random();
				}else{
					inputArr = $("#reg_frm").serializeArray();
					url = "http://localhost/vac/json/authUser.php?mode=reg"+Math.random();
				}	
				if(self.validateInputs(inputArr)){
					$.ajax({
						   	type: 'GET',
						   	crossDomain: true,
						    url: url,
						    data : inputArr,
						    async: false,
						    jsonpCallback: 'jsonCallback',
						    contentType: "application/json",
						    dataType: 'jsonp',
						    success: function(json) {
						       if(json.status!==0){
						    	   self.userInfo.mobile = $("#mobile_num").val();
						    	   self.userInfo.gId 	= json.status;
						    	   //console.log("============",self.userInfo);
						    	   setStorage('mobile',self.userInfo);
						    	   menuObj.init();
						       }else{
						    	   $(".error").html("Invalid Credentials !");
						       }
						    },
						    error: function(jqXHR, textStatus, errorThrown) {
						    	  console.log(textStatus, errorThrown);
						   	}
					})
				}
				//self.panel.exchangeDataFromServer('get',url,param,true,function (){});
			},
			validateInputs : function(inputArr){
				for(var i=0;i<inputArr.length;i++){
					if(!$("#"+inputArr[i].name)[0].checkValidity()){
						$("#"+inputArr[i].name).parent().removeClass('has-error').addClass('has-error');
						$("#"+inputArr[i].name).focus();
						return false;
					}else{
						$("#"+inputArr[i].name).parent().removeClass('has-error');
					}
				}
				return true;
			}
	};
	return new logObj();
});
function setStorage(key,obj){
	localStorage.setItem(key,JSON.stringify(obj));
};
function getStorage(key){
	if(localStorage.getItem(key)!= "undefined"){
		return JSON.parse(localStorage.getItem(key));
	}else{
		return [];
	}
};