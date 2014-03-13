define(function(require){
	var Handlebars 	= require('handlebars');
	var tmpl_src 	= require("text!../html/dashboard.html");
	var childVac 	= require('./child_vac');
	var healthCheck = require('./health');
	var preObj  	= require('./pregnancy');
	var docObj  	= require('./doctor');
	
	var dashBoard = function() {};
	dashBoard.prototype = {
			docDetails : {},
			init : function (){
				var self = this;
				self.docDetails = $.extend(self.docDetails,docObj.docInfo);
				this.templateMap  =  {
					'tmp_cv' :  {'fn' : self.renderChildVac,'title' : 'Child Vaccination','tmpid' : 'tmp_cv'},
					'tmp_prg' : {'fn' : self.renderPrg,'title' : 'Pregnancy','tmpid' : 'tmp_prg'},
					'tmp_hcu' : {'fn' : self.renderHealthCheckUp,'title' : 'Health Check ups','tmpid' : 'tmp_hcu'}
				};
				this.render();
				this.renderChildVac(this);
			},
			renderPrg : function (self){
				preObj.init(self);
			},
			renderHealthCheckUp : function (self){
				healthCheck.init(self);
			},
			renderChildVac : function (self){
				childVac.init(self);
			},
			render : function (){
				var self = this;
				$(".util-container").html(Handlebars.compile(tmpl_src)(this.templateMap));
				this.registeEvents();
			},
			registeEvents: function (){
				var self = this;
				$(".util-container .notification").on("change", function(e) {
					return self.notificationHandler.call(this,e,self);
				});
			},
			notificationHandler:function (e,self){
				var tmpTorender = $(this).val();
				self.templateMap[tmpTorender]['fn'](self);
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
			},
			exchangeDataFromServer: function(method, url, param, syncParam, callBack) {
	            var self = this;
	            $.ajax({
	                beforeSend: function() {
	                    self.showLoader();
	                },
	                type: method,
	                async: syncParam,
	                dataType: "json",
	                url: url,
	                data: param,
	                success: function (data){
	                	alert("data========",data);
	                },
	                error: function(e, f) {
	                	alert("e========",e);
	                    self.hideLoader();
	                }
	            });
	        },
	        showLoader : function (){
	        	
	        },
	        hideLoader : function (){
	        	
	        }
	};
	return new dashBoard;
	
	
});