//
//  UIImage+ScaleImageToSize.m
//  CenterAFace
//
//  Created by Peter Foti on 9/29/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import "UIImage+ScaleImageToSize.h"

@implementation UIImage (ScaleImageToSize)

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(CGSizeMake(size.width / 2.0, size.height / 2.0));
    [image drawInRect:CGRectMake(0, 0, size.width / 2.0, size.height / 2.0)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
