import 'package:flutter/widgets.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';

import 'SvgIcon.dart';

extension SvgGenImageExt on SvgGenImage {
  String? get packageName {
    final result = keyName
        .replaceFirst('packages/', '')
        .replaceFirst('/', '')
        .replaceFirst(path, '');
    return result.isEmpty ? null : result;
  }

  /// See [SvgIcon].
  Widget svgIcon({
    double? size,
    Color? color,
    String? package,
    BoxFit? fit,
  }) {
    return SvgIcon(
      path,
      size: size,
      color: color,
      fit: fit,
    );
  }
}
