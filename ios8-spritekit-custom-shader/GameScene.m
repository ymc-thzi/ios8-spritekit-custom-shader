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
    
    //Setup a container sprite for the shader that makes the movement
    SKSpriteNode *shaderContainer_move = [SKSpriteNode spriteNodeWithImageNamed:@"dummypixel.png"];
    shaderContainer_move.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    shaderContainer_move.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    [self addChild:shaderContainer_move];
    
    //Create the shader from a shader-file
    SKShader* shader_move = [SKShader shaderWithFileNamed:@"shader_water_movement.fsh"];
    //Set vairiables that are used in the shader script
    shader_move.uniforms = @[
                        [SKUniform uniformWithName:@"size" floatVector3:GLKVector3Make(self.frame.size.width*1.2, self.frame.size.height*1.5, 0)],
                        [SKUniform uniformWithName:@"customTexture" texture:[SKTexture textureWithImageNamed:@"sand.png"]],
                        ];
    //add the shader to the sprite
    shaderContainer_move.shader = shader_move;
    
    //Setup a container sprite for the shader that makes the reflections
    SKSpriteNode *shaderContainer_reflect = [SKSpriteNode spriteNodeWithImageNamed:@"dummypixel.png"];
    shaderContainer_reflect.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    shaderContainer_reflect.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    [self addChild:shaderContainer_reflect];
    
    //Create the shader from a shader-file
    SKShader* shader_reflect = [SKShader shaderWithFileNamed:@"shader_water_reflection.fsh"];
    //Set vairiables that are used in the shader script
    shader_reflect.uniforms = @[
                             [SKUniform uniformWithName:@"size" floatVector3:GLKVector3Make(self.frame.size.width, self.frame.size.height, 0)],
                          ];
    //add the shader to the sprite
    shaderContainer_reflect.shader = shader_reflect;
    
    //just add sand sprite only to look good :-)
    SKSpriteNode *beach = [SKSpriteNode spriteNodeWithImageNamed:@"beach.png"];
    beach.size = self.size;
    beach.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-100);
    [self addChild:beach];
}


@end
