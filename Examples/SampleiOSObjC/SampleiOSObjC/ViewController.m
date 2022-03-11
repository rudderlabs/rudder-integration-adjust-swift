//
//  ViewController.m
//  SampleiOSObjC
//
//  Created by Pallab Maiti on 15/11/21.
//

#import "ViewController.h"

@import RudderStack;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*[[RSClient sharedInstance] track:@"daily_rewards_claim"];
    [[RSClient sharedInstance] track:@"level_up"];
    [[RSClient sharedInstance] track:@"revenue"];
    [[RSClient sharedInstance] identify:@"developer_user_id" traits:@{@"foo": @"bar", @"foo1": @"bar1"}];
    [[RSClient sharedInstance] track:@"test_event" properties:@{@"key":@"value", @"foo": @"bar"}];
    [[RSClient sharedInstance] track:@"purchase" properties:@{@"total":@2.99, @"currency": @"USD"}];
    [[RSClient sharedInstance] reset];
    NSDictionary *product1 = @{
        @"product_id" : @"product_id_1",
        @"name" : @"name_1",
        @"price" : @1000,
        @"quantity" : @100,
        @"category" : @"category_1",
        @"extra" : @"extra_1"
    };
    NSDictionary *product2 = @{
        @"product_id" : @"product_id_2",
        @"name" : @"name_2",
        @"price" : @2000,
        @"quantity" : @200,
        @"category" : @"category_2",
        @"extra" : @"extra_2"
    };
    NSDictionary *product3 = @{
        @"product_id" : @"product_id_3",
        @"name" : @"name_3",
        @"price" : @3000,
        @"quantity" : @300,
        @"category" : @"category_3",
        @"extra" : @"extra_3"
    };
    NSDictionary *product4 = @{
        @"product_id" : @"product_id_4",
        @"name" : @"name_4",
        @"price" : @4000,
        @"quantity" : @400,
        @"category" : @"category_4",
        @"extra" : @"extra_4"
    };
    NSDictionary *product5 = @{
        @"product_id" : @"product_id_5",
        @"name" : @"name_5",
        @"price" : @5000,
        @"quantity" : @500,
        @"category" : @"category_5",
        @"extra" : @"extra_5"
    };
    NSDictionary *product6 = @{
        @"product_id" : @"product_id_6",
        @"name" : @"name_6",
        @"price" : @6000,
        @"quantity" : @600,
        @"category" : @"category_6",
        @"extra" : @"extra_6"
    };
    NSDictionary *product7 = @{
        @"product_id" : @"product_id_7",
        @"name" : @"name_7",
        @"price" : @7000,
        @"quantity" : @700,
        @"category" : @"category_7",
        @"extra" : @"extra_7"
    };
    NSDictionary *product8 = @{
        @"product_id" : @"product_id_8",
        @"name" : @"name_8",
        @"price" : @8000,
        @"quantity" : @800,
        @"category" : @"category_8",
        @"extra" : @"extra_8"
    };
    NSArray *products = [[NSArray alloc] initWithObjects:product1, product2, product3, product4, product5, product6, product7, product8, nil];
    [[RSClient sharedInstance] track:@"Order Completed" properties:@{
        @"Custom_value_1" : @"Custom_Track_Call",
        @"currency" : @"INR",
        @"products" : products
    }];*/
}


@end
