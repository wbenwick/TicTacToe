//
//  FLXViewController.m
//  TicTacToe
//
//  Created by Administrator on 3/15/14.
//  Copyright (c) 2014 FileLogix. All rights reserved.
//

#import "FLXViewController.h"

@interface FLXViewController ()
@property (strong, nonatomic) IBOutlet UILabel *myLabelOne;

@property (strong, nonatomic) IBOutlet UILabel *myLabelTwo;
@property (strong, nonatomic) IBOutlet UILabel *myLabelThree;
@property (strong, nonatomic) IBOutlet UILabel *myLabelFour;
@property (strong, nonatomic) IBOutlet UILabel *myLabelFive;
@property (strong, nonatomic) IBOutlet UILabel *myLabelSix;
@property (strong, nonatomic) IBOutlet UILabel *myLabelSeven;
@property (strong, nonatomic) IBOutlet UILabel *myLabelEight;
@property (strong, nonatomic) IBOutlet UILabel *myLabelNine;
@property (strong, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (strong, nonatomic) IBOutlet NSString *currentPlayer;


@end

@implementation FLXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // X always goes first
    self.currentPlayer = @"X";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer*)tapGestureRecognizer
{
    NSLog(@"Label Tapped.");
    UILabel* myLabel = [self findLabelUsingPoint:[tapGestureRecognizer locationInView:self.view]];
    if (myLabel) {
        if ([self.currentPlayer  isEqual: @"X"]) {
            myLabel.textColor = [UIColor redColor];
            myLabel.text = @"X";
            myLabel.alpha=1.0f;
            self.currentPlayer = @"O";
        }
        else {
            myLabel.textColor = [UIColor blueColor];
            myLabel.text = @"O";
            myLabel.alpha = 1.0f;
            self.currentPlayer = @"X";
        }
    }
    
}

- (UILabel*)findLabelUsingPoint:(CGPoint)point
{
    NSLog(@"Find Labels Using Point: %f,%f", point.x, point.y);

    if (CGRectContainsPoint(self.myLabelOne.frame, point)) {
        NSLog(@"Label One");
        return self.myLabelOne;
    }
    else if (CGRectContainsPoint(self.myLabelTwo.frame, point)) {
        NSLog(@"Label Two");
        return self.myLabelTwo;
    }
    else if (CGRectContainsPoint(self.myLabelThree.frame, point)) {
        NSLog(@"Label Three");
        return self.myLabelThree;
    }
    else if (CGRectContainsPoint(self.myLabelFour.frame, point)) {
        NSLog(@"Label Four");
        return self.myLabelFour;
    }
    else if (CGRectContainsPoint(self.myLabelFive.frame, point)) {
        NSLog(@"Label Five");
        return self.myLabelFive;
    }
    else if (CGRectContainsPoint(self.myLabelSix.frame, point)) {
        NSLog(@"Label Six");
        return self.myLabelSix;
    }
    else if (CGRectContainsPoint(self.myLabelSeven.frame, point)) {
        NSLog(@"Label Seven");
        return self.myLabelSeven;
    }
    else if (CGRectContainsPoint(self.myLabelEight.frame, point)) {
        NSLog(@"Label Eight");
        return self.myLabelEight;
    }
    else if (CGRectContainsPoint(self.myLabelNine.frame, point)) {
        NSLog(@"Label Nine");
        return self.myLabelNine;
    }
    return nil;
}


@end
