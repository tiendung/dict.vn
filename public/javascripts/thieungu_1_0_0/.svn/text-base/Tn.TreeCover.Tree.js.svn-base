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

