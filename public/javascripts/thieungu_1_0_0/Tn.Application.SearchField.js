/**
 * @class Tn.Application.SearchField
 * A javascript Search Field (textbox) with Search and Reset button
 * @author Dang Khoa 
 * @version 1.0.0
 */
Tn.Application.SearchField = Ext.extend(Ext.form.ComboBox, {
    
	// See at Ext.form.TwinTriggerField	
	initComponent : function(){
        if(!this.store.baseParams) {
			this.store.baseParams = {};
		}
				
		Tn.Application.SearchField.superclass.initComponent.call(this);
		this.on('specialkey', function(f, e){
            if(e.getKey() == e.ENTER){
                this.onTrigger2Click();
            }
        }, this);
		
		this.triggerConfig = {
            tag:'span', cls:'x-form-twin-triggers', cn:[
            {tag: "img", src: Ext.BLANK_IMAGE_URL, cls: "x-form-trigger " + this.trigger1Class},
            {tag: "img", src: Ext.BLANK_IMAGE_URL, cls: "x-form-trigger " + this.trigger2Class},
			{tag: "img", src: Ext.BLANK_IMAGE_URL, cls: "x-form-trigger x-form-arrow-trigger"}
        ]};
			
    },
	
	// See at Ext.form.TwinTriggerField
	getTrigger : function(index){
        return this.triggers[index];
    },
	
	// See at Ext.form.TwinTriggerField
	initTrigger : function(){
        var ts = this.trigger.select('.x-form-trigger', true);
        this.wrap.setStyle('overflow', 'hidden');
        var triggerField = this;
        ts.each(function(t, all, index){
            t.hide = function(){
                var w = triggerField.wrap.getWidth();
                this.dom.style.display = 'none';
                triggerField.el.setWidth(w-triggerField.trigger.getWidth());
            };
            t.show = function(){
                var w = triggerField.wrap.getWidth();
                this.dom.style.display = '';
                triggerField.el.setWidth(w-triggerField.trigger.getWidth());
            };
            var triggerIndex = 'Trigger'+(index+1);

            if(this['hide'+triggerIndex]){
                t.dom.style.display = 'none';
            }
            t.on("click", this['on'+triggerIndex+'Click'], this, {preventDefault:true});
            t.addClassOnOver('x-form-trigger-over');
            t.addClassOnClick('x-form-trigger-click');
        }, this);
        this.triggers = ts.elements;
    },

	
	initEvents : function(){ // override the initEvents method in Ext.Form.Combo
		Ext.form.ComboBox.superclass.initEvents.call(this);

		this.keyNav = new Ext.KeyNav(this.el, {
			"up" : function(e){
				
				this.inKeyMode = true;
				this.selectPrev();
				
			},
						
			"down" : function(e){
				if(!this.isExpanded()){
					this.onTriggerClick();
				} else{
					this.inKeyMode = true;
					this.selectNextEntry();
				}//end else
			},

			"enter" : function(e){
				this.searchBySuggestion();				
			},

			"esc" : function(e){
				
				this.collapse();
				
			},

			"tab" : function(e){
				this.onViewClick(false);
				return true;
			},

			scope : this,

			doRelay : function(foo, bar, hname){
				if(hname == 'down' || this.scope.isExpanded()){
				   return Ext.KeyNav.prototype.doRelay.apply(this, arguments);
				}
				return true;
			}
		});
		
		this.queryDelay = Math.max(this.queryDelay || 10,
				this.mode == 'local' ? 10 : 1500);
			
		this.dqTask = new Ext.util.DelayedTask(this.initQuery, this);
		if(this.typeAhead){
			this.taTask = new Ext.util.DelayedTask(this.onTypeAhead, this);
		}
		if(this.editable !== false){
			this.el.on("keyup", this.onKeyUp, this);
		}
		if(this.forceSelection){
			this.on('blur', this.doForce, this);
		}
	},
	selectNext : function(){
		var ct = this.store.getCount();
		if(ct > 0){
			if(this.selectedIndex == -1){
				this.select(-1);
			} else if(this.selectedIndex < ct-1){
				this.select(this.selectedIndex+1);
			}
		}
	},	
	selectNextEntry : function(){
		var ct = this.store.getCount();
		if(ct > 0){
			if(this.selectedIndex == -1){
				this.select(0);
			} else if(this.selectedIndex < ct-1){
				this.select(this.selectedIndex+1);
			}
		}
	},
	    
    onTrigger1Click : function(){
        if(this.hasSearch){
            this.el.dom.value = '';
            this.triggers[0].hide();
            this.hasSearch = false;
			this.focus();
        }
    },
	
	// private
    onKeyUp : function(e){
		
		if (e.keyCode == 115) {
			return;
		}//end if
			
		this.suppressSuggestion(e.keyCode == e.ENTER);
		
		if (e.keyCode != e.UP && e.keyCode != e.DOWN && e.keyCode != e.ENTER &&
				e.keyCode != e.ESC &&
				e.keyCode != 17 && this.currentMode != this.suggestionsMode) {
			this.switchModeTo(this.suggestionsMode);
		}

		if (this.getRawValue() === "" && this.currentMode == this.suggestionsMode) {
			this.collapse();
		}//end if
					
        if(this.editable !== false && !e.isSpecialKey()){
		
            this.lastKey = e.getKey();
            this.dqTask.delay(this.queryDelay);
        }
		
		
    },
	
	// Suppress Suggestions by setting minChars to 1000
	suppressSuggestion: function (willSuppress) {
				
		if (willSuppress === true) {
			this.minChars = 1000;
		}
		else {
			this.minChars = 1;
		}
	},

    onTrigger2Click : function(){
        
		this.collapse();
		this.suppressSuggestion(true);
				
		var v = this.getRawValue();
		this.lastQuery = v;
		
		if(v.length < 1){
            this.onTrigger1Click();
            return;
        }
		
		this.hasSearch = true;
		this.triggers[0].show(); // Show delete button
		this.focus();
		
		if (Tn.Utils.isArray(this.renderedTreeCfg)) {
			
			for (var index = 0; index < this.renderedTreeCfg.length; index++) {
			
				var aPanel = new Tn.Panel.DictPanel(this.renderedTreeCfg[index], this.desktop);
				aPanel.render(this.paramName, v);
							
			}//end for
		}//end if
		else {
			var dictPanel = new Tn.Panel.DictPanel(this.renderedTreeCfg, this.desktop);
			dictPanel.render(this.paramName, v);
		}//end else
		
		this.collapse();
    },//end onTrigger2Click
	
	onTrigger3Click: function() {
		this.switchModeTo("RecentWords");
	},
	
	search: function(value) {
	
		this.setRawValue(value);
		this.onTrigger2Click();
		
	},//end search
	
	searchBySuggestion: function() {
				
		var index = this.view.getSelectedIndexes()[0];
		
        var r = this.store.getAt(index);
		if (r) {
			this.setRawValue(r.data.written_form);
		}
		if ( jQuery.browser.msie ) {
			// Do nothing as IE will automatically executes the search
		}//end if
		else {
			this.onTrigger2Click();
		}//end else
		
		this.collapse();
				
	},//end search
	
	// This function is used to switch from Suggestion mode to Recent word mode
	// and vice versa
	// @mode can be "suggestion" or "recent_words"
	switchModeTo: function( mode ) {
		
		this.currentMode = mode;
		var toUrl = "";
		
		if (mode == this.suggestionsMode) {
			this.minChars = 1;
			toUrl = "suggest";
		}//end if
		
		if (mode == this.recentWordsMode) {
			this.minChars = 0;
			toUrl = "dict/recent_look_ups";
		}//end if
		
		this.store.proxy = new Ext.data.HttpProxy({
	        url: toUrl
	    });
		
		this.switchOnViewMode(mode);
		
		this.onTriggerClick();						
	},
		
	switchOnViewMode : function ( currentMode ) {
		
		if (this.currentMode == this.suggestionsMode) {
			this.onViewClick = function( doFocus ) {
				this.onViewClickForSuggestionMode(doFocus);
			};//end onViewClick
		}//end if
		else {
			this.onViewClick = function( doFocus ) {
				this.onViewClickForRecentWordsMode(doFocus);
			};//end onViewClick
		}//end else
	},
	
	onViewClickForRecentWordsMode : function( doFocus ) {
	  		
		var index = this.view.getSelectedIndexes()[0];
        var r = this.store.getAt(index);
		if (r) {
			this.setRawValue(r.data.written_form);
		}//end if
		
		this.collapse();
		
		if(doFocus !== false){
            this.el.focus();
        }
		
		this.onTrigger2Click();
		
    },
	
	onViewClickForSuggestionMode : function(doFocus) {
	  
        var index = this.view.getSelectedIndexes()[0];
        var r = this.store.getAt(index);
        if(r){
            this.onSelect(r, index);
        }
        if(doFocus !== false){
            this.el.focus();
        }
		
    },
	
	// Override the onTriggerClick in Combo box
    onTriggerClick : function(){
			
        if(this.disabled){
            return;
        }
        if(this.isExpanded()){
            this.collapse();
            this.el.focus();
        }else {
			
            this.onFocus({});
            if(this.triggerAction == 'all') {
                this.doQuery(this.allQuery, true);
            } else {
				if (this.currentMode == this.suggestionsMode) {
					this.doQuery(this.getRawValue());
				}
				else {
					this.doQuery("");
				}
            }
            this.el.focus();
        }
    },
		
	validationEvent:false,
    validateOnBlur:false,
    trigger1Class:'x-form-clear-trigger',
    trigger2Class:'x-form-search-trigger',
    hideTrigger1:true,
    width:180,
    hasSearch : false,
    paramName : 'query',
	suggestionsMode : "Suggestions",
	recentWordsMode : "RecentWords",
	currentMode : "Suggestions"

	
}); 