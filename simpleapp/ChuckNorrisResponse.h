//
//  ChuckNorrisResponse.h
//  simpleapp
//
//  Created by Igor Maia Romcy on 17/05/19.
//  Copyright © 2019 igorromcy. All rights reserved.
//


#import<Foundation/Foundation.h>

@interface ChuckNorrisResponse : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *category;

- (void)parseResponse:(NSDictionary *)receivedObjects;

@end
