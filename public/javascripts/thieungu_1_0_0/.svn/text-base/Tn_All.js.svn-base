/**
 * @class Tn
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 */

Ext.BLANK_IMAGE_URL = "images/s.gif";
 
var Tn = {
	
	Ext : {},
	
	emptyFn: function() {
	
	},
		
	/**
 	 * @class Tn.Application
 	 * @param {Object} cfg
 	 */
	Application : function(cfg) {
		
		Ext.apply(this, cfg);
	    this.addEvents({
	        'ready' : true,
	        'beforeunload' : true,
	        'sessionexpire': true
	    });
    		
		Ext.onReady(this.initApp, this);
	}, //end Application Class
	
	Panel : {},
	TreeCover : {},
	ListOfAvailableIcons : ["adverb", "conjunction", "pronoun", 
					"noun", "verb", "preposition", "adjective"],
					
	SearchField: null,
	
	DictionaryWindow : null,
	
	windowCounter: 0,
	
	launchUsingTips: function() {
		
		jQuery("#" + Tn.Constants.USING_TIPS_LAUNCHER_ID).find(":button").trigger("click");
		
	}
};//end Tn

/**
 * @class Tn.Constants
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * author Dang Khoa
 * dangkhoa3002@gmail.com
 * Contains all Constants for Thieungu App
 * @version 1.0.0
 */
 

Tn.Constants = {
	
	DICTIONARY_WINDOW_ID : "DICTIONARY_WINDOW",
	
	VIETNAMESE_ENGLISH_PANEL_ID : "VIETNAMESE_ENGLISH_PANEL",
	
	ENGLISH_VIETNAMESE_PANEL_ID : "ENGLISH_VIETNAMESE_PANEL",
	
	ENGLISH_ENGLISH_PANEL_ID : "ENGLISH_ENGLISH_PANEL",
	
	MESSAGE_OF_THE_DAY_WINDOW_ID : "MESSAGE_OF_THE_DAY_WINDOW",
	
	MESSAGE_OF_THE_DAY_PANEL_ID : "MESSAGE_OF_THE_DAY_PANEL",
	
	ENGLISH_VIETNAMESE_TREE_COMPONENT_ID : "ENGLISH_VIETNAMESE_TREE_COMPONENT_ID",
	
	ENGLISH_ENGLISH_TREE_COMPONENT_ID : "ENGLISH_ENGLISH_TREE_COMPONENT_ID",
	
	VIETNAMESE_ENGLISH_TREE_COMPONENT_ID : "VIETNAMESE_ENGLISH_TREE_COMPONENT_ID",
	
	VIETNAMESE_ENGLISH_VIETNAMESE_TREE_COMPONENT_ID : "VIETNAMESE_ENGLISH_VIETNAMESE_TREE_COMPONENT_ID",
	
	IDIOMS_THESAURUS_PANEL_ID : "IDIOM_THERASUS_PANEL",
	
	IDIOMS_THESAURUS_PANEL_TITLE : "Idioms & Thesaurus",
	
	MESSAGE_WINDOW_TITLE : "Message from Thieu Ngu",
	
	MESSAGE_CONTENT : "MESSAGE_CONTENT",
	
	USING_TIPS_WINDOW_TITLE : "Using Tips",
	
	USING_TIPS_WINDOW_ID : "USING_TIPS_WINDOW",
	
	USING_TIPS_DIV_CONTENT : "USING_TIPS_DIV_CONTENT",
	
	USING_TIPS_LAUNCHER_ID : "USING_TIPS_LAUNCHER",
	
	USING_TIPS_WINDOW_ICON_CLASS : "tn-using-tips",
	
	IDIOMS_TAB_ID : "IDIOM_TAB",
	
	IDIOMS_THERAUSUS_TAB_ID : "IDIOMS_THERAUSUS_TAB_ID",
	
	IDIOMS_TREE_COMPONENT_ID : "IDIOMS_TREE_COMPONENT_ID",
	
	THESAURUS_SYNONYM_TREE_COMPONENT_ID : "THESAURUS_SYNONYM_TREE_COMPONENT_ID",
	
	THESAURUS_ANTONYM_TREE_COMPONENT_ID : "THESAURUS_ANTONYM_TREE_COMPONENT_ID",
	
	THESAURUS_SYNONYM_TAB_ID : "THESAURUS_SYNONYM_TAB",
	
	THESAURUS_ANTONYM_TAB_ID : "THESAURUS_ANTONYM_TAB",
	
	DICTIONARY_SEARCH_FIELD: "DICTIONARY_SEARCH_FIELD",
	
	SUGGESTION_RECENT_FINDS_PANEL_ID : "SUGGESTION_RECENT_FINDS_PANEL",
	
	DICTIONARY_WINDOW_TITLE : "<b>Dictionary</b>",
	
	GUEST_BOOK_WINDOW_ID : "GUEST_BOOK_WINDOW_ID",
	
	GUEST_BOOK_PANEL_ID : "GUEST_BOOK_PANEL_ID",
	
	SIGN_BOOK_PANEL_ID : "SIGN_BOOK_PANEL_ID",
	
	GUEST_BOOK_WINDOW_TITLE: "Guestbook",
	
	DICTIONARY_WINDOW_ICON_CLASS : "tn-icon-dict",
	
	MESSAGE_WINDOW_ICON_CLASS : "tn-icon-message",
	
	ENGLISH_ENGLISH_PANEL_TITLE : "English - English Dictionary",
	
	ENGLISH_VIETNAMESE_PANEL_TITLE : "English - Vietnamese Dictionary",
	
	IDIOMS_TAB_TITLE : "Idioms",
	
	THESAURUS_TAB_TITLE : "Thesaurus",
	
	SUGGESTIONS_TAB_TITLE : "Suggestions",
	
	RECENT_FINDS_TAB_TITLE : "Recent Finds",
	
	ERROR_SUGGESTION_PANEL_ID: "ERROR_SUGGESTION_PANEL_ID",
	
	ERROR_SUGGESTION_PANEL_CONTENT: "ERROR_SUGGESTION_PANEL_CONTENT"
		
	
};//end Tn.Constants
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
/**
 * @class Tn.Ext.TreeNodeUI
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * 
 * @extends Ext.tree.TreeNodeUI
 * @param {Object} node
 * @see Ext.tree.TreeNodeUI
 */

Tn.Ext.TreeNodeUI = function(node) {
    Tn.Ext.TreeNodeUI.superclass.constructor.call(this, node);
};

Ext.extend(Tn.Ext.TreeNodeUI, Ext.tree.TreeNodeUI);

/**
 * Extend to modify function renderElements - Add in tree-node-id attribute
 * for JQuery selection
 * @param {Object} n
 * @param {Object} a
 * @param {Object} targetNode
 * @param {Object} bulkRender
 */
Tn.Ext.TreeNodeUI.prototype.renderElements = function(n, a, targetNode, bulkRender) {
	// add some indent caching, this helps performance when rendering a large tree
	this.indentMarkup = n.parentNode ? n.parentNode.ui.getChildIndent() : '';

	var cb = typeof a.checked == 'boolean';

	var href = a.href ? a.href : Ext.isGecko ? "" : "#";
	var buf = ['<li class="x-tree-node"><div ext:tree-node-id="',n.id, '" id="',n.id,'" class="x-tree-node-el x-tree-node-leaf ', a.cls,'">',
		'<span class="x-tree-node-indent">',this.indentMarkup,"</span>",
		'<img src="', this.emptyIcon, '" class="x-tree-ec-icon x-tree-elbow" />',
		'<img src="', a.icon || this.emptyIcon, '" class="x-tree-node-icon',(a.icon ? " x-tree-node-inline-icon" : ""),(a.iconCls ? " "+a.iconCls : ""),'" unselectable="on" />',
		cb ? ('<input class="x-tree-node-cb" type="checkbox" ' + (a.checked ? 'checked="checked" />' : '/>')) : '',
		'<a hidefocus="on" class="x-tree-node-anchor" href="',href,'" tabIndex="1" ',
		 a.hrefTarget ? ' target="'+a.hrefTarget+'"' : "", '><span unselectable="on">',n.text,"</span></a></div>",
		'<ul class="x-tree-node-ct" style="display:none;"></ul>',
		"</li>"].join('');

	if(bulkRender !== true && n.nextSibling && n.nextSibling.ui.getEl()){
		this.wrap = Ext.DomHelper.insertHtml("beforeBegin",
							n.nextSibling.ui.getEl(), buf);
	}else{
		this.wrap = Ext.DomHelper.insertHtml("beforeEnd", targetNode, buf);
	}
	
	this.elNode = this.wrap.childNodes[0];
	this.ctNode = this.wrap.childNodes[1];
	var cs = this.elNode.childNodes;
	this.indentNode = cs[0];
	this.ecNode = cs[1];
	this.iconNode = cs[2];
	var index = 3;
	if(cb){
		this.checkbox = cs[3];
		index++;
	}
	this.anchor = cs[index];
	this.textNode = cs[index].firstChild;
	
};//end renderElements

 /**
  * @Author Dang Khoa
  * @class Tn.Ext.TreeNode 
  * @extends Ext.tree.TreeNode
  * @tnon {Object}  The action & handler of click, dblclik, mouseover, mouseout...
  * See more at Ext.tree.TreeNode
  */
Tn.Ext.TreeNode = function(attributes) {

	attributes.uiProvider = Tn.Ext.TreeNodeUI;
	Tn.Ext.TreeNode.superclass.constructor.call(this, attributes);
	
	if (typeof(attributes.windowContent) != "undefined") {
		jQuery("#meaning_window_content").append("<div id = 'hidden-" + attributes.id + "'>" + attributes.windowContent + "</div>");
		jQuery("#meaning_window_content").append("<div id = 'hidden-meaning-" + attributes.id + "'>" + attributes.text + "</div>");
	
	}//end if 
	
};//end function

Ext.extend(Tn.Ext.TreeNode, Ext.tree.TreeNode);
/**
 * @class Tn.TreeCover.Tree
 * Abstract class, cannot be initialize, must use through other subclasses
 * Use to render Meaning Tree (English - Vietnamese, Vietnamese - English or English - English, Idioms Tree, Thesaurus Tree & Recent Finds Tree
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * @version 1.0.0
 */

// Abstract class, not for initialization
Tn.TreeCover.Tree = function ( attributes ) {
	
	jQuery.extend(this, attributes.dataObject);
	
	this.componentId = attributes.componentId;
	this.rootData = attributes.rootData;
	this.isExistingWord = this.rootData.pronunciation !== "";
	this.searchTerm = attributes.searchTerm;
	
	if (typeof(attributes.rootText) != "undefined") {
		this.rootText = attributes.rootText;
	}//end if
	
};//end Tn.TreeCover.Tree

