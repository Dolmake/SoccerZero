//
//  DLMKPlayerDescriptorTableViewController.m
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//

#import "DLMKPlayerDescriptorTableViewController.h"
#import "DLMKPlayerDescriptor.h"
#import "DLMKPlayerTableViewCell.h"
#import "DLMKPlayerNameTableViewCell.h"

@interface DLMKPlayerDescriptorTableViewController ()



@end



//----We define a CustomCell for the differents types of cell------
@interface CustomCell : NSObject

@property (nonatomic, strong) id cellClass;

@end
@implementation CustomCell : NSObject

+(instancetype) customCellClassWith: (id) cellClass{
    CustomCell* cell = [[self alloc]init];
    if (cell ){
        [cell setCellClass:cellClass];
    }
    return cell;
}

-(CGFloat) height{
    return [self.cellClass height];
}
-(NSString*) cellId{
    return [self.cellClass cellId];
}

-(NSString*) description{
    return [NSString stringWithFormat:@"cellClass Type: %@", _cellClass];
}

@end
//-----End CustomCell-----------

@implementation DLMKPlayerDescriptorTableViewController


NSArray* _customCellCollection = nil;


#pragma mark - Init

-(id) initWithPlayerDescriptor: (DLMKPlayerDescriptor*) playerDescriptor{
    if (self = [super init]){
        _playerDescriptorModel = playerDescriptor;
        self.title = playerDescriptor.name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Register the proper cells
    [self registerNibs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_customCellCollection count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [_customCellCollection[indexPath.row] height];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section;
    id cellType = _customCellCollection[section];
    return [self buildCell:[cellType cellClass] tableView:tableView ];
    
}


#pragma mark - Misc
-(void) registerNibs{
       _customCellCollection = @[
                   [CustomCell customCellClassWith:[DLMKPlayerNameTableViewCell class]],
                   [CustomCell customCellClassWith:[DLMKPlayerTableViewCell class]]
                   ];
    
    for (id cell in _customCellCollections) {
        [self registerNib:[cell cellClass]];
    }
    
}

-(void) registerNib: (id)type{
    
    NSString* typeName = NSStringFromClass(type);
    //NSString* typeName =NSStringize(type);
    UINib *nameNib = [ UINib nibWithNibName:typeName bundle:[NSBundle mainBundle] ];
    
    NSString* reusableId = [type performSelector:@selector(cellId)];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:reusableId];
}

-(UITableViewCell*) buildCell:(id)cellClass tableView:( UITableView*) tableView {
    
    NSString* reusableId = [cellClass performSelector:@selector(cellId)];
    UITableViewCell* result = [tableView dequeueReusableCellWithIdentifier:reusableId];
    
    [result setValue:self.playerDescriptorModel forKey:@"playerDescriptorModel"];
    
    return result;
}



@end
















