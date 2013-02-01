//
//  ViewController.m
//  LotteryDemo
//
//  Created by da zhan on 13-1-31.
//  Copyright (c) 2013年 da zhan. All rights reserved.
//

#import "ViewController.h"
#import "ScrachViewController.h"


@interface ViewController (){
    UILabel* LotteryLabel;
    NSMutableArray *luckNumber;
    ScrachViewController *scratchViewController;
    UIView* scratchView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Default.png"]];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *generatorButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    generatorButton.frame=CGRectMake(110, 380,104, 31);
    [generatorButton  setImage:[UIImage imageNamed:@"button_nomail.png"] forState:UIControlStateHighlighted];
    [generatorButton  setImage:[UIImage imageNamed:@"button_highlight.png"] forState:UIControlStateNormal];
    [generatorButton addTarget:self action:@selector(generatorNumber) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:generatorButton];
    
    
    UILabel* generatorLabel=[[UILabel alloc]initWithFrame:CGRectMake(40, 60,120, 40)];
    generatorLabel.text=@"中将号码:";
    generatorLabel.font=[UIFont systemFontOfSize:24];
    generatorLabel.textColor=[UIColor whiteColor];
    generatorLabel.backgroundColor=[UIColor clearColor];
    [self.view addSubview:generatorLabel];
    [generatorLabel release];
    
    
    LotteryLabel=[[UILabel alloc]initWithFrame:CGRectMake(generatorLabel.frame.origin.x+generatorLabel.frame.size.width, 60,200, 40)];
    LotteryLabel.text=@"0";
    LotteryLabel.font=[UIFont systemFontOfSize:24];
    LotteryLabel.textColor=[UIColor whiteColor];
    LotteryLabel.backgroundColor=[UIColor clearColor];
    [self.view addSubview:LotteryLabel];
    [LotteryLabel release];
    
    luckNumber=[[NSMutableArray alloc]init];
    
    scratchViewController =[[ScrachViewController alloc] initWithNibName:@"ScratchViewClear" bundle:nil];
    scratchView = scratchViewController.view;
    [scratchViewController setImageNamed:@"mohu.png"];
    [scratchView setFrame:CGRectMake(110,-10,200,200)];
    [self.view addSubview:scratchView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
 
}

-(void)dealloc{
    [luckNumber release];
    [scratchViewController release];
    [super dealloc];
}


-(void)generatorNumber{
    
    [scratchViewController setImageNamed:@"mohu.png"];
    
    int a= arc4random()%10000;
    if ([luckNumber count]==0){
        
        [luckNumber addObject:[NSString stringWithFormat:@"%d",a]];
        LotteryLabel.text=[NSString stringWithFormat:@"%d",(a+1)];
        return ;
    }
    else {
            for (int i=0; i<[luckNumber count]; i++) {
            if (a==[[luckNumber objectAtIndex:i] intValue])
            {
                [self generatorNumber];
            }else{
                [luckNumber addObject:[NSString stringWithFormat:@"%d",a]];
                LotteryLabel.text=[NSString stringWithFormat:@"%d",(a+1)];
                return;
            }
        }
    }
}

@end
