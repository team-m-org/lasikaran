define(function(require){
	var	utilObj	= require("./utility");
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
					return self.validateHandler.call(this,e,self);
				});
			},
			getDocDetails : function(){
				var self =this;
				var url = "http://localhost/vac/json/doctor.php";
				return utilObj.exchangeDataFromServer('GET',url,getStorage('mobile'),function(json) {
				       if(json.status=="1"){
					    	  self.docInfo = json.data[0];
				       }
				  }
				);
			},
			validateHandler  :function(e,self){
				var inputArr = $("#doc_frm").serializeArray();
				if(utilObj.validateInputs(inputArr)){
						var doc_id = $("#doc_id").val();
						var mode;
						if(doc_id===""){
							mode = "save";
						}else{
							mode = "update";
						}
						var url = "http://localhost/vac/json/doctor.php?mode="+mode; 
						utilObj.exchangeDataFromServer('GET',url,inputArr,function(json) {
						       if(json.status==1){
						    	   showPopup("Record Updated Successfully!!");
						       }else{
						    	   showPopup("Error Occoured!!");
						       }
						    }
						)
				}
			}
	};
	return new doctorDetails();
});