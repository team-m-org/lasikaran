define(function(require){
	var tmpl_h = require("text!../html/doctor.html");
	var doctorDetails = function() {};
	doctorDetails.prototype = {
			init : function (){
				this.render();
				this.registerEvents();
			},
			render : function (){
				$(".util-container").html(Handlebars.compile(tmpl_h));
			},
			registerEvents : function (){
				var self = this;
				$(".js_doc_details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
			},
			validateHandler  :function(e,self){
				var inputArr = $("#doc_frm").serializeArray();
				if(self.validateInputs(inputArr)){
						var url = "http://localhost/vac/json/doctor.php?mode=save" 
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
							    	  
							       }else{
							    	   $(".error").html("Invalid Credentials !");
							       }
							    },
							    error: function(jqXHR, textStatus, errorThrown) {
							    	  console.log(textStatus, errorThrown);
							   	}
						})
				}
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
	return new doctorDetails();
});