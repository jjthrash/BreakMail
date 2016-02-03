//
//  ViewController.m
//  BreakMail
//
//  Created by James Thrasher on 2016/02/03.
//  Copyright © 2016 Brown Bird Labs, LLC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) MFMailComposeViewController *mailController;

@end

@implementation ViewController

- (IBAction)go:(id)sender {
    NSData *fileData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"myPDF.pdf" ofType:nil]];
    self.mailController = [[MFMailComposeViewController alloc] init];
    self.mailController.mailComposeDelegate = self;
    [self.mailController setSubject:@"Subject"];
    [self.mailController setMessageBody:@"Body" isHTML:YES];
    [self.mailController addAttachmentData:fileData mimeType:@"application/pdf" fileName:@"photos.pdf"];
    [self presentViewController:self.mailController animated:YES completion:nil];

}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    [self dismissViewControllerAnimated:YES completion:^{
        self.mailController = nil;
    }];
}

@end