Tn.TreeCover.Tree.prototype = {
		
	// Empty function
	// Private
	emptyFunction : function() {
	
	},
	
	/**
	 * @author Dang Khoa
	 * @param (String) part of speech in English
	 */
	retrieveIconOfPartOfSpeech : function( part_of_speech, postfix ) {
		
		for (var i = 0; i < Tn.ListOfAvailableIcons.length; i++) {
			if (part_of_speech == Tn.ListOfAvailableIcons[i]) {
				return "images/icons/word_types/" + part_of_speech + postfix;
			}//end if
		}//end for
		
		return "images/icons/word_types/other" + postfix;
		
	}, //end retrieveIconOfPartOfSpeechExample
	
	/**	
	 * This function is used to create the root of the tree together with
	 * the body of the tree
	 */
	createRootTree : function( panelId ) {
		
		var displayRootNode = this.buildRootNodeText( 
			this.rootData.written_form, this.rootData.pronunciation, panelId );
			
		var root = new Tn.Ext.TreeNode({
			text: displayRootNode,
			id:'root',
			allowDrag: false,
			allowDrop: false,
			qtip: this.buildQTipsForRootNode( this.rootData.written_form, this.rootData.pronunciation )
		});
				
		return root;
		
	},
		
	/**
	 * This function is used to build root node text template for displaying
	 * @param {String} input_word
	 * @param {String} pronunciation
	 * @return {String} rootNodeText
	 * @author Dang Khoa
	 */
	buildRootNodeText : function ( input_word, pronunciation, panel ) {
		
		var expandLinkId = "expandAllLink_" + panel;
		var collapseLinkId = "collapseAllLink_" + panel;
		
		var word_soundId = "word_sound_" + panel;
		var onclickSoundFunction = "";
		var displayPronunciation = "";		

		if (pronunciation !== null ) {
			displayPronunciation = " /" + pronunciation + "/";
		}//end if
		
		if (pronunciation !== "") {
		  speak_url = '/speak?text=' + input_word.replace(" ","+");		  
			return "<b><font size = '2'>" + input_word + "</font></b>" + displayPronunciation +
						"&nbsp;&nbsp; " +
						"<a href='#' id ='" + word_soundId + "' onclick='jQuery(\"#audio_element\").load(\"" + speak_url + "\");'>" +
						"<img src = 'images/icons/sound_add.png' ext:qtip='Listen'></img>" + 
						"</a>&nbsp;&nbsp;&nbsp;" +
						"<img src = 'images/icons/grid-blue-split.gif'></img>&nbsp;&nbsp;" +
						"<a href = '#' id = '" + expandLinkId + "'><img src = 'images/icons/expand-all.gif' ext:qtip='Expand all'></a>" +
						"&nbsp; &nbsp;" +
						"<a href = '#' id = '" + collapseLinkId + "'><img src = 'images/icons/collapse-all.gif' ext:qtip='Collapse all'></a>" +
						"<div id='audio_element'></div>";
		}//end if
		else {
			return "<b><font size = '2'>" + input_word + "</font></b>&nbsp;&nbsp;&nbsp;&nbsp; " + 
						"<img src = 'images/icons/sound_delete.png'></img>&nbsp;&nbsp;&nbsp;"; 
		}				
							
	}, //end buildRootNodeText

	/**
	 * This function is used to build quick tips for displaying as meaning examples
	 * @param {String} input_word
	 * @param {String} pronunciation
	 * @return {String} quick_tip
	 * @author Dang Khoa
	 */
	buildQTipsForRootNode : function ( input_word, pronunciation ) {
		
		if (pronunciation !== "") {
			return "<b><font size = '2'>" + input_word + "</font></b><br/>Pronunciation: " +
						"<font color = 'green'><b>/ " + pronunciation + "</b> / </font> ";
		}
		else {
			return "<b><font size = '2'>" + input_word + "</font></b><br/> " +
						"Word cannot be found";
		}
	}, //end buildQTipsForRootNode
	
	/**
	 * This function is used to set the action for expand all and collapse all link
	 * based on the panel name
	 * @param {String} panelName
	 * @param {Tree.TreePanel} tree
	 * @param {Tree.AsyncTreeNode} root
	 * @author Dang Khoa
	 */
	setCollapseAndExpandAll : function( panelName, tree, deep ) {
		
		var collapseLinkId = "collapseAllLink_" + panelName;
		var expandLinkId = "expandAllLink_" + panelName;
		
		Ext.get(expandLinkId).on('click', function() {
			tree.expandAll();
		});
		
		var notDerivativeForm = this.rootData.written_form == this.searchTerm;
		var rootNode = notDerivativeForm ? tree.getRootNode() : tree.getRootNode().childNodes[1];
		
		Ext.get(collapseLinkId).on('click', function() {
			rootNode.collapseChildNodes(true);
			if (deep === true) {
				rootNode.expandChildNodes(false);
			}//end if
		});
					
	}, //end setCollapseAndExpandAll
	
	// For extension
	processDataObject : this.emptyFunction,
	
	launchErrorSuggestionPanel : function( desktop ) {
								
		function getdisplayedHtml( errorWord, callBackFtn ) {
		
			var html = "";
			jQuery.post("dict/error_suggestion?query=" + errorWord, function( json ) {
			
				try {
					var dataObject = eval("(" + json + ")");					
				} catch (e) {
					alert("Server is busy at this time. Please try again later");
					return;
				}//end catch
				
				if (dataObject.suggestion.length === 0) {
					html += "<div class = 'error-suggestion-header'>No suggestion for word <b>" + errorWord + "</b> is available at the moment</div>";
				}//end if
				else {
					var suggestions = dataObject.suggestion;
					html += "<div class = 'error-suggestion-header'>" + errorWord + " - " + suggestions.length +  " Suggestions</div><br/>";
					
								
					jQuery.each( suggestions, function (i, aSuggestion ) {
						var action = "javascript:Tn.Utils.searchWord('" + aSuggestion.written_form + "')";
						html += "<div onclick = \"" + action + "\" style = 'float: left; cursor: pointer;'><img src = 'images/icons/book_previous.png' ext:qtip='Search word <b>" + aSuggestion.written_form + "</b>'>";
						html += "</div><div class = 'error-suggestion-word' onclick = \"" + action + "\" style = 'cursor: pointer;' ext:qtip='Search word <b>" + aSuggestion.written_form + "</b>'>";
						html += aSuggestion.written_form + "</div>";
						if (aSuggestion.summary  != "nil") {
							html += "<div class = 'error-suggestion-summary'>"  + aSuggestion.summary + "</div>";
						}//end if
						html += "<br/><br/>";
						
					});//end each
					
				}//end else
				callBackFtn(html);						
				
			});	
			
		}//end getDisplayedHtml
		
		function displayWindow ( desktop, errorWord ) {
			var aWindow = desktop.getWindow(Tn.Constants.ERROR_SUGGESTION_PANEL_ID);
			
			var contentPanel = new Ext.Panel({
									
				id: Tn.Constants.ERROR_SUGGESTION_PANEL_CONTENT,
				layout: 'fit',
				width: 300,
				
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:6px'
				},
				items: new Ext.Panel({
						id: "Suggestion_Panel_Id",
						layout: 'anchor',
						html: "<img src = 'javascripts/ext_2.0a/resources/images/default/grid/grid-loading.gif'></img> Searching...<br/><br/>"
				})
			});
						
			if(!aWindow) {
											
				aWindow = desktop.createWindow({
					id: Tn.Constants.ERROR_SUGGESTION_PANEL_ID,
					title: errorWord,
					width:300,
					x:310,
					y:10,
					shadow: false,
					iconCls: 'tn-error-suggestion',
					shim:false,
					animCollapse:false,
					border:false,
					constrainHeader:true,
					layout: 'fit',
					items: contentPanel
				});
						
			}//end if
			else {
				
				aWindow.remove(Tn.Constants.ERROR_SUGGESTION_PANEL_CONTENT, true);
				aWindow.setTitle(errorWord);
				jQuery("button[@class='x-btn-text error-suggestion']").html(errorWord);
				aWindow.add(contentPanel);
				aWindow.doLayout();
											
			}//end else
			
			aWindow.show();
			getdisplayedHtml(errorWord, function( html ) {
				
				aWindow.remove(Tn.Constants.ERROR_SUGGESTION_PANEL_CONTENT, true);
				contentPanel = new Ext.Panel({
									
					id: Tn.Constants.ERROR_SUGGESTION_PANEL_CONTENT,
					layout: 'fit',
					width: 300,
					
					defaults: {
						// applied to each contained panel
						bodyStyle: 'padding:6px'
					},
					items: new Ext.Panel({
							id: "Suggestion_Panel_Id",
							layout: 'anchor',
							html: html
					})
				});
				aWindow.add(contentPanel);
				aWindow.doLayout();
			});
		}//end displayWindow
		
		displayWindow(desktop, this.rootData.written_form);
		
	},
	
	buildTree : function ( desktop, panelId, handler, myTitle ) {
		
		var rootVisible = true;
		var realRoot = null;
		
		if (this.rootData.written_form != this.searchTerm) {
			rootVisible = false;
			realRoot = new Tn.Ext.TreeNode({
				id: 'root'
			});
			var explanNode = new Tn.Ext.TreeNode({
				text: this.searchTerm + " == " + this.rootData.written_form
			});
			realRoot.appendChild(explanNode);
		}//end if
		
		var treeRoot = this.createRootTree( panelId );
		if (realRoot !== null) {
			realRoot.appendChild(treeRoot);
		}//end if
		else {
			realRoot = treeRoot;
		}//end else
				
		if (this.isExistingWord) {
			handler( treeRoot );
		}//end if
		else {
			treeRoot.appendChild(
					new Tn.Ext.TreeNode({
						text: "Word cannot be found"
			}));
		}//end else
		
		var treePanel = new Ext.tree.TreePanel({
			title: typeof(myTitle) != "undefined" ? myTitle : "",
			id: this.componentId,
			header: false,
			lines: true,
			border: false,
			rootVisible:true,
			autoScroll:true,
			root: realRoot,
			rootVisible: rootVisible,
			animate: false,
			lines: false,
			hlColor: "ABABAB"		
		});
		
		return treePanel;
		
	},
		
	// target has type Ext.Panel
	pointTo : function( target, desktop, expandChild, panelComp, callBackFn, isPopup ) {
				
		var tree = this.processDataObject(desktop, target.id);
		var rootNode = (this.rootData.written_form == this.searchTerm) ? tree.getRootNode() : tree.getRootNode().childNodes[1];

		target.remove(this.componentId);
		target.add(tree);
		target.render();
				
		if (rootNode !== null && typeof(rootNode) != "undefined") {
			rootNode.expand();
			
			if (expandChild === true) {
				rootNode.expandChildNodes(false);
			}//end if
			if (this.isExistingWord) {
				this.setCollapseAndExpandAll(target.id, tree, true);
			}//end if
		}//end if
	
		if (typeof(isPopup) != "undefined") {
			this.listenToRightClick( desktop, rootNode ); 
		}//end if
		
		callBackFn( panelComp );
		
	}, //end pointTo
	
	listenToRightClick: function( desktop, rootNode ){
	
		var childNodes = rootNode.childNodes;
		
		for (var i = 0; i < childNodes.length; i++) {
			var posNode = childNodes[i];
			for (var j = 0; j < posNode.childNodes.length; j++) {
			
				var nodeId = posNode.childNodes[j].id;
				var written_form = this.rootData.written_form;
				var initialX = 310;
				var initialY = 10;
							
				jQuery("#" + nodeId).bind("mousedown", function(event) {
				//document.getElementById(nodeId).onmousedown = function( event ) {
				
					var button = "";
					initialX += 20;
					initialY += 20;
					
					if (Ext.isIE) {
						// IE case
						button = (event.button < 2) ? "LEFT" : ((event.button == 4) ? "MIDDLE" : "RIGHT");
						
					}//end if
					else {
						// All others
						button = (event.which < 2) ? "LEFT" : ((event.which == 2) ? "MIDDLE" : "RIGHT");
					}//end else
					
					if (button == "RIGHT" && !event.shiftKey) {
					
						var aWindow = desktop.getWindow("window_" + this.id);
						
						if (!aWindow) {
							//var explanation = jQuery("#hidden-meaning-" + this.id).html();
							var explanation = document.getElementById("hidden-meaning-" + this.id).innerHTML;
							aWindow = desktop.createWindow({
								id: "window_" + this.id,
								title: written_form + " - " + explanation.substring(0, 10) + "...",
								width: 300,
								x: initialX,
								y: initialY,
								iconCls: 'tn-word-extend-meaning',
								shim: false,
								animCollapse: false,
								border: false,
								constrainHeader: true,
								layout: 'fit',
								tbar: new Ext.Toolbar([{
									text: 'Search <b>' + written_form + "</b>",
									tooltip: 'Search this word',
									iconCls: 'tn-meaning-search-again',
									handler: function(){
										Tn.SearchField.search(written_form);
									}//end handler
								}, '-',        //,{
								//	tooltip:'Listen',
								//	iconCls:'meaning-speaker'
								//}
								{
									text: 'Copy',
									tooltip: 'Copy meaning to Clip Board',
									iconCls: 'tn-meaning-save',
									handler: function(){
										copyToClipBoard(explanation);
									}//end handler
								}]),
								items: new Ext.Panel({
								
									layout: 'fit',
									defaults: {
										// applied to each contained panel
										bodyStyle: 'padding:6px'
									},
									items: new Ext.Panel({
									
										layout: 'anchor',
										html: document.getElementById("hidden-" + this.id).innerHTML
									
									})
								})
							
							
							});
						}
						
						aWindow.show();
						aWindow.setActive(true);
						aWindow.toFront();
						Tn.Utils.disableContextMenu(this);
						return false;
					}//end if
				});
				
				
			}//end for
		}//end for
	}//end function
	
};//end Tn.TreeCover.Tree.prototype
/**
 * @class Tn.TreeCover.DictTree & Tn.TreeCover.ThesaurusTree & Tn.TreeCover.IdiomsTree
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * Contains constructor for Tn.Panel.DictPanel for Thieungu App
 * @version 1.0.0
 */

Tn.TreeCover.ThesaurusTree = function (attributes) {
	Tn.TreeCover.ThesaurusTree.superclass.constructor.call(this, attributes);
};//end constructor

