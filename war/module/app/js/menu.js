define(function(require){
	var $ 			= require('jquery');
	var bmin 		= require('bmin');
	var	dashBoard	= require("./dashboard");
	var	doctor		= require("./doctor");
	var	user		= require("./user");
	var tmpl_h 		= require("text!../html/menu.html");
	var menuObj = function() {};
	menuObj.prototype = {
			init : function (){
				dashBoard.init();
				this.render();
				this.registerEvents();
			},
			render : function (){
				$(".menu-container").html(Handlebars.compile(tmpl_h));
			},
			registerEvents : function (){
				var self = this;
				$(".menu-container .js-navbar ul > li").on("click", function(e) {
					return self.renderComponent.call(this,e,self);
				});
			},
			renderComponent :function (e,self){
				$(".menu-container .js-navbar ul > li").removeClass('active');
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