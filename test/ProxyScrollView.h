//
//  ProxyScrollView.h
//  CIQ
//
//  Created by jackson wang on 12-3-7.
//  Copyright (c) 2012 CarryQuote. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProxyScrollView : NSObject <UIScrollViewDelegate>
{
    UIScrollView* _view;
    id<UIScrollViewDelegate> origDelegate;
    id<UIScrollViewDelegate> newDelegate;
}

+ (ProxyScrollView*) proxyScrollViewWithScrollView: (UIScrollView*) scrollView;
- (void)setDelegate:(id<UIScrollViewDelegate>)delegate;

@end

