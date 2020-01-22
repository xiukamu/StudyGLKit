//
//  AGLKViewController.h
//  Opengles_ch02_02
//
//  Created by 于军振 on 2020/1/22.
//  Copyright © 2020 于军振. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "AGLKView.h"
NS_ASSUME_NONNULL_BEGIN

@interface AGLKViewController : UIViewController <AGLKViewDelegate>

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, assign) NSInteger preferredFramesPerSecond;

/////////////////////////////////////////////////////////////////
// This property contains the actual frames per second based
// upon the value for preferredFramesPerSecond property
// and the screen on which the GLKView resides.
// The value is as close to preferredFramesPerSecond as
// possible, without exceeding the screen's refresh rate. This
// value does not account for dropped frames, so it is not a
// measurement of your statistical frames per second. It is the
// static value for which updates will take place.
@property (nonatomic, readonly) NSInteger framesPerSecond;

/////////////////////////////////////////////////////////////////
// Thi property determines whether to pause or resume drawing
// at the rate defined by the framesPerSecond property.
// Initial value is NO.
@property (nonatomic, getter=isPaused) BOOL paused;

@end

NS_ASSUME_NONNULL_END
