//
//  Ch03_01_Controller.m
//  OpenGLES_Ch03
//
//  Created by 于军振 on 2020/1/22.
//  Copyright © 2020 于军振. All rights reserved.
//

#import "Ch03_01_Controller.h"
#import "AGLKVertexAttribArrayBuffer.h"
@interface Ch03_01_Controller ()
@property (strong, nonatomic) GLKBaseEffect *baseEffect;
@property (nonatomic, strong) AGLKVertexAttribArrayBuffer *vertexBuffer;
@end

@implementation Ch03_01_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initContext];
}
- (void)initContext {
    GLKView *view = (GLKView *)self.view;
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:view.context];
    self.baseEffect = [[GLKBaseEffect alloc] init];
      self.baseEffect.useConstantColor = GL_TRUE;
      self.baseEffect.constantColor = GLKVector4Make(
         1.0f, // Red
         1.0f, // Green
         1.0f, // Blue
         1.0f);// Alpha
      
      // Set the background color stored in the current context
   glClearColor(
         0.0f, // Red
         0.0f, // Green
         0.0f, // Blue
         1.0f);// Alpha
      
      // Create vertex buffer containing vertices to draw
      self.vertexBuffer = [[AGLKVertexAttribArrayBuffer alloc]
         initWithAttribStride:sizeof(SceneVertex)
         numberOfVertices:sizeof(vertices) / sizeof(SceneVertex)
         bytes:vertices
         usage:GL_STATIC_DRAW];
      
      // Setup texture
      CGImageRef imageRef =
         [[UIImage imageNamed:@"leaves.gif"] CGImage];
         
      GLKTextureInfo *textureInfo = [GLKTextureLoader
         textureWithCGImage:imageRef
         options:nil
         error:NULL];
      
      self.baseEffect.texture2d0.name = textureInfo.name;
      self.baseEffect.texture2d0.target = textureInfo.target;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    
}
@end
