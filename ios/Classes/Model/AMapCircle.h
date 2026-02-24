//
//  AMapCircle.h
//  amap_map
//
//  Created by whm on 2020/11/12.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@class MACircle;

@interface AMapCircle : NSObject

@property (nonatomic, strong) NSString *circleId;
@property (nonatomic, assign) CLLocationCoordinate2D center;
@property (nonatomic, assign) CLLocationDistance radius;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeWidth;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, assign) BOOL visible;

@property (nonatomic, strong, readonly) MACircle *circle;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (void)updateCircle:(AMapCircle *)newCircle;

@end

NS_ASSUME_NONNULL_END
