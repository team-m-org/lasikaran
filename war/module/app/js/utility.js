define(function(require){
	var utilObj = function() {};
	utilObj.prototype = {
			exchangeDataFromServer : function(method,url,paramArr,successCallback){
					return $.ajax({
						   	type: method,
						   	crossDomain: true,
						    url: url,
						    data : paramArr,
						    async: false,
						    jsonpCallback: 'jsonCallback',
						    contentType: "application/json",
						    dataType: 'jsonp',
						    success: successCallback,
						    error: function(jqXHR, textStatus, errorThrown) {
						    	showPopup("Failed!!!!!!!!!!");
						   	}
					})
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
	return new utilObj();
});
function setStorage(key,obj){
	localStorage.setItem(key,JSON.stringify(obj));
};
function getStorage(key){
	if(localStorage.getItem(key)!= "undefined"){
		return JSON.parse(localStorage.getItem(key));
	}else{
		return [];
	}
};
function showPopup(text){
	$(".modal-body").html(text); 
	$('#myModal').modal('show')   
}