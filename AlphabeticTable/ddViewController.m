
#import "ddViewController.h"
#import "ddContentViewController.h"

@interface ddViewController ()

@end

@implementation ddViewController

@synthesize button;
@synthesize popOver;

-(void)dealloc
{
    self.button = nil;
    self.popOver = nil;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //self.collation = [UILocalizedIndexedCollation currentCollation];
    
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [self.button setTitle:@"Click here" forState:UIControlStateNormal];
    self.button.frame = CGRectMake(100, 100, 200, 75);
    self.button.backgroundColor = [UIColor magentaColor];
    
    [self.button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:button];
    
    //self.sectionArray = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    
    
}



#pragma mark -- Narrow Results Button Handler

-(IBAction)buttonPressed:(id)sender
{
    UIButton *button = (UIButton *)sender;
    ddContentViewController *contentViewController = [[ddContentViewController alloc] init];
    self.popOver = [[UIPopoverController alloc] initWithContentViewController:contentViewController];
    self.popOver.delegate = self;
    self.popOver.popoverContentSize = CGSizeMake(500, 620);
    if (![self.popOver isPopoverVisible]) {
          [popOver presentPopoverFromRect:button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
  
    
    NSLog(@"buttonPressed");
}


@end
