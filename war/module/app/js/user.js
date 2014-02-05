define(function(require){
	var tmpl_h = require("text!../html/user.html");
	var userDetails = function() {};
	userDetails.prototype = {
			init : function (){
				this.render();
				//this.registerEvents();
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
	return new userDetails();
});