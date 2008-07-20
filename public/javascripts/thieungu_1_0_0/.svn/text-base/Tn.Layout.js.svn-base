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