/*
var txt1 = document.getElementById("username");
alert("I am in...");
txt1.onfocus = function() {				// when enter
	if ( txt1.value == "your email") {
		txt1.value = "";
	}
}

*/

/*
 window.onload = function()
 {
 //alert("I am back...");
 var txt1 = document.getElementById("stuff_username");
 txt1.value="changed...";
};
*/

/*
txt1.onblur = function() {				//when exit
	if ( txt1.value == "") {
		txt1.value = "your email";
	}
}

*/




//JQuery

$(document).ready(function() {
     $("#username").val("KalpeshS91")
     $("#password").val("");
     //$("body").css("background-image", 'url("http://th02.deviantart.net/fs14/PRE/i/2007/053/5/3/Canvas_Texture_White_Paper_by_Enchantedgal_Stock.jpg")');
	//$('#submit').css(background-image: url("log.gif"));
     //$("#submit").css("background-image",'url("C:/Documents and Settings/Administrator/Desktop/login/log.gif")';
	 //alert("CliCk mE...");
	 //$("#2box").css("border");
	 //$("#2box").width("10em");
	 //$("#2box").accordion(); 
	 //$("#2box").draggable();
	 //$("#2box").selectable();
	 //$("#username").css("border","3px solid red");
     //$("#username").val("kalpeshs91");
	 //$("#password").val("enter");
	 //$("#txt1").width("300px").background("gray");
	 //$("#txt1").css($("div").width("300px");
	 //$("#2box").draggable();
	 //$(this).css({"background":"yellow","width":"5em"});
	 
	 $("#calender").datepicker({
			showOn: "button",
			buttonImage: "D:/Kalpesh/RoR BB/simple_blog/app/assets/images/images/calendar.jpg",
			buttonImageOnly: true
		});
		
});

