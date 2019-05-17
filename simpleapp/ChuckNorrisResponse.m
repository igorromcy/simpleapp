//
//  ChuckNorrisResponse.m
//  simpleapp
//
//  Created by Igor Maia Romcy on 17/05/19.
//  Copyright © 2019 igorromcy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChuckNorrisResponse.h"

@implementation ChuckNorrisResponse

- (void)parseResponse:(NSDictionary *)receivedObjects
{
    self.identifier = [receivedObjects objectForKey:@"id"];
    self.iconUrl = [receivedObjects objectForKey:@"icon_url"];
    self.value = [receivedObjects objectForKey:@"value"];
    self.url = [receivedObjects objectForKey:@"url"];
    self.category = [receivedObjects objectForKey:@"category"];
}

@end
