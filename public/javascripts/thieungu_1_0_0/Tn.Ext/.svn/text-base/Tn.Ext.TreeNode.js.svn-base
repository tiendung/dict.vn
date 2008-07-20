/**
 * @class Tn.Ext.TreeNodeUI
 * Thieungu Dictionary & Translator Version 1.0
 * Copyright(c) 2007 Thieungu 
 * @author Dang Khoa
 * dangkhoa3002@gmail.com
 * 
 * @extends Ext.tree.TreeNodeUI
 * @param {Object} node
 * @see Ext.tree.TreeNodeUI
 */

Tn.Ext.TreeNodeUI = function(node) {
    Tn.Ext.TreeNodeUI.superclass.constructor.call(this, node);
};

Ext.extend(Tn.Ext.TreeNodeUI, Ext.tree.TreeNodeUI);

/**
 * Extend to modify function renderElements - Add in tree-node-id attribute
 * for JQuery selection
 * @param {Object} n
 * @param {Object} a
 * @param {Object} targetNode
 * @param {Object} bulkRender
 */
Tn.Ext.TreeNodeUI.prototype.renderElements = function(n, a, targetNode, bulkRender) {
	// add some indent caching, this helps performance when rendering a large tree
	this.indentMarkup = n.parentNode ? n.parentNode.ui.getChildIndent() : '';

	var cb = typeof a.checked == 'boolean';

	var href = a.href ? a.href : Ext.isGecko ? "" : "#";
	var buf = ['<li class="x-tree-node"><div ext:tree-node-id="',n.id, '" id="',n.id,'" class="x-tree-node-el x-tree-node-leaf ', a.cls,'">',
		'<span class="x-tree-node-indent">',this.indentMarkup,"</span>",
		'<img src="', this.emptyIcon, '" class="x-tree-ec-icon x-tree-elbow" />',
		'<img src="', a.icon || this.emptyIcon, '" class="x-tree-node-icon',(a.icon ? " x-tree-node-inline-icon" : ""),(a.iconCls ? " "+a.iconCls : ""),'" unselectable="on" />',
		cb ? ('<input class="x-tree-node-cb" type="checkbox" ' + (a.checked ? 'checked="checked" />' : '/>')) : '',
		'<a hidefocus="on" class="x-tree-node-anchor" href="',href,'" tabIndex="1" ',
		 a.hrefTarget ? ' target="'+a.hrefTarget+'"' : "", '><span unselectable="on">',n.text,"</span></a></div>",
		'<ul class="x-tree-node-ct" style="display:none;"></ul>',
		"</li>"].join('');

	if(bulkRender !== true && n.nextSibling && n.nextSibling.ui.getEl()){
		this.wrap = Ext.DomHelper.insertHtml("beforeBegin",
							n.nextSibling.ui.getEl(), buf);
	}else{
		this.wrap = Ext.DomHelper.insertHtml("beforeEnd", targetNode, buf);
	}
	
	this.elNode = this.wrap.childNodes[0];
	this.ctNode = this.wrap.childNodes[1];
	var cs = this.elNode.childNodes;
	this.indentNode = cs[0];
	this.ecNode = cs[1];
	this.iconNode = cs[2];
	var index = 3;
	if(cb){
		this.checkbox = cs[3];
		index++;
	}
	this.anchor = cs[index];
	this.textNode = cs[index].firstChild;
	
};//end renderElements

 /**
  * @Author Dang Khoa
  * @class Tn.Ext.TreeNode 
  * @extends Ext.tree.TreeNode
  * @tnon {Object}  The action & handler of click, dblclik, mouseover, mouseout...
  * See more at Ext.tree.TreeNode
  */
Tn.Ext.TreeNode = function(attributes) {

	attributes.uiProvider = Tn.Ext.TreeNodeUI;
	Tn.Ext.TreeNode.superclass.constructor.call(this, attributes);
	
	if (typeof(attributes.windowContent) != "undefined") {
		jQuery("#meaning_window_content").append("<div id = 'hidden-" + attributes.id + "'>" + attributes.windowContent + "</div>");
		jQuery("#meaning_window_content").append("<div id = 'hidden-meaning-" + attributes.id + "'>" + attributes.text + "</div>");
	
	}//end if 
	
};//end function

Ext.extend(Tn.Ext.TreeNode, Ext.tree.TreeNode);
