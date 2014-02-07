cordova.define("org.devgeeks.Canvas2ImagePlugin.Canvas2ImagePlugin", function(require, exports, module) {

//
//  Canvas2ImagePlugin.js
//  Canvas2ImagePlugin PhoneGap/Cordova plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//  MIT Licensed
//

module.exports = (function() {

    function validateCallBacks(successCallback, failureCallback){

        var isValid = true;

        if (typeof successCallback != "function") {
            console.log("Canvas2ImagePlugin Error: successCallback is not a function");
            isValid = false;
        }
        else if (typeof failureCallback != "function") {
            console.log("Canvas2ImagePlugin Error: failureCallback is not a function");
            isValid = false;
        }
        return isValid;
    }

    function saveImageDataToLibrary(successCallback, failureCallback, canvasId) {
        // successCallback required
        if (validateCallBacks(successCallback, failureCallback)) {
            var canvas = (typeof canvasId === "string") ? document.getElementById(canvasId) : canvasId;
            var imageData = canvas.toDataURL().replace(/data:image\/png;base64,/,'');
            return saveDataStringAsImageDataToLibrary(successCallback, failureCallback, imageData);
        }
    }

    function saveDataStringAsImageDataToLibrary(successCallback, failureCallback, imageData) {
        if (validateCallBacks(successCallback, failureCallback)) {
            return cordova.exec(successCallback, failureCallback,
                "Canvas2ImagePlugin","saveImageDataToLibrary",[imageData]);
        }
    }

    return {
        saveImageDataToLibrary: saveImageDataToLibrary,
        saveDataStringAsImageDataToLibrary: saveDataStringAsImageDataToLibrary
    }

})()

});


