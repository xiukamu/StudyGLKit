//
//  ViewController.m
//  Opengles_ch02_02
//
//  Created by 于军振 on 2020/1/20.
//  Copyright © 2020 于军振. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong)GLKBaseEffect *baseEffect;
@property(nonatomic, assign)GLuint verterBufferID;
@property(nonatomic, strong)EAGLContext *mContent;
@end
static GLKVector3 verters[] = {
    {{-0.5,-0.5,0.0}},
    {{0.5,-0.5,0.0}},
    {{-0.5,0.5,0.0}}
};
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initContent];
}

- (void)initContent {
    self.mContent = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    AGLKView *view = (AGLKView *)self.view;
    view.context = self.mContent;
//    view.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
//    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    [EAGLContext setCurrentContext:self.mContent];
    self.baseEffect = [[GLKBaseEffect alloc] init];

    glClearColor(0.0, 0.0, 0.0, 1.0);
    glGenBuffers(1, &_verterBufferID);
    glBindBuffer(GL_ARRAY_BUFFER, _verterBufferID);
    glBufferData(GL_ARRAY_BUFFER, sizeof(verters), verters, GL_STATIC_DRAW);

    
}
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    [self.baseEffect prepareToDraw];
    glClear(GL_COLOR_BUFFER_BIT);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(GLKVector3), NULL);
    glDrawArrays(GL_TRIANGLES, 0, 3);
    
    
}

@end
