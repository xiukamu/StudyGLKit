//
//  AGLKView.m
//  Opengles_ch02_02
//
//  Created by 于军振 on 2020/1/20.
//  Copyright © 2020 于军振. All rights reserved.
//

#import "AGLKView.h"

@implementation AGLKView
+ (Class)layerClass
{
   return [CAEAGLLayer class];
}
- (instancetype)initWithFrame:(CGRect)frame context:(EAGLContext *)context {
    self = [super initWithFrame:frame];
    if (self) {
        CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
        
        eaglLayer.drawableProperties =
           [NSDictionary dictionaryWithObjectsAndKeys:
               [NSNumber numberWithBool:NO],
               kEAGLDrawablePropertyRetainedBacking,
               kEAGLColorFormatRGBA8,
               kEAGLDrawablePropertyColorFormat,
               nil];
        self.context = context;
    }
    return self;
}
- (id)initWithCoder:(NSCoder*)coder
{
   if ((self = [super initWithCoder:coder]))
   {
      CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
      
      eaglLayer.drawableProperties =
         [NSDictionary dictionaryWithObjectsAndKeys:
             [NSNumber numberWithBool:NO],
             kEAGLDrawablePropertyRetainedBacking,
             kEAGLColorFormatRGBA8,
             kEAGLDrawablePropertyColorFormat,
             nil];
   }
   
   return self;
}
- (void)setContext:(EAGLContext *)context {
    if (_context != context ) {
        [EAGLContext setCurrentContext:_context];
        if (0 != colorRenderBuffer) {
            glDeleteRenderbuffers(1, &colorRenderBuffer);
            colorRenderBuffer = 0;
        }
        if (0 != depthRenderBuffer) {
            glDeleteRenderbuffers(1, &depthRenderBuffer);
            depthRenderBuffer = 0;
        }
        if (0 != defaultFrameBuffer) {
            glDeleteFramebuffers(1, &defaultFrameBuffer);
            defaultFrameBuffer = 0;
        }
        _context = context;
        if (nil != _context) {

            [EAGLContext setCurrentContext:_context];
            glGenFramebuffers(1, &defaultFrameBuffer);
            glBindFramebuffer(GL_FRAMEBUFFER, defaultFrameBuffer);
            
            glGenRenderbuffers(1, &colorRenderBuffer);
            glBindRenderbuffer(GL_RENDERBUFFER, colorRenderBuffer);
            
            glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, colorRenderBuffer);
            [self layoutSubviews];
        }
        
    }
}
- (void)drawRect:(CGRect)rect
{
   if(self.delegate)
   {
      [self.delegate glkView:self drawInRect:[self bounds]];
   }
}

- (void)display {
      [EAGLContext setCurrentContext:self.context];
      glViewport(0, 0, (GLint)self.drawableWidth, (GLint)self.drawableHeight);

      [self drawRect:[self bounds]];
      
      [self.context presentRenderbuffer:GL_RENDERBUFFER];

}

- (void)layoutSubviews {
    CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
    [EAGLContext setCurrentContext:self.context];
    [self.context renderbufferStorage:GL_RENDERBUFFER fromDrawable:eaglLayer];

    if (0 != depthRenderBuffer) {
        glDeleteRenderbuffers(1, &depthRenderBuffer);
        defaultFrameBuffer = 0;
    }
    
    GLint currentDrawableWidth = (GLint)self.drawableWidth;
    GLint currentDrawableHeight = (GLint)self.drawableHeight;
    if (self.drawableDepthFormat != AGLKViewDrawableDepthFormatNone && 0 < currentDrawableWidth && 0 < currentDrawableHeight) {
        glGenRenderbuffers(1, &depthRenderBuffer);
        glBindRenderbuffer(GL_RENDERBUFFER, depthRenderBuffer);
        
        glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, currentDrawableWidth, currentDrawableHeight);
        glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, depthRenderBuffer);
    }
    // Check for any errors configuring the render buffer
      GLenum status = glCheckFramebufferStatus(
         GL_FRAMEBUFFER) ;
        
      if(status != GL_FRAMEBUFFER_COMPLETE) {
          NSLog(@"failed to make complete frame buffer object %x", status);
      }

      // Make the Color Render Buffer the current buffer for display
      glBindRenderbuffer(GL_RENDERBUFFER, colorRenderBuffer);
    
}

- (NSInteger)drawableWidth {
    GLint backingWidth;
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &backingWidth);
    return backingWidth;
}
- (NSInteger)drawableHeight {
    GLint backingHidth;
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &backingHidth);
    return backingHidth;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
