define(function(require){
	var $ 			= require('jquery');
	var Handlebars	= require('handlebars');
	var bmin 		= require('bmin');
	var	logObj	= require("./login");
	var tmpl_h 	= require("text!../html/user_launch.html");
	var ulObj = function() {};
	ulObj.prototype = {
			init : function (){
				this.render();
				this.registerEvents();
			},
			render : function (){
				$(".util-container").html(Handlebars.compile(tmpl_h));
			},
			registerEvents : function (){
				var self = this;
				$(".js_userlounch_details .btn-block").on("click", function(e) {
					return self.renderPage.call(this,e,self);
				});
			},
			renderPage  :function(e,self){
				//alert($(this).attr('data-page'))
				var page = $(this).attr('data-page');
				if(page!==undefined){
					logObj.init(page);
				}
			}
			
	};
	return new ulObj();
});