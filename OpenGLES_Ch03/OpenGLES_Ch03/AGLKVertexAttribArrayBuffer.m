//
//  AGLKVertexAttribArrayBuffer.m
//  AEFrame
//
//  Created by 于军振 on 2019/12/31.
//  Copyright © 2019 于军振. All rights reserved.
//

#import "AGLKVertexAttribArrayBuffer.h"

@implementation AGLKVertexAttribArrayBuffer
+ (void)drawPreparedArraysWithMode:(GLenum)mode
   startVertexIndex:(GLint)first
                  numberOfVertices:(GLsizei)count {
      glDrawArrays(mode, first, count); // Step 6
}

- (id)initWithAttribStride:(GLsizeiptr)stride
   numberOfVertices:(GLsizei)count
   bytes:(const GLvoid *)dataPtr
                     usage:(GLenum)usage {
    NSParameterAssert(0 < stride);
    NSAssert((0 < count && NULL != dataPtr) || (0 == count && NULL == dataPtr), @"data must not be null or count > 0");
    if (nil != (self = [super init])) {
        _stride = stride;
        _buffersizeBytes = stride * count;
        glGenBuffers(1, &(_name));
        glBindBuffer(GL_ARRAY_BUFFER, _name);
        glBufferData(GL_ARRAY_BUFFER, _buffersizeBytes, dataPtr, usage);
        
          NSAssert(0 != _name, @"Failed to generate name");
    }
    return self;
}

- (void)prepareToDrawWithAttrib:(GLuint)index
   numberOfCoordinates:(GLint)count
   attribOffset:(GLsizeiptr)offset
                   shouldEnable:(BOOL)shouldEnable {
      NSParameterAssert((0 < count) && (count < 4));
       NSParameterAssert(offset < _stride);
       NSAssert(0 != _name, @"Invalid name");

       glBindBuffer(GL_ARRAY_BUFFER,     // STEP 2
          _name);

       if(shouldEnable)
       {
          glEnableVertexAttribArray(     // Step 4
             index);
       }

       glVertexAttribPointer(            // Step 5
          index,               // Identifies the attribute to use
          count,               // number of coordinates for attribute
          GL_FLOAT,            // data is floating point
          GL_FALSE,            // no fixed point scaling
          _stride,         // total num bytes stored per vertex
          NULL + offset);      // offset from start of each vertex to
                               // first coord for attribute
    #ifdef DEBUG
       {  // Report any errors
          GLenum error = glGetError();
          if(GL_NO_ERROR != error)
          {
             NSLog(@"GL Error: 0x%x", error);
          }
       }
    #endif
}

- (void)drawArrayWithMode:(GLenum)mode
   startVertexIndex:(GLint)first
         numberOfVertices:(GLsizei)count {
    NSAssert(_buffersizeBytes >=
         ((first + count) * self.stride),
         @"Attempt to draw more vertex data than available.");
         
      glDrawArrays(mode, first, count); // Step 6
}
   
- (void)reinitWithAttribStride:(GLsizeiptr)stride
   numberOfVertices:(GLsizei)count
                         bytes:(const GLvoid *)dataPtr {
    NSParameterAssert(0 < stride);
    NSParameterAssert(0 < count);
    NSParameterAssert(NULL != dataPtr);
    NSAssert(0 != _name, @"Invalid name");

    _stride = stride;
    _buffersizeBytes = stride * count;
    
    glBindBuffer(GL_ARRAY_BUFFER,  // STEP 2
       self.name);
    glBufferData(                  // STEP 3
       GL_ARRAY_BUFFER,  // Initialize buffer contents
       _buffersizeBytes,  // Number of bytes to copy
       dataPtr,          // Address of bytes to copy
       GL_DYNAMIC_DRAW);
}

/////////////////////////////////////////////////////////////////
// This method deletes the receiver's buffer from the current
// Context when the receiver is deallocated.
- (void)dealloc
{
    // Delete buffer from current context
    if (0 != _name)
    {
        glDeleteBuffers (1, &(_name)); // Step 7
        _name = 0;
    }
}
@end
