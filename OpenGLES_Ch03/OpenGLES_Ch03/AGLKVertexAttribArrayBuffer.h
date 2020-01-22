//
//  AGLKVertexAttribArrayBuffer.h
//  AEFrame
//
//  Created by 于军振 on 2019/12/31.
//  Copyright © 2019 于军振. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface AGLKVertexAttribArrayBuffer : NSObject
@property(nonatomic,assign,readonly) GLuint name;
@property(nonatomic,assign,readonly) GLsizeiptr buffersizeBytes;
@property(nonatomic,assign,readonly) GLsizeiptr stride;

+ (void)drawPreparedArraysWithMode:(GLenum)mode
   startVertexIndex:(GLint)first
   numberOfVertices:(GLsizei)count;

- (id)initWithAttribStride:(GLsizeiptr)stride
   numberOfVertices:(GLsizei)count
   bytes:(const GLvoid *)dataPtr
   usage:(GLenum)usage;

- (void)prepareToDrawWithAttrib:(GLuint)index
   numberOfCoordinates:(GLint)count
   attribOffset:(GLsizeiptr)offset
   shouldEnable:(BOOL)shouldEnable;

- (void)drawArrayWithMode:(GLenum)mode
   startVertexIndex:(GLint)first
   numberOfVertices:(GLsizei)count;
   
- (void)reinitWithAttribStride:(GLsizeiptr)stride
   numberOfVertices:(GLsizei)count
   bytes:(const GLvoid *)dataPtr;


@end

NS_ASSUME_NONNULL_END
