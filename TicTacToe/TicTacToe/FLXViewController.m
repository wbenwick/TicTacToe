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
@property (strong, nonatomic) IBOutlet NSString *winner;
@property (strong, nonatomic) IBOutlet NSNumber *numberOfMoves;

@property BOOL gameOver;
@property (strong, nonatomic) IBOutlet UIButton *resetButton;


@end

@implementation FLXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // X always goes first
    self.currentPlayer = @"X";
    [self resetGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer*)tapGestureRecognizer
{
    NSLog(@"Label Tapped.");
    if (!self.gameOver) {
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
        
        self.winner = [self whoWon];
        if (self.winner) {
            self.whichPlayerLabel.text = [NSString stringWithFormat:@"Player %@ Has WON! The Game Is Over... See Ryan For Your Prize.",self.winner];
            [self.whichPlayerLabel sizeToFit];
            self.whichPlayerLabel.alpha = 1.0f;
            self.resetButton.alpha = 1.0f;
            self.gameOver = YES;
            
    //        [self resetGame];

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

- (NSString*)whoWon
{
    
    // Logic here is simple, will make 2 passes, one for X, the other for O
    // If either player has a combination of the following boxes marked respectively, they win
    // Combo 1 - any line across (labels 1,2,3) or (labels 4,5,6) or labels(7,8,9)
    // Combo 2 - any line down (labels 1,4,7) or labels (2,5,8) or labels (3,6,9)
    // Combo 3 - any line diagonal (labels 1,5,9) or labels (3,5,7)
    
    // Winning Combo 1
    
    if ([self.myLabelOne.text isEqual: @"X"]) {
        if ([self.myLabelTwo.text isEqual: @"X"]) {
            if ([self.myLabelThree.text isEqual: @"X"]) {
                return @"X";
            }
        }
    }

    else if ([self.myLabelFour.text isEqual: @"X"]) {
        if ([self.myLabelFive.text isEqual: @"X"]) {
            if ([self.myLabelSix.text isEqual: @"X"]) {
                return @"X";
            }
        }
    }
    
    else if ([self.myLabelSeven.text isEqual: @"X"]) {
        if ([self.myLabelEight.text isEqual: @"X"]) {
            if ([self.myLabelNine.text isEqual: @"X"]) {
                return @"X";
            }
        }
    }

    // Winning Combo 2
    
    if ([self.myLabelOne.text isEqual: @"X"]) {
        if ([self.myLabelFour.text isEqual: @"X"]) {
            if ([self.myLabelSeven.text isEqual: @"X"]) {
                return @"X";
            }
        }
    }
    
    else if ([self.myLabelTwo.text isEqual: @"X"]) {
        if ([self.myLabelFive.text isEqual: @"X"]) {
            if ([self.myLabelEight.text isEqual: @"X"]) {
                return @"X";
            }
        }
    }
    
    else if ([self.myLabelThree.text isEqual: @"X"]) {
        if ([self.myLabelSix.text isEqual: @"X"]) {
            if ([self.myLabelNine.text isEqual: @"X"]) {
                return @"X";
            }
        }
    }
    
    // Winning Combo 3
    
    if ([self.myLabelOne.text isEqual: @"X"]) {
        if ([self.myLabelFive.text isEqual: @"X"]) {
            if ([self.myLabelNine.text isEqual: @"X"]) {
                return @"X";
            }
        }
    }
    
    else if ([self.myLabelThree.text isEqual: @"X"]) {
        if ([self.myLabelFive.text isEqual: @"X"]) {
            if ([self.myLabelSeven.text isEqual: @"X"]) {
                return @"X";
            }
        }
    }

    
    // Winning Combon 1 for "O"
    
    if ([self.myLabelOne.text isEqual: @"O"]) {
        if ([self.myLabelTwo.text isEqual: @"O"]) {
            if ([self.myLabelThree.text isEqual: @"O"]) {
                return @"O";
            }
        }
    }
    
    else if ([self.myLabelFour.text isEqual: @"O"]) {
        if ([self.myLabelFive.text isEqual: @"O"]) {
            if ([self.myLabelSix.text isEqual: @"O"]) {
                return @"O";
            }
        }
    }
    
    else if ([self.myLabelSeven.text isEqual: @"O"]) {
        if ([self.myLabelEight.text isEqual: @"O"]) {
            if ([self.myLabelNine.text isEqual: @"O"]) {
                return @"O";
            }
        }
    }
    
    // Winning Combo 2
    
    if ([self.myLabelOne.text isEqual: @"O"]) {
        if ([self.myLabelFour.text isEqual: @"O"]) {
            if ([self.myLabelSeven.text isEqual: @"O"]) {
                return @"O";
            }
        }
    }
    
    else if ([self.myLabelTwo.text isEqual: @"O"]) {
        if ([self.myLabelFive.text isEqual: @"O"]) {
            if ([self.myLabelEight.text isEqual: @"O"]) {
                return @"O";
            }
        }
    }
    
    else if ([self.myLabelThree.text isEqual: @"O"]) {
        if ([self.myLabelSix.text isEqual: @"O"]) {
            if ([self.myLabelNine.text isEqual: @"O"]) {
                return @"O";
            }
        }
    }
    
    // Winning Combo 3
    
    if ([self.myLabelOne.text isEqual: @"O"]) {
        if ([self.myLabelFive.text isEqual: @"O"]) {
            if ([self.myLabelNine.text isEqual: @"O"]) {
                return @"O";
            }
        }
    }
    
    else if ([self.myLabelThree.text isEqual: @"O"]) {
        if ([self.myLabelFive.text isEqual: @"O"]) {
            if ([self.myLabelSeven.text isEqual: @"O"]) {
                return @"O";
            }
        }
    }
    
    
    return nil;
}

- (void)resetGame
{
    self.myLabelOne.text = @"";
    self.myLabelTwo.text = @"";
    self.myLabelThree.text = @"";
    self.myLabelFour.text = @"";
    self.myLabelFive.text = @"";
    self.myLabelSix.text = @"";
    self.myLabelSeven.text = @"";
    self.myLabelEight.text = @"";
    self.myLabelNine.text = @"";
    
    self.gameOver = NO;
    
    self.resetButton.alpha = 0.0f;
    
    self.whichPlayerLabel.text = @"Player X goes first.";
}
- (IBAction)resetButtonPressed:(id)sender {
    
    [self resetGame];
    
}

@end
