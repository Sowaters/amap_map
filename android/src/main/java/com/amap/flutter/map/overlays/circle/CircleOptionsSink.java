package com.amap.flutter.map.overlays.circle;

import com.amap.api.maps.model.LatLng;

/**
 * @author whm
 * @date 2020/11/12 9:46 AM
 * @mail hongming.whm@alibaba-inc.com
 * @since
 */
interface CircleOptionsSink {
    void setCenter(LatLng center);

    void setRadius(double radius);

    void setStrokeWidth(float strokeWidth);

    void setStrokeColor(int color);

    void setFillColor(int color);

    void setVisible(boolean visible);
}
