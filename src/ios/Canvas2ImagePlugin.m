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

@implementation Canvas2ImagePlugin
@synthesize callbackId;

//-(CDVPlugin*) initWithWebView:(UIWebView*)theWebView
//{
//    self = (Canvas2ImagePlugin*)[super initWithWebView:theWebView];
//    return self;
//}

- (void)saveImageDataToLibrary:(CDVInvokedUrlCommand*)command
{
    self.callbackId = command.callbackId;
	NSData* imageData = [NSData dataFromBase64String:[command.arguments objectAtIndex:0]];
	
	UIImage* image = [[[UIImage alloc] initWithData:imageData] autorelease];	
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library writeImageToSavedPhotosAlbum:[image CGImage] orientation:(ALAssetOrientation)[image imageOrientation] completionBlock:^(NSURL *assetURL, NSError *error){
        if (error) {
            // Show error message...
            NSLog(@"ERROR: %@",error);
            CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_ERROR messageAsString:error.description];
            [self.webView stringByEvaluatingJavaScriptFromString:[result toErrorCallbackString: self.callbackId]];
        } else {
            // Show message image successfully saved
            NSLog(@"IMAGE SAVED!");
            NSString* url = [assetURL absoluteString];
            CDVPluginResult* result = [CDVPluginResult resultWithStatus: CDVCommandStatus_OK messageAsString:url];
            [self.webView stringByEvaluatingJavaScriptFromString:[result toSuccessCallbackString: self.callbackId]];
        }  
    }];
    [library release];
}

- (void)dealloc
{	
	[callbackId release];
    [super dealloc];
}


@end