Ext.extend (Tn.TreeCover.ThesaurusTree, Tn.TreeCover.Tree, {
	
	constructThesaurusTree : function() {
		
		var root = new Tn.Ext.TreeNode({
			text: this.rootText,
			allowDrag:false,
			allowDrop:false
		});
		
		jQuery.each( this[this.rootText], function(i, aThesaurus ) {
			
			if (aThesaurus.word_list.length > 0) {
			
				var summary = Tn.Utils.convertArrayToString(aThesaurus.word_list, "written_form", 'green');
				
				var aTreeNode = new Tn.Ext.TreeNode({
					text: aThesaurus.meaning,
					qtipCfg: {
						text: "<b>Antonym</b><br/><br/>" + aThesaurus.meaning + "<br/><br/>" + summary,
						autoDismiss: false,
						dismissDelay: 20000
					}					
				});
				
				
				jQuery.each(aThesaurus.word_list, function(i, word) {
					
					aTreeNode.appendChild(
						new Tn.Ext.TreeNode ({
							text: word.written_form,
							icon: "images/icons/word_types/tick.png" 	
						})
					);
				
				});
				
				root.appendChild(aTreeNode);
			}//end if
		});
		
		return root;
	}, //end constructAntonymTree
	
	processDataObject : function (desktop, panelId) {
		
		if (this.isExistingWord) {
			var root = this.constructThesaurusTree();
		}//end if
		else {
			if (this.rootText == "antonym") {
				this.launchErrorSuggestionPanel(desktop);
			}//end if
		}//end else
		
		return this.buildTree(desktop, panelId, function( thesaurusRoot ) {
			if (root.childNodes.length > 0) {
				thesaurusRoot.appendChild(root);
			}//end if
			
		});
		
			
	}//end processDataObject
	
});

Tn.TreeCover.IdiomsTree = function (attributes) {
	
	Tn.TreeCover.IdiomsTree.superclass.constructor.call(this, attributes);
	
};//end constructor

Ext.extend (Tn.TreeCover.IdiomsTree, Tn.TreeCover.Tree, {
	
	/**
	 * @author Dang Khoa
	 * @param {Json} examples
	 * @param {Ext.Tree.TreeNode} aMeaningNode
	 */
	constructExplanationNodesOfIdiom : function ( anIdiom ) {
		
		var idiomExplanations = [];
		
		jQuery.each( anIdiom.meanings, function (i, aMeaning ) {
			idiomExplanations[idiomExplanations.length] = 
											new Tn.Ext.TreeNode({
												text: aMeaning.explanation,
												icon: "images/icons/word_types/tick.png" 			
											});
			
		});
						
		return idiomExplanations;
	}, //end constructExampleNodesOfMeaning
	
	/**
	 * This function is used to build the idiom children
	 * @author Dang Khoa
	 * @param {Object} idioms
	 */
	buildIdiomsChildren : function () {
		
		var idiomsChildren = [];
		
		for (var index = 0; index < this.idioms.length; index++)  {
			var anIdiom = this.idioms[index];
			var anIdiomNode = new Tn.Ext.TreeNode({
				text: anIdiom.written_form, 
				qtip: this.constructQTipsForIdiom( anIdiom )
			});
			
			anIdiomNode.appendChild(this.constructExplanationNodesOfIdiom( anIdiom ));
			idiomsChildren[idiomsChildren.length] = anIdiomNode;
			
		}//end for
		
		return idiomsChildren;
	}, //end buildIdiomsChildren
	
	/**
	* This function is used to find all meanings of an idiom using its id
	* The result will be converted into an array in Javascript to be displayed
	* as quick tip
	* @param {Object} idiomId
	*/ 
   	constructQTipsForIdiom : function ( anIdiom ) {
    
	    quick_tips = "<b>" + anIdiom.written_form + "</b></br>";
	    quick_tips += "<br/>";
	    	    
		if (anIdiom.meanings.length === 0) {
	      quick_tips += "No meaning of this idiom is availabe at this moment";
	      return quick_tips;
	   	}//end if
	   
	   
	    jQuery.each(anIdiom.meanings, function (i, meaning) {
						
		    quick_tips += "<li><b><font color = 'green'>" + meaning.explanation + "</font></b>";
		    			
		    if (meaning.examples.length > 0) {
		    	quick_tips += "<br/><br/>";
		        quick_tips += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		    }//end if
		      
		    jQuery.each(meaning.examples, function (j, example) {
				
		        quick_tips += "<font color = 'blue'> - " + example.written_form + "</font><br/>";
		        quick_tips += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		        quick_tips += "" + example.explanation + "<br/>";
		        quick_tips += "</li><br/>";
		    });
			
		});
	    	    
	    quick_tips += "";
    
    	return quick_tips;
    }, //end build_quick_tips_for_idiom
	
   /**
	* @author Dang Khoa
	* @param {Json Object} dataObject
	*/
	processDataObject : function (desktop, panelId) {
		
		if (this.isExistingWord) {
			var idiomsChildren = this.buildIdiomsChildren();
		}//end if
		
		return this.buildTree(desktop, panelId, function( idiomsRoot ) {
			idiomsRoot.appendChild(idiomsChildren);
		});
			
	}//end processDataObject
		
});

Tn.TreeCover.DictTree = function (attributes) {
	Tn.TreeCover.DictTree.superclass.constructor.call(this, attributes);
};//end constructor

Ext.extend(Tn.TreeCover.DictTree, Tn.TreeCover.Tree, {
	
	/**
	* @author Dang Khoa
	* @param {Ext.Tree.TreeNode} root
	* @param {JSon Object} meanings
	*/
	buildMeaningChildren : function ( desktop ) {
					
		var switchVar = 0;
		var previousPOS = "", currentPOS = "";
		var maxLength = 0;
		
		var currentParentNode = null;
		var arrayOfMeaningNodes = [];
		var written_form = this.rootData.written_form;
				
		for (var index = 0; index < this.meanings.length; index++) {
			
			var aMeaning = this.meanings[index];	
			currentPOS = aMeaning.part_of_speech_vn;
			
			if (previousPOS != currentPOS) {
				
				previousPOS = currentPOS;
				if (aMeaning.part_of_speech_vn === null) {
					aMeaning.part_of_speech_vn = "Others";
				}//end if
				
				currentParentNode = new Tn.Ext.TreeNode({ 
						text: this.componentId == Tn.Constants.ENGLISH_VIETNAMESE_TREE_COMPONENT_ID ?
													aMeaning.part_of_speech_vn : aMeaning.part_of_speech_e,
						icon: this.retrieveIconOfPartOfSpeech (aMeaning.part_of_speech_e, "-root.gif")
						
					});
				switchVar = 1;
			}//end if
			
			var iconCls = "";
			if (aMeaning.examples.length === 0) {
				iconCls = "tn-meaning-leaf";
			}//end if
			
			var html = "<div class = 'meaning-header'>" + aMeaning.explanation + "</div><br/>";
			var examples = aMeaning.examples;
					
			jQuery.each( examples, function (i, anExample ) {
				html += "<div class = 'meaning-explanation'>" + anExample.written_form + "</div>";
				if (anExample.explanation  != "nil") {
					html += "<div class = 'meaning-example'>"  + anExample.explanation + "</div>";
				}//end if
				html += "<br/><br/>";
			});
			
			var aMeaningNode = new Tn.Ext.TreeNode({
				id: 'tree-node-id' + Tn.windowCounter++,
				text: aMeaning.explanation, 
				singleClickExpand: true,
				iconCls: iconCls,
				data: aMeaning,
				qtip: this.constructQTipsForWordMeaning (aMeaning),
				windowContent: html
				
			});
						
			aMeaningNode.appendChild(
				this.constructExampleNodesOfMeaning( aMeaning.examples, aMeaning.part_of_speech_e ));
			currentParentNode.appendChild(aMeaningNode);
						
			if (switchVar == 1) {
				switchVar = 0;
				arrayOfMeaningNodes[arrayOfMeaningNodes.length] = currentParentNode;
			}//end if
			
		}//end for
				
		return arrayOfMeaningNodes;
	}, //end buildMeaningChildren
		
	/**
	 * @author Dang Khoa
	 * @param {Json} examples
	 * @param {Ext.Tree.TreeNode} aMeaningNode
	 */
	constructExampleNodesOfMeaning : function ( examples, part_of_speech ) {
		
		var listOfExamplesNode = [];
				
		for (var index = 0; index < examples.length; index++)  {
			
			var anExample = examples[index];
			listOfExamplesNode[listOfExamplesNode.length] = 
				new Tn.Ext.TreeNode({
					text: anExample.written_form,
					icon: this.retrieveIconOfPartOfSpeech( part_of_speech, "-leaf.png" )
				});
						
		}//end for
		
		return listOfExamplesNode;
			
	}, //end constructExampleNodesOfMeaning
		
	/**
	 * @author Dang Khoa
	 * @param {Json} meaning
	 */
	constructQTipsForWordMeaning : function ( meaning ) {
				
		var quick_tips = "<b>" + meaning.explanation + "</b></br><br/>";
				
		if (meaning.examples.length === 0) {
			quick_tips += "No example of this meaning is available at this moment";
			return quick_tips;
		}//end if
		
		jQuery.each (meaning.examples, function (i, anExample) {
			quick_tips += "<li><font color = 'blue'>" + anExample.written_form + "</font><br/>";
			if (anExample.explanation != "nil") {
				quick_tips += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
				quick_tips += "" + anExample.explanation + "";
				quick_tips += "</li>";
			}//end if
			quick_tips += "<br/>";
		});
		
		quick_tips += "";
		
		return quick_tips;
		
	}, //end constructQTipsForWordMeaning
		
	processDataObject : function ( desktop, panelId, myTitle) {
		
		var meaningsChildren = null;
		if (this.isExistingWord) {
			meaningsChildren = this.buildMeaningChildren( desktop );
		}//end if
		
		return this.buildTree(desktop, panelId, function( dictRoot ) {
			dictRoot.appendChild(meaningsChildren);				
		}, myTitle);
				
	},//end processDataObject
	
	pointToTabPanel : function( desktop, panelComp, callBackFn, resultTree ) { 
		
		var rootNode = (this.rootData.written_form == this.searchTerm) ? resultTree.getRootNode() : resultTree.getRootNode().childNodes[1];

		if (rootNode !== null && typeof(rootNode) != "undefined") {
			rootNode.expand();
			rootNode.expandChildNodes(false);
			this.setCollapseAndExpandAll(Tn.Constants.ENGLISH_VIETNAMESE_TREE_COMPONENT_ID, resultTree, true);
		}//end if
		
		this.listenToRightClick( desktop, rootNode );
		callBackFn( panelComp );
		
	}//end pointToTabPanel
		
});//end Tn.TreeCover.DictTree

