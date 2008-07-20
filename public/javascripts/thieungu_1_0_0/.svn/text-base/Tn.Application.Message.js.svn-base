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