//
//  Canvas2ImagePlugin.h
//  Canvas2ImagePlugin PhoneGap plugin
//
//  Created by Tommy-Carlos Williams on 29/03/12.
//  Copyright (c) 2012 Tommy-Carlos Williams. All rights reserved.
//	MIT Licensed
//

#import <Foundation/Foundation.h>
#ifdef PHONEGAP_FRAMEWORK
#import <PhoneGap/PGPlugin.h>
#else
#import "PGPlugin.h"
#endif

@interface Canvas2ImagePlugin : PGPlugin 
{
	NSString* callbackId;
}

@property (nonatomic, copy) NSString* callbackId;

- (void)saveImageDataToLibrary:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end
