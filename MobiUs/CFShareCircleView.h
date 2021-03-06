//
//  CFShareCircleView.h
//  CFShareCircle
//
//  Created by Camden on 12/18/12.
//  Copyright (c) 2012 Camden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CFSharer.h"
#import "FSTProduct.h"

@class CFShareCircleView;

@protocol CFShareCircleViewDelegate
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didSelectSharer:(CFSharer *)sharer;
- (void)shareCircleView:(CFShareCircleView *)aShareCircleView didCancelSharer:(CFSharer *)sharer;

@end

@interface CFShareCircleView : UIView

@property (assign) id <CFShareCircleViewDelegate> delegate;

- (void)refreshView;
- (void)addAccessoryWithDevice: (FSTProduct*)device withType:(CFSharerType)type;
- (void)removeAccessoryWithId: (NSString*)id;
- (void)removeAllAccessories;

@end
