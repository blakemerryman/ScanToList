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

    // TODO: Set up highlighter here
    // TODO: Set up label here

    // CAPTURE SESSION
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
    
    // TODO: more highlighter stuff here
    // TODO: more label stuff here
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
