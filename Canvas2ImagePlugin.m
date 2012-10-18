//
//  Canvas2ImagePlugin.m
//  Canvas2ImagePlugin PhoneGap/Cordova plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//	MIT Licensed
//

#import "Canvas2ImagePlugin.h"
#import "NSDataAdditions.h"

@implementation Canvas2ImagePlugin
@synthesize callbackId;

#ifdef PHONEGAP_FRAMEWORK
-(PGPlugin*) initWithWebView:(UIWebView*)theWebView
#endif
#ifdef CORDOVA_FRAMEWORK
-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
#endif
{
    self = (Canvas2ImagePlugin*)[super initWithWebView:theWebView];
    return self;
}

- (void)saveImageDataToLibrary:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
	self.callbackId = arguments.pop;
	
	NSData* imageData = [NSData dataWithBase64EncodedString:arguments.pop];
	
	UIImage* image = [[[UIImage alloc] initWithData:imageData] autorelease];	
	UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
	
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // Was there an error?
    if (error != NULL)
    {
        // Show error message...
        NSLog(@"ERROR: %@",error);
#ifdef PHONEGAP_FRAMEWORK
		PluginResult* result = [PluginResult resultWithStatus: PGCommandStatus_ERROR messageAsString:error.description];
#endif
#ifdef CORDOVA_FRAMEWORK
		CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString:error.description];
#endif
		[self.webView stringByEvaluatingJavaScriptFromString:[result toSuccessCallbackString: self.callbackId]];
    }
    else  // No errors
    {
        // Show message image successfully saved
        NSLog(@"IMAGE SAVED!");
#ifdef PHONEGAP_FRAMEWORK
		PluginResult* result = [PluginResult resultWithStatus: PGCommandStatus_OK messageAsString:@"Image saved"];
#endif
#ifdef CORDOVA_FRAMEWORK
		CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK messageAsString:@"Image saved"];
#endif
		[self.webView stringByEvaluatingJavaScriptFromString:[result toSuccessCallbackString: self.callbackId]];
    }
}

- (void)dealloc
{	
	[callbackId release];
    [super dealloc];
}


@end
