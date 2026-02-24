package com.amap.flutter.map.overlays.circle;

import com.amap.flutter.map.utils.ConvertUtil;

import java.util.Map;

/**
 * @author whm
 * @date 2020/11/12 10:11 AM
 * @mail hongming.whm@alibaba-inc.com
 * @since
 */
class CircleUtil {

    static String interpretOptions(Object o, CircleOptionsSink sink) {
        final Map<?, ?> data = ConvertUtil.toMap(o);
        final Object center = data.get("center");
        if (center != null) {
            sink.setCenter(ConvertUtil.toLatLng(center));
        }

        final Object radius = data.get("radius");
        if (radius != null) {
            sink.setRadius(ConvertUtil.toDouble(radius));
        }

        final Object strokeWidth = data.get("strokeWidth");
        if (strokeWidth != null) {
            sink.setStrokeWidth(ConvertUtil.toFloatPixels(strokeWidth));
        }

        final Object strokeColor = data.get("strokeColor");
        if (strokeColor != null) {
            sink.setStrokeColor(ConvertUtil.toInt(strokeColor));
        }

        final Object fillColor = data.get("fillColor");
        if (fillColor != null) {
            sink.setFillColor(ConvertUtil.toInt(fillColor));
        }

        final Object visible = data.get("visible");
        if (visible != null) {
            sink.setVisible(ConvertUtil.toBoolean(visible));
        }

        final String circleId = (String) data.get("id");
        if (circleId == null) {
            throw new IllegalArgumentException("circleId was null");
        } else {
            return circleId;
        }
    }


}
