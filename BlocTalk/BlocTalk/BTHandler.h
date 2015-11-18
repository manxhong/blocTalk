//
//  BTHandler.h
//  BlocTalk
//
//  Created by Man Hong Lee on 11/18/15.
//  Copyright (c) 2015 ManHong Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface BTHandler : NSObject <MCSessionDelegate>

//represents a peer in a multipeer session
@property (nonatomic, strong) MCPeerID *peerID;
//represents a peer
@property (nonatomic, strong) MCSession *session;
//advertising a peer to nearby devices
@property (nonatomic, strong) MCAdvertiserAssistant *advertiser;
@property (nonatomic, strong) MCBrowserViewController *browser;

-(void)setupPeerWithDisplayName:(NSString *)displayName;
-(void)setupSession;
-(void)setupBrowser;
-(void)advertiseSelf:(BOOL)advertise;


@end
