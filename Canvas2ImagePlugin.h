//
//  Canvas2ImagePlugin.h
//  Canvas2ImagePlugin PhoneGap/Cordova plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//	MIT Licensed
//

#import <Foundation/Foundation.h>
#ifdef PHONEGAP_FRAMEWORK
#import <PhoneGap/PGPlugin.h>
#endif
#ifdef CORDOVA_FRAMEWORK
#import <Cordova/CDVPlugin.h>
#endif

#ifdef PHONEGAP_FRAMEWORK
@interface Canvas2ImagePlugin : PGPlugin 
#endif
#ifdef CORDOVA_FRAMEWORK
@interface Canvas2ImagePlugin : CDVPlugin
#endif
{
	NSString* callbackId;
}

@property (nonatomic, copy) NSString* callbackId;

- (void)saveImageDataToLibrary:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end
