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
					//self.panel.exchangeDataFromServer('get','http://localhost:8081/book/','test?12',true,function (){});
					$.ajax({
						url : '/_ah/api/childdetailsendpoint/v1/childdetails',
						method : 'POST',
						dataType : 'JSON',
						contentType : 'application/json',
						data : JSON.stringify({
							childName : $('#c_name').val(),
							birthDate : $('#b_date').val(),
							gender	   : $('#genderRadios').val(),
							parent  : {
								firstName : 'first Name here',
								mobile : $('#m_name').val()
							}
						}),
						success : function (){
							$("#c_frm")[0].reset();
						}
					})
				}
			}
	};
	return new childVac();
});