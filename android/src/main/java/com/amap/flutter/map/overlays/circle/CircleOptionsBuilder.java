package com.amap.flutter.map.overlays.circle;

import com.amap.api.maps.model.CircleOptions;
import com.amap.api.maps.model.LatLng;

/**
 * @author whm
 * @date 2020/11/12 9:47 AM
 * @mail hongming.whm@alibaba-inc.com
 * @since
 */
class CircleOptionsBuilder implements CircleOptionsSink {

    private final CircleOptions options = new CircleOptions();

    public CircleOptions build() {
        return options;
    }

    @Override
    public void setCenter(LatLng center) {
        options.center(center);
    }

    @Override
    public void setRadius(double radius) {
        options.radius(radius);
    }

    @Override
    public void setStrokeWidth(float strokeWidth) {
        options.strokeWidth(strokeWidth);
    }

    @Override
    public void setStrokeColor(int color) {
        options.strokeColor(color);
    }

    @Override
    public void setFillColor(int color) {
        options.fillColor(color);
    }

    @Override
    public void setVisible(boolean visible) {
        options.visible(visible);
    }
}
