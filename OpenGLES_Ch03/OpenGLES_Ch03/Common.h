//
//  Common.h
//  OpenGLES_Ch03
//
//  Created by 于军振 on 2020/1/22.
//  Copyright © 2020 于军振. All rights reserved.
//

#ifndef Common_h
#define Common_h
#import <GLKit/GLKit.h>

typedef struct {
   GLKVector3  positionCoords;
   GLKVector2  textureCoords;
}
SceneVertex;

/////////////////////////////////////////////////////////////////
// Define vertex data for a triangle to use in example
static const SceneVertex vertices[] =
{
    {{-0.5f, -0.5f, 0.0f}, {0.0f, 0.0f}}, // lower left corner
    {{ 0.5f, -0.5f, 0.0f}, {1.0f, 0.0f}}, // lower right corner
    {{-0.5f,  0.5f, 0.0f}, {0.0f, 1.0f}}, // upper left corner
    {{ 0.5f, -0.5f, 0.0f}, {1.0f, 0.0f}}, // lower right corner
    {{-0.5f,  0.5f, 0.0f}, {0.0f, 1.0f}}, // upper left corner
    {{ 0.5f,  0.5f, 0.0f}, {1.0f, 1.0f}}, // lower left corner

       
    
};
#endif /* Common_h */