// Dictionary panel 
Tn.Panel.DictPanel = function ( panelConfig, desktop ) {

	this.calledUrl = panelConfig.url;
	this.target = panelConfig.target;
	
	this.render = function( parameter, searchTerm ) {
		
		//searchTerm = escape(searchTerm);
		var arrayOfPanel = [];
		
		if (Tn.Utils.isArray(panelConfig.target)) { 
			for (var index = 0; index < panelConfig.target.length; index++) {
				
				var targetPanel = Ext.getCmp(panelConfig.target[index].id);
				targetPanel.body.mask('Searching...', 'x-mask-loading');
				arrayOfPanel[arrayOfPanel.length] = targetPanel;
			}//end for
		}//end if
				
		jQuery.post(this.calledUrl, { 'query': searchTerm }, function ( jsonString) {
			
			//console.profile();
			try {
				var dataObject = eval("(" + jsonString + ")");
			}//end try
			catch (e) {
				alert("Server is busy at this time. Please try again later");
				return;
			}//end catch
			
			
			// Reset the meaning window content div
			if (jQuery("#meaning_window_content").length === 0) {
				var divContent = document.createElement("div");
				divContent.id = "meaning_window_content";
				divContent.style.display = "none";
				document.body.appendChild(divContent);	
			}//end if
			jQuery("#meaning_window_content").html("");
						
			if (Tn.Utils.isArray(panelConfig.target)) { // English & Vietnamese Dict
							
				var rootData = {
					'written_form': dataObject.ev_dict.written_form, 
					'pronunciation': dataObject.ev_dict.pronunciation
				};
				
				if (typeof(dataObject.ve_dict.meanings) == "undefined" || dataObject.ve_dict.meanings.length === 0) {
					
					panelConfig.target[0].remove(Tn.Constants.ENGLISH_VIETNAMESE_TREE_COMPONENT_ID);
					panelConfig.target[0].remove(Tn.Constants.VIETNAMESE_ENGLISH_TREE_COMPONENT_ID);
					jQuery(jQuery("#ENGLISH_VIETNAMESE_PANEL").find("div")[0]).css("display", "");	
					jQuery(jQuery("#ENGLISH_VIETNAMESE_PANEL").find("span")[0]).html("English - Vietnamese Dictionary");
					
					var englishVietnameseRenderedTree = new Tn.TreeCover.DictTree({
						dataObject: dataObject.ev_dict, 
						componentId: Tn.Constants.ENGLISH_VIETNAMESE_TREE_COMPONENT_ID,
						rootData: rootData,
						searchTerm: searchTerm
					});
												
					var englishEnglishRenderedTree = new Tn.TreeCover.DictTree({
						dataObject: dataObject.ee_dict,
						componentId: Tn.Constants.ENGLISH_ENGLISH_TREE_COMPONENT_ID,
						rootData : rootData,
						searchTerm: searchTerm
					});
														
					var idiomsRenderedTree = new Tn.TreeCover.IdiomsTree({
						dataObject: dataObject.idioms,
						componentId: Tn.Constants.IDIOMS_TREE_COMPONENT_ID,
						rootData: rootData,
						searchTerm: searchTerm
					});
									
					var thesaurusSynonymRenderedTree = new Tn.TreeCover.ThesaurusTree({
						dataObject: dataObject.thesaurus,
						componentId: Tn.Constants.THESAURUS_SYNONYM_TREE_COMPONENT_ID,
						rootData: rootData,
						searchTerm: searchTerm,
						rootText: "synonym"
					});
					
					var thesaurusAntonymRenderedTree = new Tn.TreeCover.ThesaurusTree({
						dataObject: dataObject.thesaurus,
						componentId: Tn.Constants.THESAURUS_ANTONYM_TREE_COMPONENT_ID,
						rootData: rootData,
						searchTerm: searchTerm,
						rootText: "antonym"
					});
			
					englishVietnameseRenderedTree.pointTo(panelConfig.target[0], desktop, true, arrayOfPanel[0], 
						
																										function( thisPanelComp ) {
						setTimeout(function() {
							thisPanelComp.body.unmask();
						}, 200);
					}, true);
					
					
					englishEnglishRenderedTree.pointTo(panelConfig.target[1], desktop, true, arrayOfPanel[1], 
																									function( thisPanelComp ) {
						setTimeout(function() {
							thisPanelComp.body.unmask();
						}, 200);
					}, true);
					
					idiomsRenderedTree.pointTo(panelConfig.target[2], desktop, false, arrayOfPanel[2], 
																									function( thisPanelComp ) {
						setTimeout(function() {
							thisPanelComp.body.unmask();
						}, 200);
					});		
					
					thesaurusSynonymRenderedTree.pointTo(panelConfig.target[3], desktop, true, arrayOfPanel[3], 
																									function( thisPanelComp ) {
						setTimeout(function() {
							thisPanelComp.body.unmask();
						}, 200);
						//console.profileEnd();
					});
					
					
					thesaurusAntonymRenderedTree.pointTo(panelConfig.target[4], desktop, true, arrayOfPanel[4], 
																									function( thisPanelComp ) {
						setTimeout(function() {
							thisPanelComp.body.unmask();
						}, 200);
						//console.profileEnd();
					});
					
				}//end if
				else {
												
					rootData.pronunciation = dataObject.ve_dict.pronunciation;
					var vietnameseEnglishRenderedTreeLeft = new Tn.TreeCover.DictTree({
						dataObject: dataObject.ve_dict, 
						componentId: Tn.Constants.VIETNAMESE_ENGLISH_TREE_COMPONENT_ID,
						rootData: rootData,
						searchTerm: searchTerm
					});
					jQuery(jQuery("#ENGLISH_VIETNAMESE_PANEL").find("span")[0]).html("Vietnamese - English Dictionary");
					panelConfig.target[0].remove(Tn.Constants.VIETNAMESE_ENGLISH_TREE_COMPONENT_ID);	
					panelConfig.target[0].remove(Tn.Constants.ENGLISH_VIETNAMESE_TREE_COMPONENT_ID);				
					
					if (typeof(dataObject.ev_dict.meanings) != "undefined" && dataObject.ev_dict.meanings.length > 0) {
						rootData.pronunciation = dataObject.ev_dict.pronunciation;
						var englishVietnameseRenderedTreeBelow = new Tn.TreeCover.DictTree({
							dataObject: dataObject.ev_dict, 
							componentId: Tn.Constants.ENGLISH_VIETNAMESE_TREE_COMPONENT_ID,
							rootData: rootData,
							searchTerm: searchTerm
						});
						
					
																
						var veTreeLeft = vietnameseEnglishRenderedTreeLeft.processDataObject(desktop, Tn.Constants.VIETNAMESE_ENGLISH_TREE_COMPONENT_ID, "Vietnamese - English");
						var evTreeBelow = englishVietnameseRenderedTreeBelow.processDataObject(desktop, Tn.Constants.ENGLISH_VIETNAMESE_TREE_COMPONENT_ID, "English - Vietnamese");
						jQuery(jQuery("#ENGLISH_VIETNAMESE_PANEL").find("div")[0]).css("display", "none");
						
						var tabPanel = new Ext.TabPanel (
							{
								border: false,
								split: true,
								id: Tn.Constants.ENGLISH_VIETNAMESE_TREE_COMPONENT_ID,
								activeTab: 1,
								tabPosition: 'top',
								resizeTabs : true,
								tabWidth: 140,
								items: [evTreeBelow, veTreeLeft]
							}
						);
																					
						panelConfig.target[0].add(tabPanel);
						panelConfig.target[0].render();
						tabPanel.setActiveTab(tabPanel.getComponent(Tn.Constants.ENGLISH_VIETNAMESE_TREE_COMPONENT_ID));
						jQuery("#" + Tn.Constants.ENGLISH_VIETNAMESE_TREE_COMPONENT_ID).css("width", Ext.lib.Dom.getViewWidth() + "px");			
						
						englishVietnameseRenderedTreeBelow.pointToTabPanel(desktop, panelConfig.target[0], function() {}, veTreeLeft);
						vietnameseEnglishRenderedTreeLeft.pointToTabPanel(desktop, panelConfig.target[0], 
							function( thisPanelComp ) {
								setTimeout(function() {
									thisPanelComp.body.unmask();
								}, 200);
							
							}, evTreeBelow);
													
					}//end if
					else {	
								
						jQuery(jQuery("#ENGLISH_VIETNAMESE_PANEL").find("div")[0]).css("display", "");	
						vietnameseEnglishRenderedTreeLeft.pointTo(panelConfig.target[0], desktop, true, arrayOfPanel[0], 
																						function( thisPanelComp ) {
							setTimeout(function() {
								thisPanelComp.body.unmask();
							}, 200);
						}, true);
					}//end else
				
					if (typeof(dataObject.ee_dict.meanings) != "undefined" && dataObject.ee_dict.meanings.length > 0) {
						
						rootData.pronunciation = dataObject.ee_dict.pronunciation;
					
						var englishEnglishRenderedTreeRight = new Tn.TreeCover.DictTree({
							dataObject: dataObject.ee_dict,
							componentId: Tn.Constants.ENGLISH_ENGLISH_TREE_COMPONENT_ID,
							rootData : rootData,
							searchTerm: searchTerm
						});

						var idiomsRenderedTreeBottom = new Tn.TreeCover.IdiomsTree({
							dataObject: dataObject.idioms,
							componentId: Tn.Constants.IDIOMS_TREE_COMPONENT_ID,
							rootData: rootData,
							searchTerm: searchTerm
						});
									
						var thesaurusSynonymRenderedTreeBottom = new Tn.TreeCover.ThesaurusTree({
							dataObject: dataObject.thesaurus,
							componentId: Tn.Constants.THESAURUS_SYNONYM_TREE_COMPONENT_ID,
							rootData: rootData,
							searchTerm: searchTerm,
							rootText: "synonym"
						});
						
						var thesaurusAntonymRenderedTreeBottom = new Tn.TreeCover.ThesaurusTree({
							dataObject: dataObject.thesaurus,
							componentId: Tn.Constants.THESAURUS_ANTONYM_TREE_COMPONENT_ID,
							rootData: rootData,
							searchTerm: searchTerm,
							rootText: "antonym"
						});
						
						englishEnglishRenderedTreeRight.pointTo(panelConfig.target[1], desktop, true, arrayOfPanel[1], 
																									function( thisPanelComp ) {
							setTimeout(function() {
								thisPanelComp.body.unmask();
							}, 200);
						}, true);
						
						idiomsRenderedTreeBottom.pointTo(panelConfig.target[2], desktop, false, arrayOfPanel[2], 
																										function( thisPanelComp ) {
							setTimeout(function() {
								thisPanelComp.body.unmask();
							}, 200);
						});		
						
						thesaurusSynonymRenderedTreeBottom.pointTo(panelConfig.target[3], desktop, true, arrayOfPanel[3], 
																									function( thisPanelComp ) {
							setTimeout(function() {
								thisPanelComp.body.unmask();
							}, 200);
							//console.profileEnd();
						});
					
						thesaurusAntonymRenderedTreeBottom.pointTo(panelConfig.target[4], desktop, true, arrayOfPanel[4], 
																									function( thisPanelComp ) {
							setTimeout(function() {
								thisPanelComp.body.unmask();
							}, 200);
							//console.profileEnd();
						});
											
					}//end if
					else {
						jQuery("#" + Tn.Constants.ENGLISH_ENGLISH_TREE_COMPONENT_ID).html("");
						jQuery("#THESAURUS_TREE_COMPONENT_ID").html("");
						jQuery("#IDIOMS_TREE_COMPONENT_ID").html("");
						arrayOfPanel[1].body.unmask();
						arrayOfPanel[2].body.unmask();
						arrayOfPanel[3].body.unmask();
						arrayOfPanel[4].body.unmask();
						//console.profileEnd();
					}//end else
				}//end else
				
					
			}//end if
			else {
				var renderedTree = new Tn.TreeCover.DictTree(dataObject);
				renderedTree.pointTo(panelConfig.target, desktop);
			}//end else
		
		});
						
	};//end render
	
};//end Tn.Panel.DictPanel
/**
 * @class Tn.Application.SearchField
 * A javascript Search Field (textbox) with Search and Reset button
 * @author Dang Khoa 
 * @version 1.0.0
 */
