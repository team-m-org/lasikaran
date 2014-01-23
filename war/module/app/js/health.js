define(function(require){
	var tmpl_h = require("text!../html/healthcheckup.html");
	var healthCheck = function() {};
	healthCheck.prototype = {
			init : function (dashBoard){
				this.panel = dashBoard;
				this.render();
				this.registerEvents();
			},
			render : function (){
				$(".util-container").html(Handlebars.compile(tmpl_h));
			},
			registerEvents : function (){
				var self = this;
				$(".health_details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
			},
			validateHandler  :function(e,self){
				var inputArr = $("#h_frm").serializeArray();
				self.panel.validateInputs(inputArr);
				//self.panel.exchangeDataFromServer('get',url,param,true,function (){});
			}
	};
	return new healthCheck();
});