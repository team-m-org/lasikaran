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
				$(".sub-dash-container").html(Handlebars.compile(tmpl_prg));
			},
			registerEvents : function (){
				var self = this;
				$(".pre_details .btn-primary").on("click", function(e) {
					return self.validateHandler.call(this,e,self);
				});
				$(".pre_details .js-ongoingmonth").on("change", function(e) {
					return self.displayExpectedDate.call(this,e,self);
				});
			},
			displayExpectedDate : function(e,self){
				var ongoingMonth  = $(this).val();
				var expectedMonth = 9 - parseInt(ongoingMonth);
				//alert(expectedMonth);
				if(expectedMonth > 1){
					var today 	= new Date();
					var dd 		= today.getDate();
					var mm 		= today.getMonth()+expectedMonth; 
					var yyyy 	= today.getFullYear();
					if(dd<10){dd='0'+dd} if(mm<10){mm='0'+mm} 
					var expectedDate = mm+'/'+dd+'/'+yyyy;
					var test = new Date(expectedDate).toGMTString();
					$(".d_expectedMonth").html(test);
					$(".d_expectedMonth").parent().removeClass('hide');
				}else{
					$(".d_expectedMonth").parent().addClass('hide');
				}
			},
			validateHandler  :function(e,self){
				var inputArr = $("#p_frm").serializeArray();
				self.panel.validateInputs(inputArr);
				//self.panel.exchangeDataFromServer('get',url,param,true,function (){});
			}
	};
	return new preObj();
});