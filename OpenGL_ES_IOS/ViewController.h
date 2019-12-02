//
//  ViewController.h
//  OpenGL_ES_IOS
//
//  Created by Mohamed Shemy on 3/24/17.
//  Copyright © 2017 Mohamed Shemy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface ViewController : GLKViewController
{
    GLuint vertexBufferID;
}

@property (strong, nonatomic) GLKBaseEffect *baseEffect;

@end

