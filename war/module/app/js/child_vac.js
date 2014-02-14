define(function(require){
	var tmpl_cvac = require("text!../html/child_vac.html");
	var childVac = function() {};
	childVac.prototype = {
			init : function (dashBoard){
				this.panel = dashBoard;
				this.render();
				this.registerEvents();
			},
			render : function (){
				$(".sub-dash-container").html(Handlebars.compile(tmpl_cvac));
			},
			registerEvents : function (){
				var self = this;
				$(".child-details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
			},	
			validateHandler  :function(e,self){
				var inputArr = $("#c_frm").serializeArray();
				if(self.panel.validateInputs(inputArr)){
					var url = "http://localhost/vac/json/child.php?mode=save" 
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
			}
	};
	return new childVac();
});