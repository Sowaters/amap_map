//
//  AMapCircleController.h
//  amap_map
//
//  Created by whm on 2020/11/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MACircle;
@class FlutterMethodChannel;
@class MAMapView;
@class AMapCircle;

@interface AMapCircleController : NSObject

- (instancetype)init:(FlutterMethodChannel*)methodChannel
             mapView:(MAMapView*)mapView
           registrar:(NSObject<FlutterPluginRegistrar>*)registrar;

- (nullable AMapCircle *)circleForId:(NSString *)circleId;

- (void)addCircles:(NSArray*)circlesToAdd;
- (void)changeCircles:(NSArray*)circlesToChange;
- (void)removeCircleIds:(NSArray*)circleIdsToRemove;

@end

NS_ASSUME_NONNULL_END
