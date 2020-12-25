function roleupdate(userid,identity){
	var mymessage=confirm("确认修改吗？");
	if(mymessage==true){
	window.location = "roleupdate?userid=" + userid+"&identityid="+identity;
	}else{
		alert("修改已取消");
	}
	
}
function userdelete(){
	var mymessage=confirm("确认删除吗？");
	if(mymessage==true){
	//window.location = "userdelete?userid=" + userid;
	}else{
		alert("删除已取消");
	}
	
}