//
//  AZEQDiagram.m
//  Pods
//
//  Created by 钟建明 on 14/11/14.
//
//

#import "AZEQDiagram.h"
#import "POP.h"

@interface AZEQDiagram ()

@property(nonatomic, assign) CGFloat columnWidth;
@property(nonatomic, assign) NSInteger column;
@property(nonatomic, strong) NSMutableArray *rectArray;
@property(nonatomic, strong) NSMutableArray *offsetArray;
@property(nonatomic, assign) CGFloat rectHeight;
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign) int lastI;

@end

@implementation AZEQDiagram

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    _color = [UIColor blackColor];
    self.backgroundColor = [UIColor clearColor];
  }
  return self;
}

- (void)drawRect:(CGRect)rect {
  CGContextRef context = UIGraphicsGetCurrentContext();
  [self drawBackground:context rect:rect];
  [self drawEQ:context rect:rect];
}

- (void)setRectHeight:(CGFloat)rectHeight {
  _rectHeight = rectHeight;
  [self setNeedsDisplay];
}

- (void)startAnimation {
  [self pop_removeAllAnimations];
  [self updateOffsets];
  [self beat];
  self.timer = [NSTimer scheduledTimerWithTimeInterval:0.6
                                                target:self
                                              selector:@selector(beat)
                                              userInfo:nil
                                               repeats:YES];
}

- (void)beat {
  [self updateOffsets];
  POPBasicAnimation *anim = [POPBasicAnimation animation];
  anim.fromValue = @(self.rectHeight);
  anim.toValue = @(self.frame.size.height);
  anim.property = [self rectHeightProperty];
  anim.duration = 0.3;
  anim.completionBlock = ^(POPAnimation *anim, BOOL is) {
      POPBasicAnimation *decay = [POPBasicAnimation animation];
      decay.fromValue = @(self.rectHeight);
      decay.toValue = @(0.0);
      decay.duration = 1;
      decay.property = [self rectHeightProperty];
      [self pop_addAnimation:decay forKey:@"bbb"];
  };
  [self pop_addAnimation:anim forKey:@"aaa"];
}

- (POPAnimatableProperty *)rectHeightProperty {
  return [POPAnimatableProperty
      propertyWithName:@"rectHeight"
           initializer:^(POPMutableAnimatableProperty *prop) {
               prop.readBlock = ^(id obj, CGFloat valuse[]) {
                   valuse[0] = [obj rectHeight];
               };

               prop.writeBlock = ^(id obj, const CGFloat valuse[]) {
                   [obj setRectHeight:valuse[0]];
               };
               prop.threshold = 0.01;

           }];
}

- (void)setColumn:(NSInteger)column andColumnWidth:(CGFloat)columnWidth {
  self.column = column;
  self.columnWidth = columnWidth;
  [self updateRects];
  [self setNeedsDisplay];
}

- (void)setFrame:(CGRect)frame {
  [self updateRects];
  [super setFrame:frame];
}

- (void)setColor:(UIColor *)color {
  _color = color;
  [self setNeedsDisplay];
}

- (void)drawBackground:(CGContextRef)context rect:(CGRect)rect {
  CGContextSetFillColorWithColor(context, [self.backgroundColor CGColor]);
  CGContextFillRect(context, rect);
}

- (void)drawEQ:(CGContextRef)context rect:(CGRect)rect {
  CGContextSetFillColorWithColor(context, [self.color CGColor]);
  for (int i = 0; i < self.rectArray.count; i++) {
    CGRect eqRect = [self.rectArray[i] CGRectValue];
    CGFloat offset = [self.offsetArray[i] floatValue];
    eqRect =
        CGRectMake(eqRect.origin.x, eqRect.origin.y + offset - self.rectHeight,
                   eqRect.size.width, self.rectHeight - offset);
    CGContextFillRect(context, eqRect);
  }
}

- (void)updateRects {
  if (self.column == 0)
    return;

  CGFloat viewWidth = self.frame.size.width;
  CGFloat viewBottom = self.frame.size.height;
  NSInteger marginNum = self.column - 1;
  CGFloat marginBetweenRects;
  if (marginNum > 0) {
    marginBetweenRects =
        (viewWidth - self.columnWidth * self.column) / marginNum;
  } else {
    marginBetweenRects = 0;
  }
  CGFloat firstRectX =
      viewWidth / 2 -
      (self.column * self.columnWidth + marginNum * marginBetweenRects) / 2;

  self.rectArray = [NSMutableArray array];
  for (int i = 0; i < self.column; i++) {
    CGRect rect =
        CGRectMake(firstRectX + i * (self.columnWidth + marginBetweenRects),
                   viewBottom, self.columnWidth, 0);

    [self.rectArray addObject:[NSValue valueWithCGRect:rect]];
  }
}

- (void)updateOffsets {
  self.offsetArray = [NSMutableArray array];
  int height = self.frame.size.height;
  for (int i = 0; i < self.column; i++) {
    int offset = arc4random() % height;
    [self.offsetArray addObject:@(offset)];
  }
}

@end
