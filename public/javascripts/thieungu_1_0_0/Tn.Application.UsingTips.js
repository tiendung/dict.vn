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