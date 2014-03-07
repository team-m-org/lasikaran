define(function(require){
	var	dashBoard	= require("./dashboard");
	var	doctor		= require("./doctor");
	var	user		= require("./user");
	var tmpl_h 		= require("text!../html/menu.html");
	var menuObj = function() {};
	menuObj.prototype = {
			userInfo : {},
			init : function (){
				var self = this;
				self.userInfo = getStorage('mobile'); 
				this.render();
				this.registerEvents();
			},
			render : function (){
				var self = this;
				$(".menu-container").html(Handlebars.compile(tmpl_h)(self.userInfo));
			},
			registerEvents : function (){
				var self = this;
				var classtoShow;
				if(self.userInfo.gId==1){
					dashBoard.init();
					classtoShow = "doctor_"+self.userInfo.gId;
				}else{
					user.init();	
					classtoShow = "user_"+self.userInfo.gId;
				}
				$(".menu-container .js-navbar .userlink").addClass('hide');
				$(".menu-container .js-navbar .userlink."+classtoShow).removeClass('hide');
				
				$(".menu-container .js-navbar li").on("click", function(e) {
					return self.renderComponent.call(this,e,self);
				});
			},
			renderComponent :function (e,self){
				$(".menu-container .js-navbar li").removeClass('active');
				var renderComp  = $(this).text().toLowerCase();
				if(renderComp==="doctor"){
					doctor.init();
				}else if(renderComp==="user"){
					user.init();
				}else{
					dashBoard.init();
				}
				$(this).addClass('active');
			},
			validateHandler  :function(e,self){
				
			}
	};
	return new menuObj();
});