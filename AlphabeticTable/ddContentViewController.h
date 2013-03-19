

#import <Foundation/Foundation.h>

@interface ddContentViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,retain)  UILabel *tableViewHeader;
@property(nonatomic,retain) UITableView *indexTableView;

@property(nonatomic,retain) NSArray *sectionArray;

@property(nonatomic,retain) UILocalizedIndexedCollation *collation;

@end
