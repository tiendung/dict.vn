MyXssMagic = new function() {
  var BASE_URL = 'http://localhost:3000/';

  //var BASE_URL = 'http://thieungu.com/dict/';
  var STYLESHEET = BASE_URL + "stylesheets/bookmarklet/stylesheets.css"
  var CONTENT_URL = BASE_URL + 'javascripts/thieungu_1_0_0/bookmarklet/bookmarklet.js';
	
  function requestStylesheet(stylesheet_url) {
    stylesheet = document.createElement("link");
    stylesheet.rel = "stylesheet";
    stylesheet.type = "text/css";
    stylesheet.href = stylesheet_url;
    stylesheet.media = "all";
    document.lastChild.firstChild.appendChild(stylesheet);
  }

  function requestContent() {
    var script = document.createElement('script');
    // How you'd pass the current URL into the request
    // script.src = CONTENT_URL + '&url=' + escape(local || location.href);
    script.src = CONTENT_URL;
    document.getElementsByTagName('head')[0].appendChild(script);
  }

	this.init = function() {
	  requestStylesheet(STYLESHEET);
	  requestContent();
	}//end init
}
MyXssMagic.init();


