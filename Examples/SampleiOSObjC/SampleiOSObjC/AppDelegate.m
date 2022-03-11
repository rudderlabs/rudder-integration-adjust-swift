//
//  AppDelegate.m
//  SampleiOSObjC
//
//  Created by Pallab Maiti on 15/11/21.
//

#import "AppDelegate.h"

@import RudderStack;
@import RudderAdjust;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *DATA_PLANE_URL = @"https://rudderstacbumvdrexzj.dataplane.rudderstack.com";
    NSString *WRITE_KEY = @"203EnCjvGV6qhvrcaz7MyWiQmJx";
    
    // Override point for customization after application launch.
    
    RSConfig *config = [[RSConfig alloc] initWithWriteKey:@"1wvsoF3Kx2SczQNlx1dvcqW9ODW"];
    [config dataPlaneURL:@"https://rudderstacz.dataplane.rudderstack.com"];
    [config loglevel:RSLogLevelDebug];
    [config trackLifecycleEvents:YES];
    [config recordScreenViews:YES];
    
    RSClient *client = [[RSClient alloc] initWithConfig:config];
    
//    RSOption *option = [[RSOption alloc] init];
//    [option putIntegration:@"Firebase" isEnabled:NO];
//    [client setOption:option];
    
    //[client addWithPlugin:[[RSFirebaseDestination alloc] init]];
    [client addWithDestination:[[RudderAdjustDestination alloc] init]];
    [client track:@"Track 1" properties:NULL option:NULL];
    
    /*
     let config: RSConfig = RSConfig(writeKey: "1wvsoF3Kx2SczQNlx1dvcqW9ODW")
         .dataPlaneURL("https://rudderstacz.dataplane.rudderstack.com")
         .loglevel(.debug)
         .trackLifecycleEvents(false)
         .recordScreenViews(true)
     
     client = RSClient(config: config)

     */
    
    
    
//    RSConfig *builder = [[RSConfig alloc] init];
//    [builder withDataPlaneUrl:DATA_PLANE_URL];
//    [builder withFactory:[RudderFirebaseFactory instance]];
//    [builder withLoglevel:RSLogLevelDebug];
//    [RSClient getInstance:WRITE_KEY config:builder];

    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
