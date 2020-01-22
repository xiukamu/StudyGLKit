//
//  AGLKViewController.m
//  Opengles_ch02_02
//
//  Created by 于军振 on 2020/1/22.
//  Copyright © 2020 于军振. All rights reserved.
//

#import "AGLKViewController.h"
@interface AGLKViewController ()
@end
static const NSInteger kAGLKDefaultFramesPerSecond = 30;

@implementation AGLKViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {

        self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawView:)];
        _preferredFramesPerSecond = kAGLKDefaultFramesPerSecond;
        self.paused = NO;
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
         self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawView:)];
           _preferredFramesPerSecond = kAGLKDefaultFramesPerSecond;
           self.paused = NO;
        [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

    }
    return self;
}
//- (void)loadView{
//    //不要调 super
//    self.view = [[AGLKView alloc] init];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.AGLKiew = [[AGLKView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:self.AGLKiew];
    AGLKView *view = (AGLKView *)self.view;
    view.delegate = self;
    view.opaque = YES;
    
}
- (void)drawView:(CADisplayLink *)link {
 [(AGLKView *)self.view display];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.paused = NO;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.paused  = YES;
}
- (NSInteger)framesPerSecond;
{
   return 60 / self.displayLink.frameInterval;
}




/////////////////////////////////////////////////////////////////
// This method sets the desired frames per second rate at for
// redrawing the receiver's view.
- (void)setPreferredFramesPerSecond:(NSInteger)aValue
{
   self.preferredFramesPerSecond = aValue;
   
   self.displayLink.frameInterval = MAX(1, (60 / aValue));
}


/////////////////////////////////////////////////////////////////
// This method returns YES if the receiver is paused and NO
// otherwise. The receiver does not automatically prompt redraw
// of the receiver's view when paused.
- (BOOL)isPaused
{
   return self.displayLink.paused;
}


/////////////////////////////////////////////////////////////////
// This method sets whether the receiver is paused. The receiver
// automatically prompts redraw of the receiver's view
// unless paused.
- (void)setPaused:(BOOL)aValue
{
   self.displayLink.paused = aValue;
}

- (void)glkView:(AGLKView *)view drawInRect:(CGRect)rect {
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
