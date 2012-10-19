Canvas2ImagePlugin
============

Installation
------------

This plugin allows you to save the contents of an HTML canvas tag to the iOS Photo Library from your app.

Add the plugin much like any other:

1.	Add the Canvas2ImagePlugin.h, Canvas2ImagePlugin.m classes to your Plugins folder in Xcode (use "Create groups for any added folders")
2.	Add the Canvas2ImagePlugin.js file to your www folder
3.	Add the Canvas2ImagePlugin.js to your html file. eg: `<script type="text/javascript" charset="utf-8" src="Canvas2ImagePlugin.js"></script>`
4.	Add the plugin to the Cordova.plist under Plugins (key: "Canvas2ImagePlugin" value: "Canvas2ImagePlugin")


Finally, call the `saveImageDataToLibrary()` method using success and error callbacks and the id attribute of the canvas to save:

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
