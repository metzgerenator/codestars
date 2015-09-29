//
//  ViewController.m
//  FlickrSearch
//
//  Created by Aileen Taboy on 9/29/15.
//  Copyright © 2015 Mike. All rights reserved.
//

#import "ViewController.h"
#import "Flickr.h"
#import "FlickrPhoto.h"
#import "FlickrPhotoCell.h"

@interface ViewController () <UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, weak) IBOutlet UIToolbar *toolbar;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *shareButton;
@property(nonatomic, weak) IBOutlet UITextField *textField;

//outlet for collectionView
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;  

-(IBAction)shareButtonTapped:(id)sender;

@property(nonatomic, strong)NSMutableDictionary *searchResults;
@property(nonatomic, strong)NSMutableArray *searches;
@property(nonatomic,strong) Flickr *flickr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_cork.png"]];
    UIImage *navBarImage = [[UIImage imageNamed:@"navbar.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(27, 27, 27, 27)];
    
    [self.toolbar setBackgroundImage:navBarImage forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    
    UIImage *shareButtonImage = [[UIImage imageNamed:@"button.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
    
    [self.shareButton setBackButtonBackgroundImage:shareButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    UIImage *textFieldImage = [[UIImage imageNamed:@"search_field.png"]resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    [self.textField setBackground:textFieldImage];  
    
    //initialize properties
    
    self.searches = [@[]mutableCopy];
    self.searchResults= [@{}mutableCopy];
    self.flickr = [[Flickr alloc]init];
    
    //reload data
    [self.collectionView reloadData];  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)shareButtonTapped:(id)sender{
    
}

#pragma mark - UITextFieldDelegate methods
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    //1
    
    [self.flickr searchFlickrForTerm:textField.text completionBlock:^(NSString *searchTerm, NSArray *results, NSError *error){
        if(results && [results count] >0){
            //2
            
            if(![self.searches containsObject:searchTerm]){
                NSLog(@"Found %ld photos matching %@", [results count], searchTerm);
                [self.searches insertObject:searchTerm atIndex:0];
                self.searchResults[searchTerm] = results; }
            //3
            dispatch_async(dispatch_get_main_queue(), ^{
                //Placeholder: reload collectionview data
            });
            
        } else{ //1
            NSLog(@"Error searching Flickr: %@", error.localizedDescription);
            
        }}];
    [textField resignFirstResponder];
    return YES;
        }
        
    
#pragma mark - UICollectionView Datasource  
//1
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSString *searchTerm = self.searches[section];
    return [self.searchResults[searchTerm]count];
}

//2
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return [self.searches count];
}

//3

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FlickrPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FlickrCell " forIndexPath:indexPath];
    NSString *searchTerm = self.searches[indexPath.section];
    cell.photo = self.searchResults[searchTerm][indexPath.row];  
    
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

/*- (UICollectionReusableView *)collectionView:
 (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
 {
 return [[UICollectionReusableView alloc] init];
 }*/

#pragma mark - UICollectionViewDelegate  
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //TODO: Select Item
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    //TODO: Deselect item
}


#pragma mark - UICollectionViewDelegateFlowLayout  
//1
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *searchTerm = self.searches[indexPath.section]; FlickrPhoto *photo = self.searchResults[searchTerm][indexPath.row];
    //2
    CGSize retval = photo.thumbnail.size.width >0 ? photo.thumbnail.size: CGSizeMake(100, 100);
    retval.height += 35; retval.width += 35; return  retval;
    
}

//3
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(50, 20, 50, 20);
}


@end
