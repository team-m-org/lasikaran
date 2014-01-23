define(function(require){
	var tmpl_prg = require("text!../html/pregnancy.html");
	var preObj = function() {};
	preObj.prototype = {
			init : function (dashBoard){
				this.panel = dashBoard;
				this.render();
				this.registerEvents();
			},
			render : function (){
				$(".util-container").html(Handlebars.compile(tmpl_prg));
			},
			registerEvents : function (){
				var self = this;
				$(".pre_details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
			},
			validateHandler  :function(e,self){
				var inputArr = $("#p_frm").serializeArray();
				self.panel.validateInputs(inputArr);
				//self.panel.exchangeDataFromServer('get',url,param,true,function (){});
			}
	};
	return new preObj();
});