/*
 * See at http://javascript.internet.com/page-details/mouse-coordinates.html
 */
 
var IE = document.all?true:false;
if (!IE) 
	document.captureEvents(Event.MOUSEMOVE)
document.onmousemove = getMouseXY;
var xMousePos = 0;
var yMousePos = 0;
function getMouseXY(e) {
	if (IE) { // grab the x-y pos.s if browser is IE
		xMousePos = event.clientX + document.body.scrollLeft;
		yMousePos = event.clientY + document.body.scrollTop;
	}
	else {  // grab the x-y pos.s if browser is NS
		xMousePos = e.pageX;
		yMousePos = e.pageY;
	}  
	if (xMousePos < 0){xMousePos = 0;}
	if (yMousePos < 0){yMousePos = 0;}  
	return true;
}//end getMouseXY
//  End -->
