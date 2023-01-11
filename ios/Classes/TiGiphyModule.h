/**
 * titanium-giphy
 *
 * Created by Your Name
 * Copyright (c) 2023 Your Company. All rights reserved.
 */

#import "TiModule.h"
#import <GiphyUISDK/GiphyUISDK.h>

@interface TiGiphyModule : TiModule<GiphyDelegate> {
  KrollCallback *_callback;
}

@end
