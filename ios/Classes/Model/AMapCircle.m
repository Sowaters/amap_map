//
//  AMapCircle.m
//  amap_map
//
//  Created by whm on 2020/11/12.
//

#import "AMapCircle.h"
#import <MAMapKit/MAMapKit.h>

@interface AMapCircle ()

@property (nonatomic, strong, readwrite) MACircle *circle;

@end

@implementation AMapCircle

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (self = [super init]) {
        _circleId = dictionary[@"id"];
        
        if (dictionary[@"center"] != nil) {
            NSDictionary *centerDict = dictionary[@"center"];
            _center = CLLocationCoordinate2DMake([centerDict[@"latitude"] doubleValue], [centerDict[@"longitude"] doubleValue]);
        }
        
        _radius = [dictionary[@"radius"] doubleValue];
        
        if (dictionary[@"strokeColor"] != nil) {
            NSInteger strokeColorValue = [dictionary[@"strokeColor"] integerValue];
            _strokeColor = [UIColor colorWithRed:((strokeColorValue >> 16) & 0xFF) / 255.0
                                          green:((strokeColorValue >> 8) & 0xFF) / 255.0
                                           blue:((strokeColorValue) & 0xFF) / 255.0
                                          alpha:((strokeColorValue >> 24) & 0xFF) / 255.0];
        }
        
        _strokeWidth = [dictionary[@"strokeWidth"] floatValue];
        
        if (dictionary[@"fillColor"] != nil) {
            NSInteger fillColorValue = [dictionary[@"fillColor"] integerValue];
            _fillColor = [UIColor colorWithRed:((fillColorValue >> 16) & 0xFF) / 255.0
                                         green:((fillColorValue >> 8) & 0xFF) / 255.0
                                          blue:((fillColorValue) & 0xFF) / 255.0
                                         alpha:((fillColorValue >> 24) & 0xFF) / 255.0];
        }
        
        if (dictionary[@"visible"] != nil) {
            _visible = [dictionary[@"visible"] boolValue];
        } else {
            _visible = YES;
        }
        
        // 创建MACircle对象
        _circle = [MACircle circleWithCenterCoordinate:_center radius:_radius];
        // 保存circleId到MACircle的userInfo中，以便在rendererForOverlay中获取
        if (_circleId) {
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            userInfo[@"circleId"] = _circleId;
            _circle.userInfo = userInfo;
        }
    }
    return self;
}

- (void)updateCircle:(AMapCircle *)newCircle {
    if (newCircle) {
        _center = newCircle.center;
        _radius = newCircle.radius;
        _strokeColor = newCircle.strokeColor;
        _strokeWidth = newCircle.strokeWidth;
        _fillColor = newCircle.fillColor;
        _visible = newCircle.visible;
        
        // 重新创建MACircle对象，因为MACircle的属性不能直接修改
        _circle = [MACircle circleWithCenterCoordinate:_center radius:_radius];
        // 保存circleId到MACircle的userInfo中
        if (_circleId) {
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            userInfo[@"circleId"] = _circleId;
            _circle.userInfo = userInfo;
        }
    }
}

@end
