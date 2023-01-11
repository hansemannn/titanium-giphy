/**
 * Axway Titanium
 * Copyright (c) 2009-present by Axway Appcelerator. All Rights Reserved.
 * Licensed under the terms of the Apache Public License
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiGiphyMediaProxy.h"
#import "TiGiphyMediaView.h"

@implementation TiGiphyMediaView

- (void)initializeState {
  [super initializeState];

  if (self) {
    _mediaView = [[GPHMediaView alloc] init];
    _mediaView.media = [(TiGiphyMediaProxy *)[self.proxy valueForKey:@"media"] media];

    [self addSubview:_mediaView];
  }
}

- (void)frameSizeChanged:(CGRect)frame bounds:(CGRect)bounds {
  for (UIView *child in [self subviews])
    [TiUtils setView:child positionRect:bounds];

  [super frameSizeChanged:frame bounds:bounds];
}

@end
