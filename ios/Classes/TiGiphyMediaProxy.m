/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiGiphyMediaProxy.h"

@implementation TiGiphyMediaProxy


- (id)_initWithPageContext:(id<TiEvaluator>)context andMedia:(GPHMedia *)media
{
  if (self = [super _initWithPageContext:context]) {
    _media = media;
  }
  
  return self;
}

- (GPHMedia *)media
{
  return _media;
}

@end
