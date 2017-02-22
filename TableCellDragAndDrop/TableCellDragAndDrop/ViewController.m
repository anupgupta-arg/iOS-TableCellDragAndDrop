//
//  ViewController.m
//  TableCellDragAndDrop
//
//  Created by Gupta on 2/22/17.
//  Copyright © 2017 anup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *NameArray;
}

@property (weak, nonatomic) IBOutlet UITableView *NameListTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _NameListTableView.delegate=self;
    _NameListTableView.dataSource=self;
    
    NameArray=[NSMutableArray arrayWithObjects:@"Apple", @"Banana", @"Chiku", @"Mango", @"Grapes",@"kiwi", @"pineapple", @"orange",@"water melon",@"musk melon", @"pomegranate", nil];
                        
    
    
    [self.NameListTableView setEditing:YES animated:YES];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return NameArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"NameCell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell!=nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    
    NSString *abc=[NameArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text=abc;

    
    return cell;
    
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [NameArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    
    [self.NameListTableView reloadData];
}
@end
