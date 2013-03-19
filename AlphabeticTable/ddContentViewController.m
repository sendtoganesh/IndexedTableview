
#import "ddContentViewController.h"

@implementation ddContentViewController

@synthesize tableViewHeader;
@synthesize indexTableView;
@synthesize sectionArray;
@synthesize collation;

-(void)dealloc
{
    self.tableViewHeader = nil;
    self.indexTableView = nil;
    self.sectionArray = nil;
    self.collation = nil;
}

-(void)viewDidLoad
{
    self.collation = [UILocalizedIndexedCollation currentCollation];
    
    self.tableViewHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 500, 75)];
    tableViewHeader.backgroundColor = [UIColor purpleColor];
    tableViewHeader.text = @"BRAND";
    [self.view addSubview:tableViewHeader];
    
    
    self.indexTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.tableViewHeader.frame.size.height, 500, 550) style:UITableViewStylePlain];
    //self.indexTableView.backgroundColor = [UIColor yellowColor];
    self.indexTableView.separatorColor = [UIColor redColor];
    self.indexTableView.delegate = self;
    self.indexTableView.dataSource = self;
    
    [self.view addSubview:self.indexTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 26;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%i%i",indexPath.section,indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //NSInteger Section = [indexPath section];
    
    for(UIView *view in [tableView subviews])
    {
        if([[[view class] description] isEqualToString:@"UITableViewIndex"])
        {
            
            //[view setBackgroundColor:[UIColor blueColor]];
            
            // [view setFont:[UIFont systemFontOfSize:14]];
        }
    }
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %i",indexPath.row];
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[collation sectionTitles] count];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // return [self.sectionArray objectAtIndex:section];
    return [[collation sectionTitles] objectAtIndex:section];
}



- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    //return [self.sectionArray sectionIndexTitles];
    
    return [collation sectionIndexTitles];
    
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [collation sectionForSectionIndexTitleAtIndex:index];
}


//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//	[tableView deselectRowAtIndexPath:indexPath animated:YES];
//}


#pragma mark -- UITableViewDelegate Delegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected Section %i %i",indexPath.section,indexPath.row);
}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UILabel *tableViewHeader = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 500, 500)];
//    tableViewHeader.backgroundColor = [UIColor purpleColor];
//    tableViewHeader.text = @"NARROW RESULTS";
//    return tableViewHeader;
//}

@end
