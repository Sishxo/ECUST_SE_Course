function roleupdate(userid){
	var mymessage=confirm("确认修改吗？");
	var myselect=document.getElementById("IdentityID");
	var index=myselect.selectedIndex;
	var identityid=myselect.options[index].value;
	if(mymessage==true){
	window.location = "roleupdate?userid=" + userid+"&identityid="+identityid;
	}else{
		alert("修改已取消");
	}
	
}
function userdelete(userid){
	var mymessage=confirm("确认删除吗？");
	if(mymessage==true){
	window.location = "userdelete?userid=" + userid;
	}else{
		alert("删除已取消");
	}
	
}