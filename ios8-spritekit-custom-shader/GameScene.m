//
//  GameScene.m
//  ios8-spritekit-custom-shader
//
//  Created by ymc-thzi on 15.09.14.
//  Copyright (c) 2014 ymc-thzi. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    
    //Setup a background
    SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"sand.png"];
    background.size = self.size;
    background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self addChild:background];
    
    //Setup a container sprite for the shader
    SKSpriteNode *shaderContainer = [SKSpriteNode spriteNodeWithImageNamed:@"dummypixel.png"];
    shaderContainer.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    shaderContainer.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    [self addChild:shaderContainer];
    
    //Create the shader from a shader-file
    SKShader* shader = [SKShader shaderWithFileNamed:@"shader_water.fsh"];
    //Set vairiables that are used in the shader script
    shader.uniforms = @[
                        [SKUniform uniformWithName:@"size" floatVector3:GLKVector3Make(self.frame.size.width, self.frame.size.height, 0)],
                        ];
    //add the shader to the sprite
    shaderContainer.shader = shader;
    
    //just add one more sprite only to look good :-) 
    SKSpriteNode *beach = [SKSpriteNode spriteNodeWithImageNamed:@"beach.png"];
    beach.size = self.size;
    beach.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self addChild:beach];
}


@end
