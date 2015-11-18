//
//  BTHandler.m
//  BlocTalk
//
//  Created by Man Hong Lee on 11/18/15.
//  Copyright (c) 2015 ManHong Lee. All rights reserved.
//

#import "BTHandler.h"

@implementation BTHandler

-(void)setupPeerWithDisplayName:(NSString *)displayName {
    self.peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
}

-(void)setupSession {
    self.session = [[MCSession alloc] initWithPeer:self.peerID];
    self.session.delegate =self;
}

-(void)setupBrowser {
    self.browser = [[MCBrowserViewController alloc] initWithServiceType:@"chat" session:_session];
}

-(void)advertiseSelf:(BOOL)advertise {
    if (advertise) {
        self.advertiser = [[MCAdvertiserAssistant alloc] initWithServiceType:@"chat" discoveryInfo:nil session:self.session];
        [self.advertiser start];
    } else {
        [self.advertiser stop];
        self.advertiser = nil;
    }
}

-(void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state {
    NSDictionary *userInfo = @{ @"peerID" : peerID,
                                @"state" : @(state) };
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MPCDemo_DidChangeStateNotification" object:nil userInfo:userInfo];
    });
}

-(void)session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID {
    NSDictionary *userInfo = @{ @"data": data,
                                @"peerID": peerID};
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MCPDemo_DidReceiveDataNotification" object:nil userInfo:userInfo];
    });
}

@end
