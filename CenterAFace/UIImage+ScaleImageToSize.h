//
//  UIImage+ScaleImageToSize.h
//  CenterAFace
//
//  Created by Peter Foti on 9/29/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ScaleImageToSize)

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)size;

@end
