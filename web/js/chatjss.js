

var form = document.getElementById('ChatForm');
form.addEventListener('submit', function(event) {

    
       var text = document.getElementById('textfield');


if(text.value !=""){
		var msgdiv = document.createElement('DIV');
		msgdiv.className = "box";
		var msg = document.createTextNode(text.value);
		msgdiv.appendChild(msg);
		document.getElementById('textfield').value="";

		document.getElementById('chat').appendChild(msgdiv);

		event.preventDefault();

};
});
