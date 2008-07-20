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