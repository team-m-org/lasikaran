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
				self.validateInputs(inputArr);
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
	return new doctorDetails();
});