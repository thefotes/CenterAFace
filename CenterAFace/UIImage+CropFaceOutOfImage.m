//
//  UIImage+CropFaceOutOfImage.m
//  CenterAFace
//
//  Created by Peter Foti on 9/29/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import "UIImage+CropFaceOutOfImage.h"

@implementation UIImage (CropFaceOutOfImage)

+ (UIImage *)cropFaceFromImage:(UIImage *)image
{
    CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIDetector *faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace
                                                  context:nil
                                                  options:@{CIDetectorAccuracyHigh: CIDetectorAccuracy}];
    
    CIFaceFeature *facialFeatures = [[faceDetector featuresInImage:ciImage] lastObject];
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], facialFeatures.bounds);
    
    return [UIImage imageWithCGImage:imageRef];
}


@end
