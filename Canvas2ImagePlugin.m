//
//  Canvas2ImagePlugin.m
//  Canvas2ImagePlugin PhoneGap plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//	MIT Licensed
//

#import "Canvas2ImagePlugin.h"
#import "NSData+Base64.h"

@implementation Canvas2Image
@synthesize callbackId;

-(PGPlugin*) initWithWebView:(UIWebView*)theWebView
{
    self = (Canvas2Image*)[super initWithWebView:theWebView];
    return self;
}

- (void)saveImageDataToLibrary:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
	self.callbackId = arguments.pop;
	
	NSData* imageData = [NSData dataFromBase64String:arguments.pop];
	
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
		PluginResult* result = [PluginResult resultWithStatus: PGCommandStatus_ERROR messageAsString:error.description];
		[self.webView stringByEvaluatingJavaScriptFromString:[result toSuccessCallbackString: self.callbackId]];
    }
    else  // No errors
    {
        // Show message image successfully saved
        NSLog(@"IMAGE SAVED!");
		PluginResult* result = [PluginResult resultWithStatus: PGCommandStatus_OK messageAsString:@"Image saved"];
		[self.webView stringByEvaluatingJavaScriptFromString:[result toSuccessCallbackString: self.callbackId]];
    }
}

- (void)dealloc
{	
	[callbackId release];
    [super dealloc];
}


@end
