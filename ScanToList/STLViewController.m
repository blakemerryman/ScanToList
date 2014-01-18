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

    // HIGHLIGHTER
    self.captureHighlighter = [[UIView alloc] init];
    self.captureHighlighter.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
    self.captureHighlighter.layer.borderColor = [UIColor blueColor].CGColor;
    self.captureHighlighter.layer.borderWidth = 3;
    [self.view addSubview:self.captureHighlighter];

    // LABEL
    self.captureDataLabel = [[UILabel alloc] init];
    self.captureDataLabel.frame = CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 40);
    self.captureDataLabel.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    self.captureDataLabel.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.65];
    self.captureDataLabel.textColor = [UIColor whiteColor];
    self.captureDataLabel.textAlignment = NSTextAlignmentCenter;
    self.captureDataLabel.text = @"---";
    [self.view addSubview:self.captureDataLabel];
    
    // CAPTURE SESSION SET-UP
    self.captureSession = [[AVCaptureSession alloc] init];
    self.captureDevice  = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    NSError* error = nil;
    
    // INPUT
    self.captureDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:self.captureDevice error:&error];
    
    if (self.captureDeviceInput) {
        [self.captureSession addInput:self.captureDeviceInput];
    } else {
        NSLog(@"Error: %@", error);
    }
    
    // OUTPUT
    self.captureDataOutput = [[AVCaptureMetadataOutput alloc] init];
    [self.captureDataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    [self.captureSession addOutput:self.captureDataOutput];
    self.captureDataOutput.metadataObjectTypes = [self.captureDataOutput availableMetadataObjectTypes];
    
    // PREVIEW
    self.captureInputPreview = [AVCaptureVideoPreviewLayer layerWithSession:self.captureSession];
    self.captureInputPreview.frame = self.view.bounds;
    self.captureInputPreview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [self.view.layer addSublayer:self.captureInputPreview];
    
    // START SESSION
    [self.captureSession startRunning];
    [self.view bringSubviewToFront:self.captureHighlighter];
    [self.view bringSubviewToFront:self.captureDataLabel];
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
