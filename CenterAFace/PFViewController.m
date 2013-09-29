//
//  PFViewController.m
//  CenterAFace
//
//  Created by Peter Foti on 9/29/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import "PFViewController.h"
#import "UIImage+ScaleImageToSize.h"

@interface PFViewController ()

@end

@implementation PFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *resizedImage = [UIImage imageWithImage:[UIImage imageNamed:@"smile2.jpg"] scaledToSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height)];

    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:resizedImage];
//    [self.view addSubview:imageView];
    
    CIImage *ciImage = [CIImage imageWithCGImage:resizedImage.CGImage];
    
    CIDetector *faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace
                                                  context:nil
                                                  options:@{CIDetectorAccuracyHigh: CIDetectorAccuracy}];
    
    CIFaceFeature *facialFeatures = [[faceDetector featuresInImage:ciImage] lastObject];
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([resizedImage CGImage], facialFeatures.bounds);
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageWithCGImage:imageRef]];
    imageView2.center = self.view.center;
    [self.view addSubview:imageView2];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
@end
