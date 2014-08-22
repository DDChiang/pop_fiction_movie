$(document).ready(function() {
			$("#menu-button").click(function() { //only works on first one it finds
			$("#header-ul").slideToggle("medium", function() {  
				$(window).resize(function(){  
								
								var w = $(window).width();  
								
								if(w > 200 && $("#header-ul").is(':hidden')) {  
									$("#header-ul").removeAttr('style');  
								}  
			});
			});
			});
			
			
			});  