
#import "ddViewController.h"
#import "ddContentViewController.h"

@interface ddViewController ()

@end

@implementation ddViewController

@synthesize narrowResultButton;
@synthesize narrowResultPopOver;

-(void)dealloc
{
    self.narrowResultButton = nil;
    self.narrowResultPopOver = nil;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"BRANDS";
    
    //self.collation = [UILocalizedIndexedCollation currentCollation];
    
    
    self.narrowResultButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [self.narrowResultButton setTitle:@"Narrow Results" forState:UIControlStateNormal];
    self.narrowResultButton.frame = CGRectMake(100, 100, 200, 75);
    self.narrowResultButton.backgroundColor = [UIColor magentaColor];
    
    [self.narrowResultButton addTarget:self action:@selector(narrowResultbuttonPressed:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:narrowResultButton];
    
    //self.sectionArray = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
    
    
}



#pragma mark -- Narrow Results Button Handler

-(IBAction)narrowResultbuttonPressed:(id)sender
{
    UIButton *button = (UIButton *)sender;
    ddContentViewController *contentViewController = [[ddContentViewController alloc] init];
    self.narrowResultPopOver = [[UIPopoverController alloc] initWithContentViewController:contentViewController];
    self.narrowResultPopOver.delegate = self;
    self.narrowResultPopOver.popoverContentSize = CGSizeMake(500, 620);
    if (![self.narrowResultPopOver isPopoverVisible]) {
          [narrowResultPopOver presentPopoverFromRect:button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
  
    
    NSLog(@"narrowResultbuttonPressed");
}


@end
