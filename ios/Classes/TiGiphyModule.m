/**
 * titanium-giphy
 *
 * Created by Your Name
 * Copyright (c) 2023 Your Company. All rights reserved.
 */

#import "TiGiphyModule.h"
#import "TiGiphyMediaProxy.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TiApp.h"

@implementation TiGiphyModule

#pragma mark Internal

- (id)moduleGUID
{
  return @"e85a05bb-b3dd-47f8-90da-74c63d9ab478";
}

- (NSString *)moduleId
{
  return @"ti.giphy";
}

#pragma mark Public APIs

- (void)initialize:(id)params
{
  ENSURE_SINGLE_ARG(params, NSDictionary);
  
  NSString *apiKey = [TiUtils stringValue:@"apiKey" properties:params];
  BOOL verificationMode = [TiUtils boolValue:@"verificationMode" properties:params def:NO];
  
  [Giphy configureWithApiKey:apiKey
            verificationMode:verificationMode
                    metadata:@{}];
}

- (void)showGIFDialog:(id)params
{
  ENSURE_SINGLE_ARG(params, NSDictionary);
  
  _callback = params[@"callback"];
  
  GiphyViewController *giphy = [GiphyViewController new];
  giphy.delegate = self;
  
  TiThreadPerformOnMainThread(^{
    [TiApp.app showModalController:giphy animated:YES];
  }, NO);
}

#pragma mark GiphyDelegate

- (void)didDismissWithController:(GiphyViewController * _Nullable)controller {
  _callback = nil;
}

- (void)didSelectMediaWithGiphyViewController:(GiphyViewController *)giphyViewController media:(GPHMedia *)media contentType:(enum GPHContentType)contentType
{
  NSDictionary *event = @{
    @"media": [[TiGiphyMediaProxy alloc] _initWithPageContext:self.pageContext andMedia:media],
    @"title": NULL_IF_NIL(media.title),
    @"description": media.description,
    @"contentUrl": NULL_IF_NIL(media.contentUrl),
    @"url": [media urlWithRendition:GPHRenditionTypeDownsized fileType:GPHFileExtensionGif]
  };
  
  [_callback call:@[event] thisObject:self];
  [TiApp.app hideModalController:giphyViewController animated:YES];
}

@end
