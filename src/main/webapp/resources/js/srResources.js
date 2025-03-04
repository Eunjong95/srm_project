$(document).ready(function(){
	/* sr자원 정보 가져오는 함수
	 * @author:안한길
	 * 
	 */	
	$("#srResourceTab").on("shown.bs.tab",function(){
		getResourceTableRow();
		});
	

	
});

function getResourceTableRow(){
	var srNo=$("#SRDSrNo").val();
	//console.log(srNo);

    //console.log(getContextPath());
	if($("#resourceTableRow tr").length==0){
		
		$.ajax({
			url:"/sr-resource/list",
			type:"GET",
			data:{srNo:srNo},
			success:function(result){
				//console.log(result);
				//개발자가 아니고 개발완료, 개발 취소가 아닌경우
				if($("#SRDSttsNm").val()!='개발완료'&&$("#SRDSttsNm").val()!='개발취소'&&$("#deleteSrResourceBtn").length!=0){
					result.forEach((value,index)=>{
						var count = index+1;
						$("#resourceTableRow").append(
								"<tr onclick='openUpdateResourceModal(\""+value.srSrc+"\",\""+value.empId+"\",\""+value.ptcptnRoleCd+"\")'>" +					
								"	<td onclick='event.cancelBubble=true'>" +
								"		<input value='"+value.srSrc+"' name='resource' type='checkbox'>" +
								"	</td>" +
								"	<th scope='row'>"+count+"</th>" +
								"	<td id='empNm"+value.srSrc+"'>"+value.empNm+"</td>" +
								"	<td id='ptcptnRoleNm"+value.srSrc+"'>"+value.ptcptnRoleNm+"</td>" +
								"	<td id='schdlBgngYmd"+value.srSrc+"'>"+value.schdlBgngYmd+"</td>" +
								"	<td id='schdlEndYmd"+value.srSrc+"'>"+value.schdlEndYmd+"</td>" +
								"</tr>"
						);
					});
				}else{
					result.forEach((value,index)=>{
						var count = index+1;
						$("#resourceTableRow").append(
								"<tr>" +					
								"	<td onclick='event.cancelBubble=true'>" +
								"		<input value='"+value.srSrc+"' name='resource' type='checkbox'>" +
								"	</td>" +
								"	<th scope='row'>"+count+"</th>" +
								"	<td id='empNm"+value.srSrc+"'>"+value.empNm+"</td>" +
								"	<td id='ptcptnRoleNm"+value.srSrc+"'>"+value.ptcptnRoleNm+"</td>" +
								"	<td id='schdlBgngYmd"+value.srSrc+"'>"+value.schdlBgngYmd+"</td>" +
								"	<td id='schdlEndYmd"+value.srSrc+"'>"+value.schdlEndYmd+"</td>" +
								"</tr>"
						);
					});
				}
			}
		});
	}
}
function deleteResource(){
	var srSrcList=new Array();
	
	$("#resourceTableRow input[name='resource']:checked").each(function(){
		srSrcList.push($(this).val());
	});
	
	console.log(srSrcList);
	$.ajax({
		url:"/sr-resource/resource/delete",
		type:"GET",
		dataType:"json",
		data:{srSrc:srSrcList},
		success:function(result){
			//console.log(result+""+srSrcList.length);
			if(result==srSrcList.length){
				$("#resourceTableRow input[name='resource']:checked").each(function(){
					$(this).parent("td").parent("tr").remove();
				});
			}
		}
	});
}