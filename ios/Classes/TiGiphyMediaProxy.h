/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiProxy.h"
#import <GiphyUISDK/GiphyUISDK.h>

@interface TiGiphyMediaProxy : TiProxy {
  GPHMedia *_media;
}

- (id)_initWithPageContext:(id<TiEvaluator>)context andMedia:(GPHMedia *)media;
- (GPHMedia *)media;

@end