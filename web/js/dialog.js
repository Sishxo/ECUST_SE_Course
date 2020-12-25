	function openDialog(dialogId){
  	    //设置遮罩层为flex布局，显示遮罩层和弹窗。
  		$("#"+dialogId+"").css("display", "flex"); 
  	}
  	// 关闭弹窗的事件处理。为想要关闭弹窗的按钮添加'dialog'类即可。
  	$(".dialog-close").click(function(){
  		//找到当前关闭弹窗按钮所在的遮罩层，并隐藏。
  		$(this).parents(".overlay").hide();
  	});
  
	$("a[id*='alert-window']").click(function(){
  		var name=this.name;
  		var id=this.id;
  		//alert(title);
  		//alert(id);
  		openDialog(name);
  	});
	function sureorder(studentid,teacherid){
		var mymessage=confirm("确认拜师吗？");
		if(mymessage==true){
		window.location = "indent?studentid=" + studentid+"&teacherid="+teacherid;
		}else{
			alert("拜师已取消");
		}
	}
	function releaseorder(studentid,teacherid){
		var mymessage=confirm("确认撤销吗？");
		if(mymessage==true){
			window.location = "indentRelease?studentid=" + studentid+"&teacherid="+teacherid;
		}else{
			alert("请求已取消");
		}
	}
	function acceptorder(studentid,teacherid){
		var mymessage=confirm("确认通过吗？");
		if(mymessage==true){
			window.location = "indentAccept?studentid=" + studentid+"&teacherid="+teacherid;
		}else{
			alert("请求已取消");
		}
	}
	function refuseorder(studentid,teacherid){
		var mymessage=confirm("确认拒绝吗？");
		if(mymessage==true){
			window.location = "indentRefuse?studentid=" + studentid+"&teacherid="+teacherid;
		}else{
			alert("请求已取消");
		}
	}
