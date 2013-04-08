//
//  ViewController.m
//  BarCodeReader
//
//  Created by RAMESHU'Z on 04/04/13.
//  Copyright (c) 2013 RAMESHU'Z. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [imgView release];
    [txtView release];
    [btnScan release];
    [super dealloc];
}
- (IBAction)scanButtonAction:(id)sender {
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    
    [scanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];
    [self presentModalViewController: reader animated: YES];
    [reader release];
}
- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info {
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        break;
    txtView.text = symbol.data;
    imgView.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    [reader dismissModalViewControllerAnimated: YES];
}
@end
