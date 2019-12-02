//
//  ViewController.m
//  OpenGL_ES_IOS
//
//  Created by Mohamed Shemy on 3/24/17.
//  Copyright © 2017 Mohamed Shemy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize baseEffect;

typedef struct
{
    GLKVector3  positionCoords;
}SceneVertex;

static const SceneVertex vertices[] =
{
    {{-0.5f, -0.5f, 0.0f}},
    {{ 0.5f, -0.5f, 0.0f}},
    {{-0.5f,  0.5f, 0.0f}},
    {{ 0.5f,  0.5f, 0.0f}}
};


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    GLKView *view = (GLKView *)self.view;
    NSAssert([view isKindOfClass:[GLKView class]],@"View controller's view is not a GLKView");
    
    view.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    [EAGLContext setCurrentContext:view.context];
    
    self.baseEffect = [[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor = GL_TRUE;
    self.baseEffect.constantColor = GLKVector4Make(1.0f,1.0f,1.0f,1.0f);
    
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
    glGenBuffers(1,&vertexBufferID);
    glBindBuffer(GL_ARRAY_BUFFER,vertexBufferID);
    glBufferData(GL_ARRAY_BUFFER,sizeof(vertices),vertices,GL_STATIC_DRAW);
    
}


- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [self.baseEffect prepareToDraw];
    
    glClear(GL_COLOR_BUFFER_BIT);
    
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    
    glVertexAttribPointer(GLKVertexAttribPosition, 3,GL_FLOAT,GL_FALSE,sizeof(SceneVertex), NULL);
    glDrawArrays(GL_TRIANGLE_STRIP,0,4);
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    GLKView *view = (GLKView *)self.view;
    [EAGLContext setCurrentContext:view.context];
    
    if (vertexBufferID != 0)
    {
        glDeleteBuffers (1,&vertexBufferID);
        vertexBufferID = 0;
    }
    
    ((GLKView *)self.view).context = nil;
    [EAGLContext setCurrentContext:nil];

}


@end