Tn.Application.SearchField = Ext.extend(Ext.form.ComboBox, {
    
	// See at Ext.form.TwinTriggerField	
	initComponent : function(){
        if(!this.store.baseParams) {
			this.store.baseParams = {};
		}
				
		Tn.Application.SearchField.superclass.initComponent.call(this);
		this.on('specialkey', function(f, e){
            if(e.getKey() == e.ENTER){
                this.onTrigger2Click();
            }
        }, this);
		
		this.triggerConfig = {
            tag:'span', cls:'x-form-twin-triggers', cn:[
            {tag: "img", src: Ext.BLANK_IMAGE_URL, cls: "x-form-trigger " + this.trigger1Class},
            {tag: "img", src: Ext.BLANK_IMAGE_URL, cls: "x-form-trigger " + this.trigger2Class},
			{tag: "img", src: Ext.BLANK_IMAGE_URL, cls: "x-form-trigger x-form-arrow-trigger"}
        ]};
			
    },
	
	// See at Ext.form.TwinTriggerField
	getTrigger : function(index){
        return this.triggers[index];
    },
	
	// See at Ext.form.TwinTriggerField
	initTrigger : function(){
        var ts = this.trigger.select('.x-form-trigger', true);
        this.wrap.setStyle('overflow', 'hidden');
        var triggerField = this;
        ts.each(function(t, all, index){
            t.hide = function(){
                var w = triggerField.wrap.getWidth();
                this.dom.style.display = 'none';
                triggerField.el.setWidth(w-triggerField.trigger.getWidth());
            };
            t.show = function(){
                var w = triggerField.wrap.getWidth();
                this.dom.style.display = '';
                triggerField.el.setWidth(w-triggerField.trigger.getWidth());
            };
            var triggerIndex = 'Trigger'+(index+1);

            if(this['hide'+triggerIndex]){
                t.dom.style.display = 'none';
            }
            t.on("click", this['on'+triggerIndex+'Click'], this, {preventDefault:true});
            t.addClassOnOver('x-form-trigger-over');
            t.addClassOnClick('x-form-trigger-click');
        }, this);
        this.triggers = ts.elements;
    },

	
	initEvents : function(){ // override the initEvents method in Ext.Form.Combo
		Ext.form.ComboBox.superclass.initEvents.call(this);

		this.keyNav = new Ext.KeyNav(this.el, {
			"up" : function(e){
				
				this.inKeyMode = true;
				this.selectPrev();
				
			},
						
			"down" : function(e){
				if(!this.isExpanded()){
					this.onTriggerClick();
				} else{
					this.inKeyMode = true;
					this.selectNextEntry();
				}//end else
			},

			"enter" : function(e){
				this.searchBySuggestion();				
			},

			"esc" : function(e){
				
				this.collapse();
				
			},

			"tab" : function(e){
				this.onViewClick(false);
				return true;
			},

			scope : this,

			doRelay : function(foo, bar, hname){
				if(hname == 'down' || this.scope.isExpanded()){
				   return Ext.KeyNav.prototype.doRelay.apply(this, arguments);
				}
				return true;
			}
		});
		
		this.queryDelay = Math.max(this.queryDelay || 10,
				this.mode == 'local' ? 10 : 1500);
			
		this.dqTask = new Ext.util.DelayedTask(this.initQuery, this);
		if(this.typeAhead){
			this.taTask = new Ext.util.DelayedTask(this.onTypeAhead, this);
		}
		if(this.editable !== false){
			this.el.on("keyup", this.onKeyUp, this);
		}
		if(this.forceSelection){
			this.on('blur', this.doForce, this);
		}
	},
	selectNext : function(){
		var ct = this.store.getCount();
		if(ct > 0){
			if(this.selectedIndex == -1){
				this.select(-1);
			} else if(this.selectedIndex < ct-1){
				this.select(this.selectedIndex+1);
			}
		}
	},	
	selectNextEntry : function(){
		var ct = this.store.getCount();
		if(ct > 0){
			if(this.selectedIndex == -1){
				this.select(0);
			} else if(this.selectedIndex < ct-1){
				this.select(this.selectedIndex+1);
			}
		}
	},
	    
    onTrigger1Click : function(){
        if(this.hasSearch){
            this.el.dom.value = '';
            this.triggers[0].hide();
            this.hasSearch = false;
			this.focus();
        }
    },
	
	// private
    onKeyUp : function(e){
		
		if (e.keyCode == 115) {
			return;
		}//end if
			
		this.suppressSuggestion(e.keyCode == e.ENTER);
		
		if (e.keyCode != e.UP && e.keyCode != e.DOWN && e.keyCode != e.ENTER &&
				e.keyCode != e.ESC &&
				e.keyCode != 17 && this.currentMode != this.suggestionsMode) {
			this.switchModeTo(this.suggestionsMode);
		}

		if (this.getRawValue() === "" && this.currentMode == this.suggestionsMode) {
			this.collapse();
		}//end if
					
        if(this.editable !== false && !e.isSpecialKey()){
		
            this.lastKey = e.getKey();
            this.dqTask.delay(this.queryDelay);
        }
		
		
    },
	
	// Suppress Suggestions by setting minChars to 1000
	suppressSuggestion: function (willSuppress) {
				
		if (willSuppress === true) {
			this.minChars = 1000;
		}
		else {
			this.minChars = 1;
		}
	},

    onTrigger2Click : function(){
        
		this.collapse();
		this.suppressSuggestion(true);
				
		var v = this.getRawValue();
		this.lastQuery = v;
		
		if(v.length < 1){
            this.onTrigger1Click();
            return;
        }
		
		this.hasSearch = true;
		this.triggers[0].show(); // Show delete button
		this.focus();
		
		if (Tn.Utils.isArray(this.renderedTreeCfg)) {
			
			for (var index = 0; index < this.renderedTreeCfg.length; index++) {
			
				var aPanel = new Tn.Panel.DictPanel(this.renderedTreeCfg[index], this.desktop);
				aPanel.render(this.paramName, v);
							
			}//end for
		}//end if
		else {
			var dictPanel = new Tn.Panel.DictPanel(this.renderedTreeCfg, this.desktop);
			dictPanel.render(this.paramName, v);
		}//end else
		
		this.collapse();
    },//end onTrigger2Click
	
	onTrigger3Click: function() {
		this.switchModeTo("RecentWords");
	},
	
	search: function(value) {
	
		this.setRawValue(value);
		this.onTrigger2Click();
		
	},//end search
	
	searchBySuggestion: function() {
				
		var index = this.view.getSelectedIndexes()[0];
		
        var r = this.store.getAt(index);
		if (r) {
			this.setRawValue(r.data.written_form);
		}
		if ( jQuery.browser.msie ) {
			// Do nothing as IE will automatically executes the search
		}//end if
		else {
			this.onTrigger2Click();
		}//end else
		
		this.collapse();
				
	},//end search
	
	// This function is used to switch from Suggestion mode to Recent word mode
	// and vice versa
	// @mode can be "suggestion" or "recent_words"
	switchModeTo: function( mode ) {
		
		this.currentMode = mode;
		var toUrl = "";
		
		if (mode == this.suggestionsMode) {
			this.minChars = 1;
			toUrl = "suggest";
		}//end if
		
		if (mode == this.recentWordsMode) {
			this.minChars = 0;
			toUrl = "dict/recent_look_ups";
		}//end if
		
		this.store.proxy = new Ext.data.HttpProxy({
	        url: toUrl
	    });
		
		this.switchOnViewMode(mode);
		
		this.onTriggerClick();						
	},
		
	switchOnViewMode : function ( currentMode ) {
		
		if (this.currentMode == this.suggestionsMode) {
			this.onViewClick = function( doFocus ) {
				this.onViewClickForSuggestionMode(doFocus);
			};//end onViewClick
		}//end if
		else {
			this.onViewClick = function( doFocus ) {
				this.onViewClickForRecentWordsMode(doFocus);
			};//end onViewClick
		}//end else
	},
	
	onViewClickForRecentWordsMode : function( doFocus ) {
	  		
		var index = this.view.getSelectedIndexes()[0];
        var r = this.store.getAt(index);
		if (r) {
			this.setRawValue(r.data.written_form);
		}//end if
		
		this.collapse();
		
		if(doFocus !== false){
            this.el.focus();
        }
		
		this.onTrigger2Click();
		
    },
	
	onViewClickForSuggestionMode : function(doFocus) {
	  
        var index = this.view.getSelectedIndexes()[0];
        var r = this.store.getAt(index);
        if(r){
            this.onSelect(r, index);
        }
        if(doFocus !== false){
            this.el.focus();
        }
		
    },
	
	// Override the onTriggerClick in Combo box
    onTriggerClick : function(){
			
        if(this.disabled){
            return;
        }
        if(this.isExpanded()){
            this.collapse();
            this.el.focus();
        }else {
			
            this.onFocus({});
            if(this.triggerAction == 'all') {
                this.doQuery(this.allQuery, true);
            } else {
				if (this.currentMode == this.suggestionsMode) {
					this.doQuery(this.getRawValue());
				}
				else {
					this.doQuery("");
				}
            }
            this.el.focus();
        }
    },
		
	validationEvent:false,
    validateOnBlur:false,
    trigger1Class:'x-form-clear-trigger',
    trigger2Class:'x-form-search-trigger',
    hideTrigger1:true,
    width:180,
    hasSearch : false,
    paramName : 'query',
	suggestionsMode : "Suggestions",
	recentWordsMode : "RecentWords",
	currentMode : "Suggestions"

	
}); 
/**
 * @class Tn.Layout
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * author Dang Khoa
 * dangkhoa3002@gmail.com
 * @version 1.0.0
 */

Tn.Layout = function(){

    var desktop = Ext.get('x-desktop');
    var taskbar = Ext.get('x-taskbar');
    var wbar = Ext.get('x-windows');

    var windows = new Ext.WindowGroup();
    var activeWindow;
	
	/**
	 * minimizeWin - minimize a window
	 * @param {Object} win
	 */	
    function minimizeWin(win){
        win.minimized = true;
        win.hide();
    }//end minimizeWin

	/**
	 * markActive - mark a window to be active
	 * @param {Object} win
	 */
    function markActive(win){
        if(activeWindow && activeWindow != win){
            markInactive(activeWindow);
        }//end if
        activeWindow = win;
        Ext.fly(win.taskItem.el).addClass('active-win');
        win.minimized = false;
		
		if (win.id == Tn.Constants.DICTIONARY_WINDOW_ID) {
			setTimeout(function() {
				jQuery("#DICTIONARY_SEARCH_FIELD").focus();
			}, 200);
		}//end if
    }//end markActive

	/**
	 * markActive - mark a window to be inactive
	 * @param {Object} win
	 */
    function markInactive(win){
        if(win == activeWindow){
            activeWindow = null;
            Ext.fly(win.taskItem.el).removeClass('active-win');
        }//end if
    }//end markInactive
	
	function addMenuToWindowBar () {
	
		var cmenu = new Ext.menu.Menu({
            items: [{
                text: 'Auto Hide',
                handler: function(){
					
					wbar.setHeight(5);
					layout();
					jQuery("#x-windows").mouseover(function() {
						wbar.setHeight(29);
						layout();
					});
					jQuery("#x-windows").mouseout(function() {
						wbar.setHeight(5);
						layout();
						return false;
					});
                },
                scope: this
            },{
                text: 'Always Show',
                handler: function() {
					jQuery("#x-windows").unbind("mouseover");
					jQuery("#x-windows").unbind("mouseout");
					wbar.setHeight(29);
					layout();
				},
                scope: this
            }]
        });
		
		var element = document.getElementById('x-windows');
		
		element.oncontextmenu = function( e ) {
			
			if(!cmenu.el){
                cmenu.render();
            }//end if
			
            var xy = [xMousePos, yMousePos];
		
			xy[1] -= cmenu.el.getHeight();
            cmenu.showAt(xy);
						
			return false;
		};//end oncontextmenu
				
	}//end addMenuToWindowBar

	/**
	 * removeWin - remove a window
	 * @param {Object} win
	 */
    function removeWin(win){
        win.taskItem.destroy();
		
		if (win.id == Tn.Constants.DICTIONARY_WINDOW_ID) {
			Tn.SearchField = null;
		}//end if
			
    }//end removeWin

	/**
	 * layout - define the initial layout of window
	 */
    function layout( initial ){
		Tn.DesktopHeight = Ext.lib.Dom.getViewHeight() - (taskbar ? taskbar.getHeight() : 0) - wbar.getHeight();
		desktop.setHeight(Tn.DesktopHeight);
		setHeightForDictionaryWindow();
		
		// For a strange bug in IE - when resizing a window, the bottom taskbar disappears
		jQuery("#x-windows").find("button").toggle().toggle();
	}//end layout
	
	function setHeightForDictionaryWindow () {
	
		var desktopWidth = Ext.lib.Dom.getViewWidth();
		var logoLeft = desktopWidth - 260;
		var logoTop = Ext.lib.Dom.getViewHeight() + (taskbar ? taskbar.getHeight() : 0) - 390;
		jQuery("#thieungulogo").css({'left': logoLeft , 'top': 250});
		jQuery("#thieunguquote").css({'left': (desktopWidth - 250), 'top': 150});
		jQuery("#thieungu").css({"left": (desktopWidth - 350), "top": 80 });
		
		var dictionaryWindow = windows.get(Tn.Constants.DICTIONARY_WINDOW_ID);
		
		if (dictionaryWindow) {
		
			if (dictionaryWindow.getSize().height === 0) {
				if (Ext.isIE) {
					dictionaryWindow.setHeight(Tn.DesktopHeight - 72 - dictionaryWindow.getPosition()[1]); // First load
				}
				else {
					dictionaryWindow.setHeight(Tn.DesktopHeight - 65 - dictionaryWindow.getPosition()[1]); // First load
				}
			}//end if
			else {
				if (Ext.isIE) {
					dictionaryWindow.setHeight(Tn.DesktopHeight + 27 - dictionaryWindow.getPosition()[1]);
				}
				else {
					dictionaryWindow.setHeight(Tn.DesktopHeight + 30 - dictionaryWindow.getPosition()[1]);
				}//end else
			}//end else
						
		}//end if
	}//end setHeightForDictionaryWindow
	
    Ext.EventManager.onWindowResize(layout);

    this.layout = layout;
	
	/**
	 * createWindow - create a new window using config and class
	 * @param {Object} config
	 * @param {Object} cls
	 */
    this.createWindow = function(config, cls){
        var win = new (cls||Ext.Window)(
            Ext.applyIf(config||{}, {
                manager: windows,
                minimizable: true,
                maximizable: true
            })
        );
		
		// Render this window to desktop
        win.render(desktop);
        win.taskItem =  new Tn.Layout.TaskBarItem(win);

        win.cmenu = new Ext.menu.Menu({
            items: [

            ]
        });

		// Consider -- Please wait...
        //win.animateTarget = win.taskItem.el;
        win.on('activate', markActive);
        win.on('beforeshow', markActive);
        win.on('deactivate', markInactive);
        win.on('minimize', minimizeWin);
        win.on('close', removeWin);
       	
		Tn.DesktopHeight = Ext.lib.Dom.getViewHeight() - (taskbar ? taskbar.getHeight() : 0) - wbar.getHeight();
		desktop.setHeight(Tn.DesktopHeight);
        return win;
    };

	/**
	 * getManager - get the list of windows
	 * @return Ext.WindowGroup()
	 */
    this.getManager = function(){
        return windows;
    };

	/**
	 * getWindow - get the window using its ID
	 * @param {Object} id
	 */
    this.getWindow = function(id){
        return windows.get(id);
    };

    layout();
	addMenuToWindowBar();
};

/**
 * @class Tn.Layout.TaskBarItem
 * @author Dang Khoa - dangkhoa3002@gmail.com
 * @param {Object} win
 */
Tn.Layout.TaskBarItem = function( win ){
    
	this.win = win;
    Tn.Layout.TaskBarItem.superclass.constructor.call(this, {
	
        iconCls: win.iconCls,
        text: win.title,
        renderTo: 'x-winlist',
        handler : function() {
            if(win.minimized || win.hidden){
                win.show();
            } else if(win == win.manager.getActive()){
                win.minimize();
            } else {
                win.toFront();
            }
        },
        clickEvent:'mousedown'
    });
};

