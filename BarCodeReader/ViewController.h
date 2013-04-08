//
//  ViewController.h
//  BarCodeReader
//
//  Created by RAMESHU'Z on 04/04/13.
//  Copyright (c) 2013 RAMESHU'Z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface ViewController : UIViewController<ZBarReaderDelegate> {
    
    IBOutlet UIImageView *imgView;
    IBOutlet UITextView *txtView;
    IBOutlet UIButton *btnScan;
}

- (IBAction)scanButtonAction:(id)sender;

@end
