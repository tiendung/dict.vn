/**
 * @class Tn.Utils
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * @version 1.0.0
 */

Tn.Utils = {
	
	// isArray function to identify an object as an Array
	isArray : function( object ) {
		
		if (object instanceof Array) {
			return true;
		}//end if
		else {
			return false;
		}//end else
	}, //end isArray
	
	// Disable context menu of an element on right clicking
	disableContextMenu : function(element) {
		
		element.oncontextmenu = function() {
			return false;
		};
	}, // end disableContextMenu
	
	// Disable context menu of an element on right clicking
	enableContextMenu : function(element) {
		element.oncontextmenu = null;
	}, // end disableContextMenu
		
	// Example [{written_form: "equally"},{written_form: "every bit"}] - header is written_form
	convertArrayToString : function (array, header, color) {
		
		var str = "";
		for (var index = 0; index < array.length; index++) {
			eval("str += '<li type=circle><font color=" + color + "><b>' + array[" + index + "]." + header + 
																						"+ '</b></font></li><br/>';");
		}//end for
				
		return str;
	}, //end convertArrayToString,
	
	/**
	 * helper function for supplant() 
	 * return true if the input object is a string or a number
	 *
	 * @name isStringOrNumber
	 * @type Boolean
	 * @param Object a
	 */
	isStringOrNumber: function (a) {
		return  typeof a === "string" ||
				typeof a === "number";
	},

	/**
	 * doc and code belong to
	 * http://javascript.crockford.com/remedial.html
	 *
	 * supplant does variable substitution on the string. 
	 * It scans through the string looking for expressions enclosed in { } braces.
	 * If an expression is found, use it as a key on the object, 
	 * and if the key has a string value or number value, 
	 * it is substituted for the bracket expression and it repeats. 
	 *
	 * @example util.supplant(url, param)
	 * @before url = "{media}logo.gif"; param = {domain: 'valvion.com', media: 'http://media.valvion.com/'};
	 * @result "http://media.valvion.com/logo.gif"
	 *
	 * @name supplant
	 * @type String
	 * @param String str The template string to be replaced
	 * @param Object obj The object contains data
	 * @cat Utility
	 */
	supplant: function (str, obj) {
		return str.replace(/{([^{}]*)}/g,
			function (a, b) {
				var value = obj[ b ];
				return Util.isStringOrNumber( value ) ? value : a;
			}
		);
	},

	/**
	* jQuery( Util.supplant() ) short-hand
	* return a jQuery object after supplant a html string
	*
	* @name jQant
	* @type jQuery
	* @param String str The template string to be replaced
	* @param Object obj The object contains data
	* @cat Utility
	*/
	jQant: function (str, obj) {
		return jQuery( Util.supplant(str, obj) );
	},
  
	/**
	* return true if input array is exists
	* and contain at least one element
	* and the first element is not null and not empty string
	*
	* @name existsAndNotEmpty
	* @type Boolean
	* @param Array an array
	*/
	existsAndNotEmpty: function(a) {
		return a && a[0] && a[0] !== "" && a[0] !== null;
	},

	/**
	* mimic Rails ActiveSupport isBlank function
	*/
	isBlank: function( a ) {
		if ( typeof a == "undefined" || a === null || a === false || 
			(typeof a == "string" && jQuery.trim( a ) === "") ) { return true; }
	
		if ( a instanceof Array ) {
			for (var i = 0, il = a.length; i < il; i++ ) {
				if ( isNotBlank( a[i] ) ) { return false; }
			}
		}
		// a has passed all bank tests so a is not bank
		return false;
	},
  
	isNotBlank: function ( a ) {
		return !Util.isBlank( a );
	},
	
	removePunctuation: function(word) {
				
		for (var i = word.length - 1; i >= 0; i--) {
			if (word.charAt(i) != '!' && word.charAt(i) != '.' && 
						word.charAt(i) != ',' && word.charAt(i) != ')' && 
						word.charAt(i) != '(' && word.charAt(i) != '?' && 
						word.charAt(i) != ']' && word.charAt(i) != '[' &&
						word.charAt(i) != ';' && word.charAt(i) != ':') {
				break;
			}//end if
		}//end for
		
		return word.substring(0, i + 1);
		
	},
	
	resizeAsDesktopApp : function() {
		window.resizeTo(288, window.screen.height);
		var wbar = Ext.get('x-windows');
		wbar.setHeight(5);
			
	}, //end
	
	searchWord : function (word) {
				
		if (Tn.SearchField === null) {
			jQuery("button[@class*='x-btn-text tn-icon-dict']").trigger("click");
		}//end if
		
		Tn.SearchField.search(word);
	}//end searchWord
};

/**
 * Get Text Under Mouse
 * @desc return the word under the mouse when event is happened
 * @author dungtn@gmail.com
 */
Tn.Utils.getTextUnderTheMouse = (function () {
	// helper functions
	function getFirstChar( range ) {
		return range.toString()[0];
	}
  
	function getLastChar( range ) {
		return range.toString().substr(-1,1);
	}
  
	function isWhitespaces( string ) {
		return /\s/.test( string );
	}
  
	function expandRangeToGetText( range ) {
		var rangeStart = range.startOffset,
			rangeEnd   = range.endOffset;

		// move rangeStart to the beginning of the word
		while ( rangeStart >= 0 && ! isWhitespaces( getFirstChar(range) ) ) {
			range.setStart( range.startContainer, rangeStart );
			rangeStart--;
		}

		// move rangeStart to the end of the word
		while ( ! isWhitespaces( getLastChar(range) ) ) {
			try { range.setEnd( range.endContainer, rangeEnd ); }
			catch (exception) { break; }
				rangeEnd++;
			}
    
			return range.toString();
	}
  
	// main function
	return function (event) {
	    event = event || window.event;
	    var range = null;
	    if ( jQuery.browser.msie ) {
	      /* For Internet Explorer
		      * @reference http://gearslips.net/deardiary/category/javascript/
	                */
	      range = document.body.createTextRange(); 
	      //alert(event.clientX + " " + event.clientY);
	    
	      range.moveToPoint(event.clientX, event.clientY);
	      range.expand("word");
		  if (range.text !== "") {
				return range.text;
		  }//end if
		  else {
				var selectedText = document.selection;
				if (selectedText.type == 'Text') {
					var newRange = selectedText.createRange();
					return newRange.text;
				}//end if 
				else {
					return "";
				}//end else
		  }//end else
	    }
	    else {
			/* for W3C browsers
			* @reference http://www.webdeveloper.com/forum/showthread.php?t=135278
			*/
			// doesn't work in Safari, need to dig more
	  		range = document.createRange();
	  		range.setStart( event.rangeParent, event.rangeOffset );
	  		range.setEnd(   event.rangeParent, event.rangeOffset );
	  		return expandRangeToGetText( range );
	  	}
	};
})();
