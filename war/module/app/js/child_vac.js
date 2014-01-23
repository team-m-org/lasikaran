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
				$(".util-container").html(Handlebars.compile(tmpl_cvac));
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
					self.panel.exchangeDataFromServer('get','http://localhost:8081/book/','test?12',true,function (){});
				}
				
			}
	};
	return new childVac();
});