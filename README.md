Canvas2ImagePlugin
============

This plugin allows you to save the contents of an HTML canvas tag to the iOS Photo Library from your app.

Installation
------------

### For Cordova 3.0.x:

1. To add this plugin just type: `cordova plugin add https://github.com/devgeeks/Canvas2ImagePlugin.git` or `phonegap local plugin add https://github.com/devgeeks/Canvas2ImagePlugin.git`
2. To remove this plugin type: `cordova plugin remove org.devgeeks.Canvas2ImagePlugin` or `phonegap local plugin remove org.devgeeks.Canvas2ImagePlugin`
3. For now, you'll also have to add the Canvas2ImagePlugin.js to your html file. eg: `<script type="text/javascript" charset="utf-8" src="Canvas2ImagePlugin.js"></script>`

The last step will go away when I get a chance to modularise the JavaScript

### For older versions of Cordova:

Add the plugin much like any other:

1.	Add the src/ios/Canvas2ImagePlugin.h, src/ios/Canvas2ImagePlugin.m classes to your Plugins folder in Xcode (use "Create groups for any added folders")
2.	Add the www/Canvas2ImagePlugin.js file to your www folder
3.	Add the Canvas2ImagePlugin.js to your html file. eg: `<script type="text/javascript" charset="utf-8" src="Canvas2ImagePlugin.js"></script>`
4.	Add the plugin to your config.xml `<plugin name="Canvas2ImagePlugin" value="Canvas2ImagePlugin" />` (or if you are using an older version of PhoneGap / Cordova, the Cordova.plist under Plugins (key: "Canvas2ImagePlugin" value: "Canvas2ImagePlugin"))


Finally, call the `window.plugins.canvas2ImagePlugin.saveImageDataToLibrary()` method using success and error callbacks and the id attribute of the canvas to save:

### Example
```html
<canvas id="myCanvas" width="165px" height="145px"></canvas>
```

```javascript
function onDeviceReady()
{
	var canvas2ImagePlugin = window.plugins.canvas2ImagePlugin;
	canvas2ImagePlugin.saveImageDataToLibrary(
		function(msg){
			console.log(msg);
		}, 
		function(err){
			console.log(err);
		}, 
		'myCanvas'
	);
}
```

## License

The MIT License

Copyright (c) 2011 Tommy-Carlos Williams (http://github.com/devgeeks)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
