/**
 * 
 * @param sttsCd
 * @returns
 */
var sttsCode;
function moveTab(sttsCd) {
	$('.nav-link').removeClass('active');
	
	sttsCode = sttsCd;
	var className = ".sttsCd" + sttsCd;
	$(className).addClass('active');
	
	$.ajax({
		url : "/myportal/mytodo",
		type : "GET",
		data : {
			"sttsCd" : sttsCd 
		},
		success : function(res) {	
			$('#requesttable').html(res);
		}			
	});
}


/**
 * 
 * @param url
 * @returns
 */
function mytodoPaging(sttsCd,pageNo) {
   console.log("~~~~~~~~~~~~~~~");
   var url = "/myportal/mytodo?sttsCd=" + sttsCode + "&page=" + pageNo;
   
   $.ajax({
      url : url,
      type : "GET",
      success : function(res) {         
         //목록
    	  $('#requesttable').html(res);    
    	  alert("ghkrdls");
      }
   
   });
}