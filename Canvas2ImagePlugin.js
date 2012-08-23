//
//  Canvas2ImagePlugin.js
//  Canvas2ImagePlugin PhoneGap/Cordova plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//	MIT Licensed
//

(function(gap){
	
	Canvas2ImagePlugin = function() {
		
	}
	
	Canvas2ImagePlugin.prototype.saveImageDataToLibrary = function(successCallback, failureCallback, canvasId) {
		// successCallback required
	    	if (typeof successCallback != "function") {
	        	console.log("Canvas2ImagePlugin Error: successCallback is not a function");
	        	return;
	    	}
	    	if (typeof failureCallback != "function") {
	       		console.log("Canvas2ImagePlugin Error: failureCallback is not a function");
	        	return;
	    	}
		var canvas = document.getElementById(canvasId);
		var imageData = canvas.toDataURL().replace(/data:image\/png;base64,/,'');
		gap.exec(successCallback, failureCallback, "Canvas2ImagePlugin","saveImageDataToLibrary",[imageData]);
	};
	
	gap.addConstructor(function(){
		if(!window.plugins) {
			window.plugins = {};
		}
		window.plugins.canvas2ImagePlugin = new Canvas2ImagePlugin();
	});
	
})(window.PhoneGap || window.Cordova || window.cordova);