//
//  PFViewController.m
//  CenterAFace
//
//  Created by Peter Foti on 9/29/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import "PFViewController.h"
#import "UIImage+ScaleImageToSize.h"
#import "UIImage+CropFaceOutOfImage.h"

@interface PFViewController ()

@end

@implementation PFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIImage *resizedImage = [UIImage imageWithImage:[UIImage imageNamed:@"smile4.jpg"] scaledToSize:CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height)];

    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:resizedImage];
    [self.view addSubview:imageView];
    
    
    UIImage *face = [UIImage cropFaceFromImage:resizedImage];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:face];
    imageView2.center = self.view.center;
    [self.view addSubview:imageView2];
}

@end
