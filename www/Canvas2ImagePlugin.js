//
//  Canvas2ImagePlugin.js
//  Canvas2ImagePlugin PhoneGap/Cordova plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//  MIT Licensed
//


  function Canvas2ImagePlugin() {}
  
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
    var canvas = (typeof canvasId === "string") ? document.getElementById(canvasId) : canvasId;
    var imageData = canvas.toDataURL().replace(/data:image\/png;base64,/,'');
    return cordova.exec(successCallback, failureCallback, "Canvas2ImagePlugin","saveImageDataToLibrary",[imageData]);
  };

  var canvas2ImagePlugin = new Canvas2ImagePlugin();
  module.exports = canvas2ImagePlugin;
  
