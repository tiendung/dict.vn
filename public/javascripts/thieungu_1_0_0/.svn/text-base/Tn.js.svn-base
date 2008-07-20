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

