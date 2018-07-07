//
//  ViewController.m
//  HJNFC
//
//  Created by whj on 2018/7/7.
//  Copyright © 2018年 whj. All rights reserved.
//

#import "ViewController.h"
#import <CoreNFC/CoreNFC.h>

@interface ViewController () <NFCNDEFReaderSessionDelegate>

@property (nonatomic, strong) NFCNDEFReaderSession *readerSession;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.readerSession = [[NFCNDEFReaderSession alloc] initWithDelegate:self queue:nil invalidateAfterFirstRead:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma Actions

- (IBAction)fetchBtnClick:(id)sender {
    
    if (NFCNDEFReaderSession.readingAvailable) {
        
        [self.readerSession beginSession];
    } else {
        NSLog(@"Device not supported NFC!!!");
    }
}

- (IBAction)invalidateBtnClick:(id)sender {
    
    [self.readerSession invalidateSession];
}

#pragma mark - NFCNDEFReaderSessionDelegate

- (void)readerSession:(NFCNDEFReaderSession *)session didInvalidateWithError:(NSError *)error {
    
    if (error) {
        NSLog(@"didInvalidateWithError: %@", error);
    } else {
        NSLog(@"Message: %@", session);
    }
}

- (void)readerSession:(NFCNDEFReaderSession *)session didDetectNDEFs:(NSArray<NFCNDEFMessage *> *)messages {
    
    NSLog(@"Message: %@", messages);
}

@end
