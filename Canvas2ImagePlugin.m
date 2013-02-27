//
//  Canvas2ImagePlugin.m
//  Canvas2ImagePlugin PhoneGap/Cordova plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//	MIT Licensed
//

#import "Canvas2ImagePlugin.h"
#import <Cordova/CDV.h>

#define C2I_PHOTO_PREFIX @"c2i_photo_"

@implementation Canvas2ImagePlugin
@synthesize callbackId, imageFilePath;

-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
{
    self = (Canvas2ImagePlugin*)[super initWithWebView:theWebView];
    return self;
}

- (void)saveImageDataToLibrary:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
{
	self.callbackId = arguments.pop;
	
	NSData* imageData = [NSData dataFromBase64String:arguments.pop];
	
	UIImage* image = [[[UIImage alloc] initWithData:imageData] autorelease];
    
    // write to temp directory and return URI
    // get the temp directory path
    NSString* docsPath = [NSTemporaryDirectory ()stringByStandardizingPath];
    NSError* err = nil;
    NSFileManager* fileMgr = [[NSFileManager alloc] init]; // recommended by apple (vs [NSFileManager defaultManager]) to be threadsafe
    // generate unique file name
    NSString* filePath;
    
    int i = 1;
    do {
        filePath = [NSString stringWithFormat:@"%@/%@%03d.%@", docsPath, C2I_PHOTO_PREFIX, i++, @"png"];
    } while ([fileMgr fileExistsAtPath:filePath]);
    
    // CDVPluginResult* result = nil;
    // save file
    if (![imageData writeToFile:filePath options:NSAtomicWrite error:&err]) {
        NSLog(@"ERROR: %@",[err localizedDescription]);
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_IO_EXCEPTION messageAsString:[err localizedDescription]];
        [self.webView stringByEvaluatingJavaScriptFromString:[result toErrorCallbackString: self.callbackId]];
        
    } else {
        self.imageFilePath = [[NSURL fileURLWithPath:filePath] absoluteString];
    }
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // Was there an error?
    if (error != NULL)
    {
        // Show error message...
        NSLog(@"ERROR: %@",error);
		CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString:error.description];
		[self.webView stringByEvaluatingJavaScriptFromString:[result toSuccessCallbackString: self.callbackId]];
    }
    else  // No errors
    {
        // Show message image successfully saved
        NSLog(@"IMAGE SAVED: %@", self.imageFilePath);
		CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK messageAsString:self.imageFilePath];
		[self.webView stringByEvaluatingJavaScriptFromString:[result toSuccessCallbackString: self.callbackId]];
    }
}

- (void)dealloc
{	
	[callbackId release];
    [super dealloc];
}


@end
