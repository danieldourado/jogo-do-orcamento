(function() {
	
	var canvas = document.getElementById("canvas")
	var new_zoom = screen.width/1280;
	canvas.style.transform  = "scale("+new_zoom+","+new_zoom+")";
})();
