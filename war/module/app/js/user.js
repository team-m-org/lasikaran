define(function(require){
	var tmpl_h = require("text!../html/user.html");
	var userDetails = function() {};
	userDetails.prototype = {
			userInfo : {},
			init : function (){
				this.render();
			},
			render : function (){
				var self = this;
				$.when(self.getUserDetails()).then(function(){self.renderUser.apply(self)});
			},
			renderUser : function (){
				var self = this; 
				$(".util-container").html(Handlebars.compile(tmpl_h)(self.userInfo));
				$(".js-user-name a").text("Welcome "+self.userInfo.mobile);
		    	self.registerEvents();
			},
			registerEvents : function (){
				var self = this;
				$(".js_user_details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
			},
			validateHandler  :function(e,self){
				var inputArr = $("#user_frm").serializeArray();
				if(self.validateInputs(inputArr)){
					var url = "http://localhost/vac/json/user.php?mode=update"; 
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
						    	   showPopup("Updated successfully!");
						       }else if(json.status==0){
						    	   showPopup("Already Updated!");
						       }else{
						    	   showPopup("Invalid Credentials !");
						       }
						    },
						    error: function(jqXHR, textStatus, errorThrown) {
						    	  console.log(textStatus, errorThrown);
						   	}
					})
				}
			},
			getUserDetails : function(){
				var self =this;
				var url = "http://localhost/vac/json/user.php" 
				return $.ajax({
					   	type: 'GET',
					   	crossDomain: true,
					    url: url,
					    data : getStorage('mobile'),
					    async: true,
					    jsonpCallback: 'jsonCallback',
					    contentType: "application/json",
					    dataType: 'jsonp',
					    success: function(json) {
					       if(json.status=="1"){
					    	  self.userInfo = json.data[0];
					       }else{
					    	   showPopup("Error Occoured!");
					       }
					    },
					    error: function(jqXHR, textStatus, errorThrown) {
					    	  console.log(textStatus, errorThrown);
					   	}
				});
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
	return new userDetails();
});