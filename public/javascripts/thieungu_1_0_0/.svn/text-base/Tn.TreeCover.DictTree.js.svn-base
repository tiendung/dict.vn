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
