//
//  AZEQDiagram.h
//  Pods
//
//  Created by 钟建明 on 14/11/14.
//
//

#import <UIKit/UIKit.h>

@interface AZEQDiagram : UIView

@property(nonatomic, strong) UIColor *color;

- (void)setColumn:(NSInteger)column andColumnWidth:(CGFloat)columnWidth;
- (void)startAnimation;

@end