/**
 * @class Tn.Layout.TaskBarItem extends Ext.Button
 * @author Dang Khoa - dangkhoa3002@gmail.com
 * @see Ext.Button
 * @param {Object} stage
 */
Ext.extend(Tn.Layout.TaskBarItem, Ext.Button, {
    onRender : function(){
        Tn.Layout.TaskBarItem.superclass.onRender.apply(this, arguments);

        this.cmenu = new Ext.menu.Menu({
            items: [{
                text: 'Restore',
                handler: function(){
                    if(!this.win.isVisible()){
                        this.win.show();
                    }else{
                        this.win.restore();
                    }
                },
                scope: this
            },{
                text: 'Minimize',
                handler: this.win.minimize,
                scope: this.win
            },{
                text: 'Maximize',
                handler: this.win.maximize,
                scope: this.win
            }, '-', {
                text: 'Close',
                handler: this.win.close,
                scope: this.win
            }]
        });

        this.cmenu.on('beforeshow', function(){
            var items = this.cmenu.items.items;
            var w = this.win;
            items[0].setDisabled(w.maximized !== true && w.hidden !== true);
            items[1].setDisabled(w.minimized === true);
            items[2].setDisabled(w.maximized === true || w.hidden === true);
        }, this);

        this.el.on('contextmenu', function(e){
            e.stopEvent();
            if(!this.cmenu.el){
                this.cmenu.render();
            }
            var xy = e.getXY();
            xy[1] -= this.cmenu.el.getHeight();
            this.cmenu.showAt(xy);
        }, this);
    }
});

/**
 * Extend Ext.app.App from Ext.util.Observable
 * @see Ext.util.Observable
 * @cfg {Tn.Layout} layout
 * @cfg {Ext.Toolbar} Ext Toolbar Launcher
 * @cfg {Boolean} isReady
 */
Ext.extend(Tn.Application, Ext.util.Observable, {
    
	isReady: false,
	
	/**
	 * Initialize application
	 * @see Tn.Stage for applications initialize at first sight
	 */
    initApp : function(){
				
        this.layout = new Tn.Layout();
		
        this.launcher = new Ext.Toolbar({renderTo:'x-launcher'});
		var modules = this.getModules();
		
        if(modules){
            this.initModules(modules);
        }//end if
		
        this.init();

        Ext.EventManager.on(window, 'beforeunload', this.onUnload, this);
        this.fireEvent('ready', this);
        this.isReady = true;
		
		modules[3].createWindow();
		modules[0].createWindow(); // Open Thieungu dictionary at page opening
		
		if (Ext.isMac && Ext.isGecko) {
			jQuery(document).bind("keydown", function(e){
				
				if (e.keyCode == 9) { // For Tab button
					
					setTimeout(function() {
						jQuery("#DICTIONARY_SEARCH_FIELD").focus().val("");
					}, 100);
					e.stopPropagation();
					return false;
				}//end if
			});
		
		}//end if
		else {
			jQuery(document).bind("keydown", function(e){
			
				if (e.keyCode == 9) { // For Tab button
					jQuery("#DICTIONARY_SEARCH_FIELD").focus().val("");
					e.stopPropagation();
					return false;
				}//end if
			});
		}//end else
		
		jQuery("#thieungulogo").html("<img src = 'images/logos/tnlogo.png' id = 'tnmainlogo'></img><a href = '#' id = 'resize-link' style = 'display:none;'>Resize</a>");
		jQuery("#thieunguquote").addClass("tn-thieungu-bubble");
			
		jQuery("#thieunguquote").html("<div class = 'text-in-bubble'>" +
				"<img src = 'images/icons/lightbulb.png'></img><u>Tips:</u> You can press <b>F4</b> to maximize / restore the dictionary<br/><div align = 'center'><a href = '#' onclick = 'javascript:Tn.launchUsingTips();'>Learn More...</a></div></div>");
		
		var resize = false;
		jQuery("#resize-link").click(function() {
			
			if (!resize) {
				modules[0].setPosition(0, 0);
				modules[0].resizeWindow(310, Tn.DesktopHeight);
				window.resizeTo(296, window.screen.height);
				modules[0].maximizeWindow();
				resize = true;
				jQuery("#x-windows").css("display", "none");
				jQuery("#x-taskbar").css("display", "none");
				jQuery("div[@class*=x-tool-maximize]").css("display", "none");
				jQuery("div[@class*=x-tool-minimize]").css("display", "none");
				jQuery("div[@class*=x-tool-restore]").css("display", "none");
				jQuery("div[@class*=x-tool-close]").css("display", "none");
				jQuery("button[@class*='pop-out-icon']").css("display", "none");
				jQuery("#DICTIONARY_WINDOW").find("div[@class*=tn-icon-dict]").prepend("<div class='x-tool pop-in-icon' ext:qtip='Pop in' id = 'pop-in-div'></div>");
				jQuery("span[@class*=ytb-sep]").css("display", "none");
				jQuery("#DICTIONARY_SEARCH_FIELD").parent().css("width", "310px");
				jQuery("#DICTIONARY_SEARCH_FIELD").css("width", "257px");
				jQuery("div[@class*=pop-in-icon]").click(function() {
					jQuery("#resize-link").trigger("click");
				});
				
				for (var i = 1; i < modules.length; i++) {
					modules[i].destroyWindow();
				}//end for
				
				//jQuery("button[@class*='pop-out-icon']").removeClass("pop-out-icon").addClass("pop-in-icon");	
				resize = true;
			}//end if
			else {
				parent.window.resizeTo(window.screen.width, window.screen.height);
				Ext.get('x-windows').setHeight(29);
				modules[0].restoreWindow();
				jQuery("#DICTIONARY_SEARCH_FIELD").css("width", "227px");
				jQuery("#DICTIONARY_SEARCH_FIELD").parent().css("width", "261px");
				
				jQuery("span[@class*=ytb-sep]").css("display", "");
				jQuery("button[@class*=pop-out-icon]").css("display", "");
				resize = false;
			
				jQuery("#x-taskbar").css("display", "");
				jQuery("#x-windows").css("display", "");
				jQuery("div").remove('#pop-in-div');
				jQuery("button[@class*='pop-in-icon']").css("display", "");
				
				
				jQuery("div[@class*=x-tool-close]").css("display", "");
				jQuery("div[@class*=x-tool-maximize]").css("display", "");
				jQuery("div[@class*=x-tool-minimize]").css("display", "");
				
			}//end else
		});
		
		this.putThieunguSlogan();
		this.fixPng();
		
		jQuery("#THIEUNGU_MSG_LAUNCHER").css("display", "none");
		jQuery("#" + Tn.Constants.DICTIONARY_SEARCH_FIELD).bind("keydown", function( e ) {
   
			if (e.keyCode == 17) { // CTRL BUTTON
				Tn.SearchField.switchModeTo("RecentWords");
			}//end if
		});
		// Initialize screen
		var loading = Ext.get('loading');
		var mask = Ext.get('loading-mask');
		mask.setOpacity(0.8);
		mask.shift({
			xy:loading.getXY(),
			width:loading.getWidth(),
			height:loading.getHeight(), 
			remove:true,
			duration:1,
			opacity:0.3,
			easing:'bounceOut',
			callback : function(){
				loading.fadeOut({duration:0.5,remove:true});
				jQuery("#DICTIONARY_SEARCH_FIELD").focus();
				
			}//end 
		});
		// Initialize screen
    },
	
	// fix All PNG IE6 problem
	fixPng: function() {
		if (Ext.isIE6) {
			jQuery("#tnmainlogo").ifixpng();
			jQuery("#thieunguquote").ifixpng();
		}//end if
	},
	
	putThieunguSlogan: function() {
		jQuery("#thieungu").html("<a href='http://www.thieungu.com' target='_blank'><img src = 'images/logos/thieungu.png' id = 'thieungumainlogo'></img></a>&nbsp;&nbsp;<br/><br/>");
		jQuery("#thieungumainlogo").ifixpng();
	},

    getModules : Ext.emptyFn,
    init : Ext.emptyFn,
	
	/**
	 * Add modules into toolbar launcher
	 * @param {Object} modules
	 */
    initModules : function(modules){
        for(var i = 0, len = modules.length; i < len; i++){
            var module = modules[i];
            this.launcher.add(module.launcher); // launcher with type Ext.Toolbar
            module.app = this;
        }
    },

	/**
	 * On ready function - goes with function handler
	 * @param {Object} fn
	 * @param {Object} scope
	 */
    onReady : function(fn, scope){
        if(!this.isReady){
            this.on('ready', fn, scope);
        }else{
            fn.call(scope, this);
        }
    },
	
	/**
	 * Get current stage of application
	 */
    getLayout : function(){
        return this.layout;
    },

    onUnload : function(e){
        if(this.fireEvent('beforeunload', this) === false){
            e.stopEvent();
        }
    }
});


/**
 * Ext.app.Module
 * @param {Object} config
 */
Ext.app.Module = function(config){
    Ext.apply(this, config);
    Ext.app.Module.superclass.constructor.call(this);
    this.init();
};

/**
 * Extend to make init function empty
 */
Ext.extend(Ext.app.Module, Ext.util.Observable, {
    init : function(){

    }
});
/**
 * @class Tn.Application.DictionaryWindow
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * @version 1.0.0
 */

