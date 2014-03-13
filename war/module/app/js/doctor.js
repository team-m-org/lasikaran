define(function(require){
	var tmpl_h = require("text!../html/doctor.html");
	var doctorDetails = function() {};
	doctorDetails.prototype = {
			docInfo : {},
			init : function (){
				this.render();
			},
			render : function (){
				var self = this;
				$.when(self.getDocDetails()).then(function(){self.renderDoc.apply(self)});
			},
			renderDoc : function (){
				var self = this; 
				$(".util-container").html(Handlebars.compile(tmpl_h)(self.docInfo));
				$(".js-user-name a").text("Welcome "+self.docInfo.first_name+" "+self.docInfo.last_name);
		    	self.registerEvents();
			},
			registerEvents : function (){
				var self = this;
				$(".js_doc_details .btn-primary").on("click", function(e) {
					alert("called");
					return self.validateHandler.call(this,e,self);
				});
			},
			getDocDetails : function(){
				var self =this;
				var url = "http://localhost/vac/json/doctor.php" 
				return $.ajax({
					   	type: 'GET',
					   	crossDomain: true,
					    url: url,
					    data : getStorage('mobile'),
					    async: true,
					    jsonpCallback: 'jsonCallback',
					    contentType: "application/json",
					    dataType: 'jsonp',
					    success: function(json) {
					       if(json.status=="1"){
					    	  self.docInfo = json.data[0];
					    	  //$(".util-container").html(Handlebars.compile(tmpl_h)(self.docInfo));
					    	  //self.registerEvents();
					       }else{
					    	   $(".error").html("Invalid Credentials !");
					       }
					    },
					    error: function(jqXHR, textStatus, errorThrown) {
					    	  console.log(textStatus, errorThrown);
					   	}
				});
			},
			validateHandler  :function(e,self){
				var inputArr = $("#doc_frm").serializeArray();
				if(self.validateInputs(inputArr)){
						var doc_id = $("#doc_id").val();
						var mode;
						if(doc_id===""){
							mode = "save";
						}else{
							mode = "update";
						}
						var url = "http://localhost/vac/json/doctor.php?mode="+mode; 
						$.ajax({
							   	type: 'GET',
							   	crossDomain: true,
							    url: url,
							    data : inputArr,
							    async: false,
							    jsonpCallback: 'jsonCallback',
							    contentType: "application/json",
							    dataType: 'jsonp',
							    success: function(json) {
							       if(json.status==1){
							    	  
							       }else{
							    	   $(".error").html("Invalid Credentials !");
							       }
							    },
							    error: function(jqXHR, textStatus, errorThrown) {
							    	  console.log(textStatus, errorThrown);
							   	}
						})
				}
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