define(function(require){
	var $ 			= require('jquery');
	var Handlebars	= require('handlebars');
	var bmin 		= require('bmin');
	var	menuObj	= require("./menu");
	var tmpl_h 	= require("text!../html/login.html");
	var logObj = function() {};
	logObj.prototype = {
			init : function (){
				this.render();
				this.registerEvents();
			},
			render : function (){
				$(".util-container").html(Handlebars.compile(tmpl_h));
			},
			registerEvents : function (){
				var self = this;
				$(".js_log_details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
			},
			validateHandler  :function(e,self){
				var inputArr = $("#log_frm").serializeArray();
				if(self.validateInputs(inputArr)){
					var url = "http://localhost/vac/json/authUser.php?mode=1" 
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
						       if(json.status==1){
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