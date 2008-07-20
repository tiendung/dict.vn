/**
 * click and see demo
 * @author Tien Dung
 * use Util.getTextUnderTheMouse() in utilities.js
 */
jQuery(document).ready( function() {
  	jQuery( document ).bind("mouseup", function( event ) {
			
		if (event.button == 2 && !event.shiftKey) {
			Tn.Utils.enableContextMenu(document);
		}//end if
		
	});
	
	function createBuble ( text ) {
			
		jQuery("div").remove("#bubble");
					
		var xBubblePos = xMousePos - 88;
		var yBubblePos = yMousePos - 118;
		text = jQuery.trim( text );
		text = Tn.Utils.removePunctuation(text);
		
		if (text === "") {
			return;
		}//end if
		else {
			jQuery(document.body).append("<div style = 'position: absolute; left: " + xBubblePos + "; top: " + yBubblePos + 
				"; width: 220px; height: 120px; opacity: 1; background:url(images/logos/bubble.png) no-repeat; cursor: move;' id = 'bubble'>" +
				"<div align = 'center' style = 'position: relative; width:220px; top: 12px;'><b>" + text + "</b></div>" +
				"<div style = 'position: relative; left: 155px; top: 2px; cursor: pointer;'>" + 
				"<a href = '#' onclick = 'javascript:jQuery(\"div\").remove(\"#bubble\");'>" + 
				"<img src = 'images/icons/cross.png' border = '0' width='10px' ext:qtip='Close me'></img></a></div>" + 
				"<div id = 'bubble-text' style = 'position: relative; left: 14px; top: 10px;width:190px;'>" + 
				"<img src = 'javascripts/ext_2.0a/resources/images/default/grid/grid-loading.gif'> Searching ...</div></div>");
			jQuery("#bubble").ifixpng();
			
			jQuery.post("dict/find_summary?query=" + text, function( json ) {
								
				var data = eval("(" + json + ")");
				var summary = "This word cannot be found!";
				if (data.summary !== "") {
					summary = data.summary.substring(0, 56) + "...<br/><div align = 'center'><a href = \"javascript:Tn.Utils.searchWord('" + text + "')\">Search...</a></div>";
				}//end if
				
				jQuery("#bubble-text").html(summary);
				
			});
		}//end else
		//jQuery("#bubble").easydrag();
		
		
		var resizer = new Ext.Resizable("bubble", {
    		handles: 'all',
			draggable: true,
			transparent: true,
			enabled: false,
    		minWidth: 200,
    		minHeight: 100,
    		maxWidth: 500,
   		 	maxHeight: 400,
    		pinned: true
		});
		
		jQuery("#bubble").dblclick(function() {
				jQuery("div").remove("#bubble");
		});
		return false;
			
	}//end createBubble
		
	function createBubbleTextForRightClick (event) {
			
		if ( event.shiftKey && event.button == 2 ) {
			// ctrl           and left click
			
			var text = Tn.Utils.getTextUnderTheMouse( event );
			createBuble(text);
			Tn.Utils.disableContextMenu(document);
			
			return false;  // equal to event.preventDefault(); + event.stopPropagation(); 
	    }//end if
	}
	
	function createBubbleTextForDblClick (event) {
			
		var text = Tn.Utils.getTextUnderTheMouse( event );
		createBuble(text);
		
		return false;  // equal to event.preventDefault(); + event.stopPropagation(); 
	   
	}
		
	//Tn.Utils.disableContextMenu(document);
	jQuery( document ).bind("mousedown", createBubbleTextForRightClick);
	// Comment out dblclick
	// jQuery( document ).bind("dblclick", createBubbleTextForDblClick);
	
});