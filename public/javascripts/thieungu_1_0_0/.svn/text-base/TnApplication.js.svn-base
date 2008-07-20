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