//
//  ViewController.m
//  MyOtherTicTacToe
//
//  Created by Jaime Hernandez on 3/14/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"

#define ME  @"X"
#define YOU @"O"

@interface ViewController ()

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

@property (strong, nonatomic)NSString* whosTurn;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.whosTurn = ME;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer {
    
    CGPoint tappedPoint    = [tapGestureRecognizer locationInView:self.view];
    UILabel *isLabelTapped = [self findMyLabelUsingPoint:tappedPoint];
    
    
    // Is this a real game button?
    
    if (isLabelTapped.tag != 999 && [isLabelTapped.text isEqualToString:@""])
    {
        // Send to get the label painted & players switched
        
        isLabelTapped.text = self.whosTurn;
        [self drawTheTicTacToeBoardSwitchTurns:isLabelTapped];
    }
}

-(UILabel *)findMyLabelUsingPoint:(CGPoint)point
{
    // Determine which frame in the view and return it
    
    for (UILabel *label in self.view.subviews)
    {
        if (CGRectContainsPoint(label.frame, point))
        {
            return label;
        }
    }
    return nil;
}

-(void)drawTheTicTacToeBoardSwitchTurns:(UILabel *)label
{
    // Painting the screen and switching players
    
    if ([self.whosTurn  isEqual: ME])
    {
        label.textColor = [UIColor blueColor];
        self.whichPlayerLabel.text = @"X";
        self.whosTurn = YOU;
    }
    else
    {
        label.textColor = [UIColor redColor];
        self.whichPlayerLabel.text = @"O";
        self.whosTurn = ME;
    }
    
    [self whoWon];
//    [self whoWon:self.whichPlayerLabel.text];
}

- (NSString *)whoWon
{
    NSLog(@"%@, %@, %@", self.myLabelOne.text,   self.myLabelTwo.text,   self.myLabelThree.text);
    NSLog(@"%@, %@, %@", self.myLabelFour.text,  self.myLabelFive.text,  self.myLabelSix.text);
    NSLog(@"%@, %@, %@", self.myLabelSeven.text, self.myLabelEight.text, self.myLabelNine.text);
    
    // Need to add the column winning combinations....
    // Also need to determine how to pass the player back, end game and call it a day..
    
    
    if (([self.myLabelOne.text  isEqualToString:@"X"] && [self.myLabelTwo.text  isEqualToString:@"X"] && [self.myLabelThree.text isEqualToString:@"X"]) ||
        ([self.myLabelFour.text  isEqualToString:@"X"] &&  [self.myLabelFive.text isEqualToString:@"X"] && [self.myLabelSix.text   isEqualToString:@"X"]) ||
        ([self.myLabelSeven.text isEqualToString:@"X" ] && [self.myLabelEight.text isEqualToString:@"X"] && [self.myLabelNine.text isEqualToString:@"X"]) ||
        ([self.myLabelOne.text    isEqualToString:@"X"] && [self.myLabelFive.text isEqualToString:@"X"] && [self.myLabelNine.text isEqualToString:@"X"]) || ([self.myLabelThree.text isEqualToString:@"X"] && [self.myLabelFive.text isEqualToString:@"X"] && [self.myLabelSeven.text isEqualToString:@"X"]))
    {
        return @"X";
    }
    
    else if (([self.myLabelOne.text  isEqualToString:@"Y"] && [self.myLabelTwo.text  isEqualToString:@"Y"] && [self.myLabelThree.text isEqualToString:@"Y"]) ||
        ([self.myLabelFour.text  isEqualToString:@"Y"] &&  [self.myLabelFive.text isEqualToString:@"Y"] && [self.myLabelSix.text   isEqualToString:@"Y"]) ||
        ([self.myLabelSeven.text isEqualToString:@"Y" ] && [self.myLabelEight.text isEqualToString:@"Y"] && [self.myLabelNine.text isEqualToString:@"Y"]) ||
        ([self.myLabelOne.text    isEqualToString:@"Y"] && [self.myLabelFive.text isEqualToString:@"Y"] && [self.myLabelNine.text isEqualToString:@"Y"]) || ([self.myLabelThree.text isEqualToString:@"Y"] && [self.myLabelFive.text isEqualToString:@"Y"] && [self.myLabelSeven.text isEqualToString:@"Y"]))
    {
        return @"Y";
    }
    else
    {
        return nil;
    }
    
}
@end
