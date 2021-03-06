//
//  FirebaseShared.h
//  MobiUs
//
//  Created by Myles Caley on 12/8/14.
//  Copyright (c) 2014 FirstBuild. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Firebase/Firebase.h>

@interface FirebaseShared : NSObject

@property (strong, nonatomic) Firebase * firebaseRootReference;
@property (strong, nonatomic) Firebase * userBaseReference;

+(id) sharedInstance;


@end