Tn.Application.DictionaryWindow = Ext.extend(Ext.app.Module, {
	
	/*
	 * Init dictionary window function
	 */
    init : function() {
		
        this.launcher = {
            text: Tn.Constants.DICTIONARY_WINDOW_TITLE,
            iconCls: Tn.Constants.DICTIONARY_WINDOW_ICON_CLASS,
            handler : this.createWindow,
            scope: this
        };
		
    },
	
	resizeWindow : function (width, height) {
		
		var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.DICTIONARY_WINDOW_ID);
		if (!win) {
			return;
		}//end if
		
		win.setSize({width: width, height: height});
	},
	
	maximizeWindow: function() {
		
		var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.DICTIONARY_WINDOW_ID);
		if (!win) {
			return;
		}//end if
		
		win.maximize();
		
	},
	
	restoreWindow: function() {
		
		var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.DICTIONARY_WINDOW_ID);
		if (!win) {
			return;
		}//end if
		
		win.restore();
		
	},
	
	setPosition : function (left, top) {
		
		var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.DICTIONARY_WINDOW_ID);
		if (!win) {
			return;
		}//end if
		
		win.setPosition(left, top);
	},

    createWindow : function(){
		
        var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.DICTIONARY_WINDOW_ID);
		
		// English - Vietnamese Dictionary Panel build
		var englishVietnameseDictPanel = new Ext.Panel (
			{
				header: true,
				layout: 'fit',
				region: 'center',
				id: Tn.Constants.ENGLISH_VIETNAMESE_PANEL_ID,
				margins: '0 0 0 2',
				title: Tn.Constants.ENGLISH_VIETNAMESE_PANEL_TITLE,
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:3px'
				}
				
			}
		);
		
		// English - English Dictionary Panel build	
		var englishEnglishDictPanel = new Ext.Panel (
			{
				header: true,
				layout: 'fit',
				region: 'east',
				split: true,
				width: 293,
				minWidth: 293,
				collapsible: true,
				collapsed: true,
				autoShow: true,
				margins: '0 2 0 0',
				cmargins: '0 2 0 2',
				id: Tn.Constants.ENGLISH_ENGLISH_PANEL_ID,
				title: Tn.Constants.ENGLISH_ENGLISH_PANEL_TITLE,
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:3px'
				}
				
			}
		);
		
		// Idioms Tab
		var idiomsPanel = new Ext.Panel (
			{
				header: true,
				layout: 'fit',
				id: Tn.Constants.IDIOMS_TAB_ID,
				title: Tn.Constants.IDIOMS_TAB_TITLE,
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:3px'
				}
				
			}
		);
		
		// SynonymTab
		var thesaurusSynonymPanel = new Ext.Panel (
			{
				header: true,
				layout: 'fit',
				id: Tn.Constants.THESAURUS_SYNONYM_TAB_ID,
				title: "Synonym",
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:3px'
				}
				
			}
		);
		
		// AntonymTab
		var thesaurusAntonymPanel = new Ext.Panel (
			{
				header: true,
				layout: 'fit',
				id: Tn.Constants.THESAURUS_ANTONYM_TAB_ID,
				title: "Antonym",
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:3px'
				}
				
			}
		);
		
		// Idioms - Thesaurus Panel
		var idiomsThesaurusPanel = new Ext.Panel ({
			layout: 'border',
			region: 'south',
			split: true,
			height: 175,
			minHeight: 175,
			maxSize: 400,
			collapsible: true,
			collapsed: true,
			margins: '0 2 0 2',
			cmargins: '2 2 2 2',
			id: Tn.Constants.IDIOMS_THESAURUS_PANEL_ID,
			title: Tn.Constants.IDIOMS_THESAURUS_PANEL_TITLE,
			items: [
				new Ext.TabPanel (
					{
						border: false,
						split: true,
						id: Tn.Constants.IDIOMS_THERAUSUS_TAB_ID,
						activeTab: 1,
						region: 'center',
						tabPosition: 'bottom',
						items: [idiomsPanel, thesaurusSynonymPanel, thesaurusAntonymPanel]
						
					}
				)
			]
		});
		
		// Data Store for Suggestions
		var dataStore = new Ext.data.Store({
	        proxy: new Ext.data.HttpProxy({
	            url: 'suggest'
	        }),
	        reader: new Ext.data.JsonReader({
	            root: 'suggestions',
				totalProperty: 'totalCount',
				id: 'suggestion_id'
	        }, [
	            {name: 'written_form'},
	            {name: 'summary'}
	        ])
	    });
	    	    	    
		// Custom rendering Template
    	var resultTpl = new Ext.XTemplate('<tpl for="."><div class="search-item">',
        	    '<h3><span></span>{written_form}</font></h3>','{summary}', '</div></tpl>');
		
		// Dictionary Search Field
		Tn.SearchField = 
				new Tn.Application.SearchField({
	                id: Tn.Constants.DICTIONARY_SEARCH_FIELD,
					width: 261,
					store: dataStore,
					displayField: 'written_form',
			        typeAhead: false,
			        loadingText: 'Searching...',
			       	emptyText: 'Enter a word...',
			        hideTrigger: false,
			        tpl: resultTpl,
					minChars : 1,
					resizable: true,
					selectOnFocus: false,
					paramName: 'query',
					itemSelector: 'div.search-item',
					desktop: desktop, // Store desktop for later use
					renderedTreeCfg : [{ // renderedTreeCfg to specify config for populating dictionary tree
							url : "dict",
							target: 
								[
									englishVietnameseDictPanel, 
									englishEnglishDictPanel, 
									idiomsPanel,
									thesaurusSynonymPanel,
									thesaurusAntonymPanel
								]
						}
					],
					onSelect: function(record){ // override default onSelect to do redirect
						this.setValue(record.data.written_form);
						this.search(record.data.written_form);
						this.collapse();
					}//end onSelect
					
				});
		
			
		var dictLayout = new Ext.Panel({
			
			id: "DICTIONARY_MOTHER_LAYOUT",
			minWidth: 340,			
		    layout:'border',
			border: false,
		    items: [
				englishVietnameseDictPanel,
				idiomsThesaurusPanel,
				englishEnglishDictPanel
				
			]
		});
			
        if(!win) {
			
            win = desktop.createWindow({
			    id: Tn.Constants.DICTIONARY_WINDOW_ID,
                title: Tn.Constants.DICTIONARY_WINDOW_TITLE,
                width: 310,
                minWidth: 310,
				x: 10,
                y: 5,
				height: Ext.isIE ? Tn.DesktopHeight - 10 : Tn.DesktopHeight - 10,
                iconCls: Tn.Constants.DICTIONARY_WINDOW_ICON_CLASS,
				shim: false,
                animCollapse: false,
                constrainHeader: true,
                layout: 'fit',
				tbar: new Ext.Toolbar([
					Tn.SearchField,
					'-', 
					{
						tooltip: 'Pop out as Desktop Application',
						iconCls: "pop-out-icon",
						handler: function() {
							jQuery("#resize-link").trigger("click");
						}//end handler
					}
				]),
				items: [dictLayout],
				onEsc : Tn.emptyFn
                    
            });
        }//end if
					
        win.show();
		
		// keyCode = F4 to expand / restore the dictionary
		jQuery(document).keydown(function(e) {
			if (e.keyCode == 115) {
      
				if (win.maximized === true) {
					win.restore();
				}
				else if (win.minimized === false) {
					win.maximize();
				}//end else
				
				return false;
			}//end if
		});
		
		jQuery("img[@class*=x-form-trigger]").css("height", "25px");
		
		jQuery("img[@class=x-form-trigger x-form-arrow-trigger]").attr("ext:qtip", "Recent Founds");
		jQuery("img[@class=x-form-trigger x-form-search-trigger]").attr("ext:qtip", "Search");
		jQuery("img[@class=x-form-trigger x-form-clear-trigger]").attr("ext:qtip", "Clear Search Box");
		var idiomThesaurusTabActive = idiomsThesaurusPanel.getComponent(Tn.Constants.IDIOMS_THERAUSUS_TAB_ID);
		idiomThesaurusTabActive.setActiveTab(idiomThesaurusTabActive.getComponent(Tn.Constants.THESAURUS_ANTONYM_TAB_ID));
		idiomThesaurusTabActive.setActiveTab(idiomThesaurusTabActive.getComponent(Tn.Constants.IDIOMS_TAB_ID));
		
		return win;
    }//end createWindow
});
/**
 * @class Tn.Application.Message
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * @version 1.0.0
 */

Tn.Application.Message = Ext.extend(Ext.app.Module, {
	
	/*
	 * Init dictionary window function
	 */
    init : function() {
		
        this.launcher = {
			id: "THIEUNGU_MSG_LAUNCHER",
            text: Tn.Constants.MESSAGE_WINDOW_TITLE,
            iconCls: Tn.Constants.MESSAGE_WINDOW_ICON_CLASS,
            handler : this.createWindow,
            scope: this
        };
		
    },
	
	destroyWindow : function() {
		
		var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.MESSAGE_OF_THE_DAY_WINDOW_ID);
		if (!win) {
			return;
		}//end if
		win.close();
	},
	
    createWindow : function(){
		
        var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.MESSAGE_OF_THE_DAY_WINDOW_ID);
		
		// English - Vietnamese Dictionary Panel build
		var messagePanel = new Ext.Panel (
			{
				header: false,
				border: true,
				layout: 'fit',
				region: 'center',
				id: Tn.Constants.MESSAGE_OF_THE_DAY_PANEL_ID,
				title: "English",
				margins: '0 0 0 0',
				autoScroll: true,
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:6px'
				},
				autoLoad: "html/beta-launch-message.html"
				
			}
		);
		
		var messagePanelVn = new Ext.Panel (
			{
				header: false,
				border: true,
				layout: 'fit',
				region: 'center',
				id: Tn.Constants.MESSAGE_OF_THE_DAY_PANEL_ID + "VN",
				margins: '0 0 0 0',
				autoScroll: true,
				title: "Vietnamese",
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:6px'
				},
				autoLoad: "html/beta-launch-message-vn.html"
			}
		);
					
		var messageLayout = new Ext.TabPanel({
			minWidth: 340,	
			activeTab: 0,	
		 	border: false,
			margins: '0 0 0 0',
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:6px'
				},
		    items: [messagePanelVn, messagePanel]
		});
				
        if(!win) {
			
            win = desktop.createWindow({
			    id: Tn.Constants.MESSAGE_OF_THE_DAY_WINDOW_ID,
                title: Tn.Constants.MESSAGE_WINDOW_TITLE,
                width: 310,
				minHeight: 310,
				height: 310,
                minWidth: 310,
				x: 440,
                y: 150,
                iconCls: Tn.Constants.MESSAGE_WINDOW_ICON_CLASS,
				shim: false,
                animCollapse: false,
                constrainHeader: true,
                layout: 'fit',
				items: [messageLayout],
				onEsc : Tn.emptyFn
            });
        }//end if
		
		
        win.show();
		
		return win;
    }//end createWindow
});
/**
 * @class Tn.Application.UsingTips
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * @version 1.0.0
 */

Tn.Application.UsingTips = Ext.extend(Ext.app.Module, {
	
	/*
	 * Init dictionary window function
	 */
    init : function() {
		
        this.launcher = {
			id: Tn.Constants.USING_TIPS_LAUNCHER_ID,
            text: Tn.Constants.USING_TIPS_WINDOW_TITLE,
            iconCls: Tn.Constants.USING_TIPS_WINDOW_ICON_CLASS,
            handler : this.createWindow,
            scope: this
        };
		
    },
	
	destroyWindow : function() {
		
		var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.USING_TIPS_WINDOW_ID);
		if (!win) {
			return;
		}//end if
		win.close();
	},
	
    createWindow : function(){
		
        var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.USING_TIPS_WINDOW_ID);
		
		// English - Vietnamese Dictionary Panel build
		var usingTipsPanel = new Ext.Panel (
			{
				header: false,
				layout: 'fit',
				region: 'center',
				margins: '0 0 0 0',
				autoScroll: true,
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:6px'
				},
				//html: document.getElementById(Tn.Constants.USING_TIPS_DIV_CONTENT).innerHTML
				autoLoad: "html/using-tips.html"
				
			}
		);
					
		var usingTipsLayout = new Ext.Panel({
			minWidth: 340,			
		    layout:'border',
			border: false,
			margins: '0 0 0 0',
				defaults: {
					// applied to each contained panel
					bodyStyle: 'padding:6px'
				},
		    items: [usingTipsPanel]
		});
				
        if(!win) {
			
            win = desktop.createWindow({
			    id: Tn.Constants.USING_TIPS_WINDOW_ID,
                title: Tn.Constants.USING_TIPS_WINDOW_TITLE,
                width: 310,
				minHeight: 300,
				height: 380,
                minWidth: 310,
				x: 600,
                y: 140,
                iconCls: Tn.Constants.USING_TIPS_WINDOW_ICON_CLASS,
				shim: false,
                animCollapse: false,
                constrainHeader: true,
                layout: 'fit',
				items: [usingTipsLayout],
				onEsc : Tn.emptyFn
                    
            });
        }//end if
		
		
        win.show();
		
		return win;
    }//end createWindow
});
/**
 * @class Tn.Application.Message
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * @version 1.0.0
 */

Tn.Application.Notepad = Ext.extend(Ext.app.Module, {
	
	/*
	 * Init dictionary window function
	 */
    init : function() {
		
        this.launcher = {
            text: "<b>Notepad</b>",
            iconCls: "tn-thieungu-notepad",
            handler : this.createWindow,
            scope: this
        };
		
    },
	
	destroyWindow : function() {
		
		var desktop = this.app.getLayout();
		var win = desktop.getWindow("THIEUNGU_NOTE_PAD");
		if (!win) {
			return;
		}//end if
		win.close();
	},
	
    createWindow : function(){
		
        var desktop = this.app.getLayout();
		var win = desktop.getWindow("THIEUNGU_NOTE_PAD");
						
        if(!win) {
			
            win = desktop.createWindow({
			    id: "THIEUNGU_NOTE_PAD",
                title: "<b>Thieu Ngu Notepad</b>",
                width: 310,
				minHeight: 310,
				height: 310,
                minWidth: 310,
				x: 340,
                y: 180,
                iconCls: "tn-thieungu-notepad",
				shim: false,
                animCollapse: false,
                constrainHeader: true,
                layout: 'fit',
				items: [ new Ext.form.TextArea({id: 'notepad', height: 100, width: 100, emptyText: 'Thieu Ngu Notepad 1.0.0'})],
				onEsc : Tn.emptyFn
                    
            });
        }//end if
		
		
        win.show();
		jQuery("#notepad").focus();
		
		return win;
    }//end createWindow
});
/**
 * @class Tn.Application.DictionaryWindow
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * @version 1.0.0
 */

