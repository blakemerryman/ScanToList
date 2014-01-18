//
//  STLViewController.m
//  ScanToList
//
//  Created by Blake Merryman on 1/17/14.
//  Copyright (c) 2014 Blake Merryman. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import "STLViewController.h"

#pragma mark - Private Interface: AVCapture Delegate
@interface STLViewController () <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic) AVCaptureSession* captureSession;
@property (nonatomic) AVCaptureDevice* captureDevice;
@property (nonatomic) AVCaptureDeviceInput* captureDeviceInput;
@property (nonatomic) AVCaptureMetadataOutput* captureDataOutput;
@property (nonatomic) AVCaptureVideoPreviewLayer* captureInputPreview;

@property (nonatomic) UIView* captureHighlighter;
@property (nonatomic) UILabel* captureDataLabel;

@end

#pragma mark - Implementation
@implementation STLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Mandatory AVCapture-Delegate Method(s).
- (void) captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    
    
    
    
}

@end
