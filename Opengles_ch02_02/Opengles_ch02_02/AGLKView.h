//
//  AGLKView.h
//  Opengles_ch02_02
//
//  Created by 于军振 on 2020/1/20.
//  Copyright © 2020 于军振. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <OpenGLES/ES2/gl.h>
#import <OpenGLES/ES2/glext.h>
NS_ASSUME_NONNULL_BEGIN
typedef enum
{
    AGLKViewDrawableDepthFormatNone = 0,
    AGLKViewDrawableDepthFormat16,
    AGLKViewDrawableDepthFormat24,
    
} AGLKViewDrawableDepthFormat;
@class AGLKView;
@protocol AGLKViewDelegate
- (void)glkView:(AGLKView *)view drawInRect:(CGRect)rect;
@end
@interface AGLKView : UIView
{
   GLuint        defaultFrameBuffer;
   GLuint        colorRenderBuffer;
   GLuint        depthRenderBuffer;
}
- (instancetype)initWithFrame:(CGRect)frame context:(EAGLContext *)context;

@property (nullable, nonatomic, assign) id <AGLKViewDelegate> delegate;

@property (nonatomic, strong) EAGLContext *context;

@property (nonatomic, readonly) NSInteger drawableWidth;
@property (nonatomic, readonly) NSInteger drawableHeight;

@property (nonatomic) AGLKViewDrawableDepthFormat drawableDepthFormat;

/*
 Controls whether the view responds to setNeedsDisplay. If true, then the view behaves similarily to a UIView.
 When the view has been marked for display, the draw method is called during the next drawing cycle. If false,
 the view's draw method will never be called during the next drawing cycle. It is expected that -display will be
 called directly in this case. enableSetNeedsDisplay is automatically set to false when used in conjunction with
 the GLKViewController. This value is true by default.
 */
@property (nonatomic) BOOL enableSetNeedsDisplay;


- (void)display;

@end

NS_ASSUME_NONNULL_END
