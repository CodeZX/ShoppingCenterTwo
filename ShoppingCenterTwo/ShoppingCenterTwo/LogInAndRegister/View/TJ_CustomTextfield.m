//
//  TJ_CustomTextfield.m
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/12.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJ_CustomTextfield.h"
#import "TJ_VerificationCodeButton.h"


@interface TJ_CustomTextfield ()

//@property (nonatomic,weak) UIView *leftView;
@property (nonatomic,weak) UIImageView *leftImagV;
@property (nonatomic,weak) UIImageView *rightImagV;
@property (nonatomic,strong) NSString *leftImagName;
@property (nonatomic,strong) NSString *rightImageName;
@property (nonatomic,weak) CALayer *lineLayer;
@property (nonatomic,assign) NSTimeInterval countDown;
@end
@implementation TJ_CustomTextfield



- (instancetype)initWithPlaceholderString:( nullable NSString *)placeholderString leftImagName:(nullable NSString *)leftImagName rightImageName:( nullable NSString *)rightImageName {
    
    self = [super init];
    if (self) {
        self.leftImagName = leftImagName;
        self.rightImageName = rightImageName;
        self.placeholder = placeholderString;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;//输入框中是否有个叉号,用于一次性删除输入框中的内容
        self.adjustsFontSizeToFitWidth = YES;
        self.keyboardType = UIKeyboardTypeDefault;
        self.returnKeyType = UIReturnKeyNext;
        self.textColor = [UIColor blackColor];
         [self setupUI];
    }
    return self;
}

- (void)setCalculagraphForCountDown:(NSTimeInterval)timeInterval {
    
    self.countDown = timeInterval;
    TJ_VerificationCodeButton *countDownBtn = [[TJ_VerificationCodeButton alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    [countDownBtn addTarget:self action:@selector(countDownBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
//    countDownBtn.backgroundColor = [UIColor redColor];
    self.rightView = countDownBtn;
    self.rightViewMode = UITextFieldViewModeAlways;
    
}

- (void)countDownBtnClicked:(TJ_VerificationCodeButton *)btn  {
    if ([self.customDelegate respondsToSelector:@selector(customTextfield:didObtainAuthCodeForAuthCodeBtn:)]) {
        [self.customDelegate customTextfield:self didObtainAuthCodeForAuthCodeBtn:btn];
        [btn timeFailBeginFrom:self.countDown];
    }
}




- (void)setupUI {
    
    
    if (self.leftImagName.length > 0) {
        CGFloat W = 44;
        CGFloat H = 44;
        UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, W, H)];
//        leftView.backgroundColor = RandomColor;
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
        
        CGFloat space = 10;
        UIImageView *leftImagV = [[UIImageView alloc]initWithFrame:CGRectMake(space,space, W - 2*space, H - 2*space)];
        leftImagV.image = [UIImage imageNamed:self.leftImagName];
//        leftImagV.backgroundColor = RandomColor;
        [leftView addSubview:leftImagV];
        self.leftImagV = leftImagV;
    }
    
    if (self.rightImageName.length > 0) {
        CGFloat W = 44;
        CGFloat H = 44;
        UIView *rightView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, W, H)];
//        rightView.backgroundColor = RandomColor;
        self.rightView = rightView;
        self.rightViewMode = UITextFieldViewModeAlways;
        
        CGFloat space = 10;
        UIImageView *rightImagV = [[UIImageView alloc]initWithFrame:CGRectMake(space,space, W - 2*space, H - 2*space)];
        rightImagV.image = [UIImage imageNamed:self.rightImageName];
//        rightImagV.backgroundColor = RandomColor;
        [rightView addSubview:rightImagV];
        self.rightImagV = rightImagV;
    }
    
//   [self setValue:[NSNumber numberWithInt:5] forKey:@"paddingLeft"];
    
    CALayer *lineLayer = [[CALayer alloc]init];
    lineLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:lineLayer];
    self.lineLayer = lineLayer;
    

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat X = 0;
    CGFloat Y = self.frame.size.height - 1;
    CGFloat W1 = self.frame.size.width;
    CGFloat H1 = 1;
    self.lineLayer.frame = CGRectMake(X,Y , W1, H1);
   
}
//- (void)drawRect:(CGRect)rect {

//    //1.获取上下文
//        CGContextRef ctx = UIGraphicsGetCurrentContext();
//
//        //2.绘制图形
////        CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
//       CGContextMoveToPoint(ctx, 0, 30);
//       CGContextAddLineToPoint(ctx, 100, 30);
//         //设置属性（颜色）
//         //    [[UIColor yellowColor]set];
//         CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
//
//        //3.渲染
//         CGContextFillPath(ctx);
    
//    UIColor *color = [UIColor blackColor];
//    [color set]; //设置线条颜色
//
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    CGFloat X = 0;
//    CGFloat Y = self.frame.size.height - 1;
//    CGFloat W = self.frame.size.width;
//    CGFloat H  = 1;
//
//    [path moveToPoint:CGPointMake(X, Y)];
//    [path addLineToPoint:CGPointMake(W, Y)];
//
//    path.lineWidth = H;
//    path.lineCapStyle = kCGLineCapRound; //线条拐角
//    path.lineJoinStyle = kCGLineJoinRound; //终点处理
//
//    [path stroke];
//}

@end
