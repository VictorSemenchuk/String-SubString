//
//  ViewController.m
//  StringSubStringTask
//
//  Created by Victor Macintosh on 14/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "ViewController.h"
#import "Parser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Parser *parser = [[Parser alloc] init];
    
    [parser setInput:@"Prime Minister <Narendra Modi> tweeted a <link> to the speech (Human Resource Development Minister Smriti Irani) <made> in the Lok Sabha during the ((debate) on the ongoing JNU row) and the suicide of Dalit scholar Rohith Vemula at the [Hyderabad Central University]."];
    NSLog(@"%@", [parser output]);
    
    [parser setInput:@"Lorem <(ipsum [dolor <sit] amet), consectetur adipiscing elit>. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet>. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget (nulla. Class aptent <taciti [sociosqu ad] litora torquent per conubia> nostra), per inceptos himenaeos."];
    NSLog(@"%@", [parser output]);
    
    [parser release];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
