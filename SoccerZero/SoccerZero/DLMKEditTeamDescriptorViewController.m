//
//  DLMKTeamDescriptorViewController.m
//  SoccerZero
//
//  Created by Daniel on 18/02/15.
//  Copyright (c) 2015 Dolmake. All rights reserved.
//


#import "DLMKEditTeamDescriptorViewController.h"
#import "DLMKCustomCellTypeCollection.h"
#import "DLMKPlayerDescriptor.h"
#import "DLMKPlayerDescriptorCollectionViewCell.h"
#import "DLMKPhotoViewController.h"
#import "DLMKTeamDescriptor.h"
#import "DLMKEditTeamCollectionViewCell.h"
#import "DLMKEditPlayerDescriptorTableViewController.h"
#import "DLMKDefaultCollectionLayout.h"

#import "DLMKOnTakePhotoDelegate.h"
#import "MACROS.h"

@interface DLMKEditTeamDescriptorViewController ()

@property (nonatomic,strong) DLMKCustomCellTypeCollection* customCells;

@property (nonatomic,strong) DLMKDefaultCollectionLayout *layout;

@end

@implementation DLMKEditTeamDescriptorViewController

#pragma martk - Properties
-(DLMKDefaultCollectionLayout*) layout{
    if (!_layout)
        _layout = [DLMKDefaultCollectionLayout new];
    return _layout;
}

-(void) setTeamDescriptorModel:(DLMKTeamDescriptor *)teamDescriptorModel{
    _teamDescriptorModel = teamDescriptorModel;
    self.txtName.text = _teamDescriptorModel.name;
}

#pragma mark - Init
-(id) init{
    
    if (self = [super init]){
        
        _customCells = [DLMKCustomCellTypeCollection customCellTypeCollectionWithArray:@[[DLMKPlayerDescriptorCollectionViewCell class]]];
    }
    return self;
    
}


#pragma  mark - Instance methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.collectionViewLayout = self.layout;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.txtName.delegate = self;
    
    self.collectionView.backgroundColor = self.layout.backGroundColor;
    [self.customCells registerNibsForCollectionView:self.collectionView];
    self.layout.itemSize = [self.customCells cellSizeForIndex:0];
    
    UIBarButtonItem *addPlayerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer:)];
    self.navigationItem.rightBarButtonItem = addPlayerButton;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self ];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //Observe device orientation
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didRotateDeviceChangeNotification:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];    
    
    self.txtName.text = _teamDescriptorModel.name;
    [self.collectionView reloadData];
    __DLMK_NSLOG_DESCRIPTION__
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [[self.customCells arrayOfClasses]count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.teamDescriptorModel countPlayers];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = nil;
    DLMKPlayerDescriptorCollectionViewCell *cellPlayerDescriptor = (DLMKPlayerDescriptorCollectionViewCell*)[self.customCells cellForCollectionView:self.collectionView atIndexPath:indexPath ];
        cellPlayerDescriptor.playerDescriptorModel = [self.teamDescriptorModel playerAtRow:indexPath.row];
        cell = cellPlayerDescriptor;
    cellPlayerDescriptor.delegate = self;
    return cell;
}



#pragma mark - UICollectionViewDelegate

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Show the PhotoViewController
    DLMKEditPlayerDescriptorTableViewController *playerVC = [[DLMKEditPlayerDescriptorTableViewController alloc] initWithPlayerDescriptor:[self.teamDescriptorModel playerAtRow:indexPath.row]];
    
    [self.navigationController pushViewController:playerVC animated:YES];
    
    /*
    DLMKEditPlayerDescriptorViewController *playerVC = [[DLMKEditPlayerDescriptorViewController alloc]initWithPlayerDescriptor:[self.teamDescriptorModel playerAtRow:indexPath.row] ];
    
    [self.navigationController pushViewController:playerVC animated:YES];
     */
    
}


#pragma mark - UITextFieldDelegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    // Valimos el texto y si está bien, entonces...
    [self.txtName resignFirstResponder];
    return YES;
}

#pragma mark - Actions
-(void)addPlayer:(id)sender{
    [self.teamDescriptorModel addPlayerWithName:@"Unnamed" number:0 ];
    [self updateControls];
}

-(void) didTxtNameChanged:(id)sender{
    self.teamDescriptorModel.name = ((UITextField*)sender).text;
    // Hidding the Keyboard.
    [self.view endEditing:YES];
}

-(IBAction)onTouchUp:(id)sender{
    [self didTxtNameChanged:self.txtName];
}

#pragma mark - DLMKOnTakePhotoDelegate
-(void)onTakePhoto:(id)sender{
    DLMKPhotoContainer* photoContainer = ((DLMKPlayerDescriptorCollectionViewCell*) sender).playerDescriptorModel.photoContainer;
    
    DLMKPhotoViewController *photoVC = [[DLMKPhotoViewController alloc] initWithModel:photoContainer];
    [self.navigationController pushViewController:photoVC animated:YES];
}

#pragma mark - Device Orientation
-(void)didRotateDeviceChangeNotification:(NSNotification *)notification
{
    [self updateControls];
}

#pragma mark - Misc
-(void) updateControls{
    self.layout.itemSize = [self.customCells cellSizeForIndex:0];
    [self.collectionView reloadData];
}





@end






