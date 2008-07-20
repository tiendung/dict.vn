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