Tn.Application.Guestbook = Ext.extend(Ext.app.Module, {
	
	/*
	 * Init dictionary window function
	 */
    init : function() {
		
        this.launcher = {
            text: Tn.Constants.GUEST_BOOK_WINDOW_TITLE,
            iconCls: Tn.Constants.MESSAGE_WINDOW_ICON_CLASS,
            handler : this.createWindow,
            scope: this
        };
		
    },
	
    createWindow : function(){
		
        var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.GUEST_BOOK_WINDOW_ID);
				
		// create the Data Store
	    var store = new Ext.data.Store({
	        // load using script tags for cross domain, if the data in on the same domain as
	        // this page, an HttpProxy would be better
	        proxy: new Ext.data.HttpProxy({
	            url: 'guestbook/get_data'
	        }),

	        // create reader that reads the Topic records
	        reader: new Ext.data.JsonReader({
	            root: 'entries',
	            totalProperty: 'totalCount',
	            id: 'entryid',
	            fields: [
	                'visitor', 'subject', 'content', 'recordTime'
	            ]
	        }),

	        // turn on remote sorting
	        remoteSort: false
	    });
	    store.setDefaultSort('recordTime', 'desc');
   
	    // the column model has information about grid columns
	    // dataIndex maps the column to the specific data field in
	    // the data store
		var cm = new Ext.grid.ColumnModel([{
           id: 'post', // id assigned so we can apply custom css (e.g. .x-grid-col-topic b { color:#333 })
           header: "Post",
           dataIndex: 'subject',
           width: 250,
		   renderer: function (val, p, record) {
				return String.format('<b><div class = "x-grid3-td-topic">{0}</div></b>', val);
		   }
        },{
           id: 'visitor',
           header: "Poster",
           dataIndex: 'visitor',
           width: 80,
		   renderer: function (val, p, record) {
				return String.format('<div class = "x-grid3-td-visitor">{0}</div>', val);
			}
		}, {
           id: 'date',
           header: "Created Date",
           dataIndex: 'recordTime',
           width: 180,
		   renderer: function (val, p, record) {
				return String.format('{0}', val);
		   }
        }]);

		// by default columns are sortable
		cm.defaultSortable = true;

	    var grid = new Ext.grid.GridPanel({
	        
	        width:500,
	        height:500,
	        header: false,
	        store: store,
	        cm: cm,
	        trackMouseOver:true,
	        sm: new Ext.grid.RowSelectionModel({selectRow:Ext.emptyFn}),
	        loadMask: true,
	        viewConfig: {
	            forceFit:true,
	            enableRowBody:true,
				getRowClass : function(record, rowIndex, p, store){
	                p.body = '<p>' + record.data.content + '</p>';
	                return 'x-grid3-row-expanded';
	                     
				}
	        },
	        bbar: new Ext.PagingToolbar({
	            pageSize: 25,
	            store: store,
	            displayInfo: true,
	            displayMsg: 'Displaying posts {0} - {1} of {2}',
	            emptyMsg: "No topics to display",
	            items:[
	                '-', {
	                pressed: true,
	                text: 'Sign Guestbook',
	                cls: 'x-btn-text-icon sign-guestbook',
	                //, toggleHandler: toggleDetails
					handler: function() {
						var form = new Ext.form.FormPanel({
					        baseCls: 'x-plain',
					        labelWidth: 55,
					        url:'guestbook/save_guest_book_sign',
					        defaultType: 'textfield',
					
					        items: [{
								id: "guest_book_nick_name",
					            fieldLabel: 'Nickname',
					            name: 'nickname',
					            anchor:'100%'  // anchor width by percentage
					        }, {
								id: "guest_book_subject",
								fieldLabel: 'Subject',
					            name: 'subject',
					            anchor: '100%'  // anchor width by percentage and height by raw adjustment
					        }	, {
								id: "guest_book_content",
								fieldLabel: 'Content',
					            xtype: 'textarea',
					            hideLabel: true,
					            name: 'Content',
					            anchor: '100% -53'  // anchor width by percentage and height by raw adjustment
					        }]
						});
				
					    var window = new Ext.Window({
							id: 'SIGN_GUESTBOOK_WINDOW',
					        title: 'Sign Thieu Ngu Guest Book',
					        width: 500,
					        height:230,
					        minWidth: 300,
					        minHeight: 200,
					        layout: 'fit',
					        plain:true,
					        bodyStyle:'padding:5px;',
					        buttonAlign:'center',
					        items: form,
					
					        buttons: [{
					            text: 'Sign',
								handler: function() {
									var nickName = jQuery("#guest_book_nick_name").val();
									var content = jQuery("#guest_book_content").val();			
									var subject = jQuery("#guest_book_subject").val();		
									jQuery("#sign-guestbook-cancel").trigger("click");
									jQuery.post("guestbook/save_guest_book_sign", 
										{nickname: nickName, subject: subject, content: content}, function() {
											store.load({params:{start:0, limit:25}, callback: function() {
			
			jQuery("div[@class=x-grid3-body]").find("table[@class=x-grid3-row-table]").eq(0).hide().fadeIn(2000);
		}});
											setTimeout(function() {
											
											}, 1000);});
								}
					        },{
					            text: 'Cancel',
								id: 'sign-guestbook-cancel'
								
					        }]
					    });
						
						window.show();
						jQuery("#sign-guestbook-cancel").click(function() {
							window.close();
							
						});
					}
				}]
			})
	    });

   

				
        if(!win) {
			
            win = desktop.createWindow({
			    id: Tn.Constants.GUEST_BOOK_WINDOW_ID,
                title: Tn.Constants.GUEST_BOOK_WINDOW_TITLE,
                width: 520,
				minHeight: 310,
				height: 340,
                minWidth: 520,
				maxWidth: 310,
				x: 460,
                y: 170,
                iconCls: Tn.Constants.MESSAGE_WINDOW_ICON_CLASS,
				shim: false,
                animCollapse: false,
                constrainHeader: true,
                layout: 'fit',
				items: grid,
				onEsc : Tn.emptyFn
            });
        }//end if
		 
	
        win.show();
		
		  // trigger the data store load
		store.load({params:{start:0, limit:25}});

		function toggleDetails(btn, pressed){
			var view = grid.getView();
			view.showPreview = pressed;
			view.refresh();
		}
	
		jQuery("#sign-guestbook-link").bind("click", function() {
		
		   
			return false;
		});
		
		return win;
    },//end createWindow
	
	destroyWindow : function() {
		
		var desktop = this.app.getLayout();
		var win = desktop.getWindow(Tn.Constants.GUEST_BOOK_WINDOW_ID);
		if (!win) {
			return;
		}//end if
		win.close();
	}
});
/**
 * @class TnApplication
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * @version 1.0.0
 */

TnApplication = new Tn.Application({
	
    init :function(){
        Ext.QuickTips.init();
    },

    getModules : function(){
        return [
                new Tn.Application.DictionaryWindow(),
				new Tn.Application.Notepad(),
				new Tn.Application.UsingTips(),
				new Tn.Application.Message(),
				new Tn.Application.Guestbook()				
                //, new TnApplication.InternetBrowserWindow()
                //, new TnApplication.TranslatorWindow()
             ];
    }//end getModules
});

/*
TnApplication.InternetBrowserWindow = Ext.extend(Ext.app.Module, {
    init : function(){
        this.launcher = {
            text: 'Internet Browser',
            iconCls:'tabs',
            handler : this.createWindow,
            scope: this
        }
    },

    createWindow : function(){
        var desktop = this.app.getLayout();
        var win = desktop.getWindow('tab-win');
        if(!win){
            win = desktop.createWindow({
                id: 'tab-win',
                title:'Internet Browser',
                width:740,
                height:480,
                x:300,
                y:10,
                iconCls: 'tabs',
                shim:false,
                animCollapse:false,
                border:false,
                constrainHeader:true,
				tbar : 
					new Ext.Toolbar([
						{
							tooltip:'Back',
							iconCls:'browser-back'
						},
						{
							tooltip:'Forward',
							iconCls:'browser-forward'
						},
						new Tn.Application.SearchField({
							width:600,
							store: new Ext.data.Store(),
							paramName: 'q'
						})
						,'-',{
							tooltip:'Home',
							iconCls:'browser-home'
						},' ',{
							tooltip:'Thieu Ngu Blog',
							iconCls:'browser-feed'
						}
					])
						
				,
                layout: 'fit',
							
                items:
                    new Ext.TabPanel({
                        activeTab:0,
						
                        items: [
							new Ext.tree.TreePanel({
	                        id:'im-tree',
	                        title: 'Web Yahoo Messenger',
	                        loader: new Ext.tree.TreeLoader(),
	                        rootVisible:false,
	                        lines:false,
	                        autoScroll:true,
	                        tools:[{
	                            id:'refresh',
	                            on:{
	                                click: function(){
	                                    var tree = Ext.getCmp('im-tree');
	                                    tree.body.mask('Loading', 'x-mask-loading');
	                                    tree.root.reload();
	                                    tree.root.collapse(true, false);
	                                    setTimeout(function(){ // mimic a server call
	                                        tree.body.unmask();
	                                        tree.root.expand(true, true);
	                                    }, 1000);
	                                }
	                            }
	                        }],
	                        root: new Ext.tree.AsyncTreeNode({
	                            text:'Online',
	                            children:[{
	                                text:'Friends',
	                                expanded:true,
	                                children:[{
	                                    text:'Jack',
	                                    iconCls:'user',
	                                    leaf:true
	                                },{
	                                    text:'Brian',
	                                    iconCls:'user',
	                                    leaf:true
	                                },{
	                                    text:'Jon',
	                                    iconCls:'user',
	                                    leaf:true
	                                },{
	                                    text:'Tim',
	                                    iconCls:'user',
	                                    leaf:true
	                                },{
	                                    text:'Nige',
	                                    iconCls:'user',
	                                    leaf:true
	                                },{
	                                    text:'Fred',
	                                    iconCls:'user',
	                                    leaf:true
	                                },{
	                                    text:'Bob',
	                                    iconCls:'user',
	                                    leaf:true
	                                }]
	                            },{
	                                text:'Family',
	                                expanded:true,
	                                children:[{
	                                    text:'Kelly',
	                                    iconCls:'user-girl',
	                                    leaf:true
	                                },{
	                                    text:'Sara',
	                                    iconCls:'user-girl',
	                                    leaf:true
	                                },{
	                                    text:'Zack',
	                                    iconCls:'user-kid',
	                                    leaf:true
	                                },{
	                                    text:'John',
	                                    iconCls:'user-kid',
	                                    leaf:true
	                                }]
	                            }]
							})
						}),{
                            title: 'Ext Js Library',
                            header:false,
                            html : '<p>Something useful would be in here.</p>',
                            border:false
                        },{
                            title: 'Google Email',
                            header:false,
                            html : '<p>Something useful would be in here.</p>',
                            border:false
                        },{
                            title: 'Yahoo!',
                            header:false,
                            html : '<p>Something useful would be in here.</p>',
                            border:false
                        }]
                    })
            });
        }
        win.show();
    }
});

TnApplication.TranslatorWindow = Ext.extend(Ext.app.Module, {
    init : function(){
        this.launcher = {
            text: 'Translator',
            iconCls:'accordion',
            handler : this.createWindow,
            scope: this
        }
    },

    createWindow : function(){
        var desktop = this.app.getLayout();
        var win = desktop.getWindow('acc-win');
        if(!win){
            win = desktop.createWindow({
                id: 'acc-win',
                title:'Translator',
                width:260,
                height:400,
                x:10,
                y:10,
                iconCls: 'accordion',
                shim:false,
                animCollapse:false,
                constrainHeader:true,

                tbar:[{
                    tooltip:{title:'Rich Tooltips', text:'Let your users know what they can do!'},
                    iconCls:'connect'
                },'-',{
                    tooltip:'Add a new user',
                    iconCls:'user-add'
                },' ',{
                    tooltip:'Remove the selected user',
                    iconCls:'user-delete'
                }],

                layout:'accordion',
                border:false,
                layoutConfig: {
                    animate:false
                },

                items: [
                    new Ext.tree.TreePanel({
                        id:'im-tree',
                        title: 'Online Users',
                        loader: new Ext.tree.TreeLoader(),
                        rootVisible:false,
                        lines:false,
                        autoScroll:true,
                        tools:[{
                            id:'refresh',
                            on:{
                                click: function(){
                                    var tree = Ext.getCmp('im-tree');
                                    tree.body.mask('Loading', 'x-mask-loading');
                                    tree.root.reload();
                                    tree.root.collapse(true, false);
                                    setTimeout(function(){ // mimic a server call
                                        tree.body.unmask();
                                        tree.root.expand(true, true);
                                    }, 1000);
                                }
                            }
                        }],
                        root: new Ext.tree.AsyncTreeNode({
                            text:'Online',
                            children:[{
                                text:'Friends',
                                expanded:true,
                                children:[{
                                    text:'Jack',
                                    iconCls:'user',
                                    leaf:true
                                },{
                                    text:'Brian',
                                    iconCls:'user',
                                    leaf:true
                                },{
                                    text:'Jon',
                                    iconCls:'user',
                                    leaf:true
                                },{
                                    text:'Tim',
                                    iconCls:'user',
                                    leaf:true
                                },{
                                    text:'Nige',
                                    iconCls:'user',
                                    leaf:true
                                },{
                                    text:'Fred',
                                    iconCls:'user',
                                    leaf:true
                                },{
                                    text:'Bob',
                                    iconCls:'user',
                                    leaf:true
                                }]
                            },{
                                text:'Family',
                                expanded:true,
                                children:[{
                                    text:'Kelly',
                                    iconCls:'user-girl',
                                    leaf:true
                                },{
                                    text:'Sara',
                                    iconCls:'user-girl',
                                    leaf:true
                                },{
                                    text:'Zack',
                                    iconCls:'user-kid',
                                    leaf:true
                                },{
                                    text:'John',
                                    iconCls:'user-kid',
                                    leaf:true
                                }]
                            }]
                        })
                    }), {
                        title: 'Settings',
                        html:'<p>Something useful would be in here.</p>',
                        autoScroll:true
                    },{
                        title: 'Even More Stuff',
                        html : '<p>Something useful would be in here.</p>'
                    },{
                        title: 'My Stuff',
                        html : '<p>Something useful would be in here.</p>'
                    }
                ]
            });
        }
        win.show();
    }
});
*/
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
