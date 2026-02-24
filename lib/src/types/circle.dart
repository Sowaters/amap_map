
// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:amap_map/src/compatibility/color_extensions.dart';
import 'package:flutter/material.dart' show Color;
import 'package:x_amap_base/x_amap_base.dart';
import 'base_overlay.dart';

/// 圆形覆盖物类，内部的属性，描述了覆盖物的中心点、半径、颜色等特征
class Circle extends BaseOverlay {
  /// 默认构造函数
  Circle({
    required this.center,
    required this.radius,
    double strokeWidth = 10,
    this.strokeColor = const Color(0xCC00BFFF),
    this.fillColor = const Color(0xC487CEFA),
    this.visible = true,
  })  : assert(radius > 0),
        strokeWidth = (strokeWidth <= 0 ? 10 : strokeWidth),
        super();

  /// 圆心坐标
  final LatLng center;

  /// 半径，单位米
  final double radius;

  /// 边框宽度,单位为逻辑像素，同Android中的dp，iOS中的point
  final double strokeWidth;

  /// 边框颜色,默认值为(0xCCC4E0F0)
  final Color strokeColor;

  /// 填充颜色,默认值为(0xC4E0F0CC)
  final Color fillColor;

  /// 是否可见
  final bool visible;

  /// 实际copy函数
  Circle copyWith({
    LatLng? centerParam,
    double? radiusParam,
    double? strokeWidthParam,
    Color? strokeColorParam,
    Color? fillColorParam,
    bool? visibleParam,
  }) {
    Circle copyCircle = Circle(
      center: centerParam ?? center,
      radius: radiusParam ?? radius,
      strokeWidth: strokeWidthParam ?? strokeWidth,
      strokeColor: strokeColorParam ?? strokeColor,
      fillColor: fillColorParam ?? fillColor,
      visible: visibleParam ?? visible,
    );
    copyCircle.setIdForCopy(id);
    return copyCircle;
  }

  @override
  Circle clone() => copyWith();

  /// 转换成可以序列化的map
  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> json = <String, dynamic>{};

    void addIfPresent(String fieldName, dynamic value) {
      if (value != null) {
        json[fieldName] = value;
      }
    }

    addIfPresent('id', id);
    json['center'] = center.toJson();
    addIfPresent('radius', radius);
    addIfPresent('strokeWidth', strokeWidth);
    addIfPresent('strokeColor', strokeColor.argbValue);
    addIfPresent('fillColor', fillColor.argbValue);
    addIfPresent('visible', visible);
    return json;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    if (other is! Circle) return false;
    final Circle typedOther = other;
    return id == typedOther.id &&
        center == typedOther.center &&
        radius == typedOther.radius &&
        strokeWidth == typedOther.strokeWidth &&
        strokeColor == typedOther.strokeColor &&
        fillColor == typedOther.fillColor &&
        visible == typedOther.visible;
  }

  @override
  int get hashCode => Object.hashAll(<Object?>[
        id,
        center,
        radius,
        strokeWidth,
        strokeColor,
        fillColor,
        visible
      ]);
}

Map<String, Circle> keyByCircleId(Iterable<Circle> circles) {
  // ignore: unnecessary_null_comparison
  if (circles == null) {
    return <String, Circle>{};
  }
  return Map<String, Circle>.fromEntries(circles.map((Circle circle) =>
      MapEntry<String, Circle>(circle.id, circle.clone())));
}
