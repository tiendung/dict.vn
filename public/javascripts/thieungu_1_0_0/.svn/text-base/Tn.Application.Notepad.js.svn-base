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