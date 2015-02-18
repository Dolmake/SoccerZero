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



@implementation DLMKPlayerDescriptorTableViewController


NSArray* _classPerSections = nil;

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
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return [_classPerSections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    id cell = [_classPerSections objectAtIndex:indexPath.section ];
    return [self buildCell:cell tableView:tableView ];
    
}


#pragma mark - Misc
-(void) registerNibs{
    _classPerSections = @[[DLMKPlayerNameTableViewCell class],[DLMKPlayerTableViewCell class]];
    
    for (id class in _classPerSections) {
        [self registerNib:class];
    }
    
}

-(void) registerNib: (id)type{
    
    NSString* typeName = NSStringFromClass(type);
    //NSString* typeName =NSStringize(type);
    UINib *nameNib = [ UINib nibWithNibName:typeName bundle:[NSBundle mainBundle] ];
    
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[type performSelector:@selector(cellId)]];
}

-(UITableViewCell*) buildCell:(id)type tableView:( UITableView*) tableView {
    
    NSString* reusableId = [type performSelector:@selector(cellId)];
    UITableViewCell* result = [tableView dequeueReusableCellWithIdentifier:reusableId];
    
    [result setValue:self.playerDescriptorModel forKey:@"playerDescriptorModel"];
    
    return result;
}



@end
















