//
//  ViewController.m
//  zhaKaicell
//
//  Created by kuanter on 16/4/25.
//  Copyright © 2016年 kuanter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property BOOL isOpen;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString*cellId=@"cellId";
    UITableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text=@"孙少伟";
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.row==5) {
        if (_isOpen) {
            UITableViewCell*cell=[tableView cellForRowAtIndexPath:indexPath];
            cell.backgroundColor=[UIColor whiteColor];
            _isOpen=!_isOpen;
        }else{
            UITableViewCell*cell=[tableView cellForRowAtIndexPath:indexPath];
            cell.backgroundColor=[UIColor yellowColor];
            _isOpen=!_isOpen;
        }
        
        NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
        
        //记下选中的索引
        
        //刷新
        [tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    if (indexPath.row==5) {
        if (_isOpen) {
            return 44;
        }else{
         return 100;
        }
        
       
    }else
            return 44;
  
}
@end
