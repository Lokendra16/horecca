import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  const SvgIcon(
    this.asset, {
    Key? key,
    this.size,
    this.color,
    this.package,
    this.fit,
  }) : super(key: key);

  final double? size;
  final String asset;
  final Color? color;
  final String? package;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final IconThemeData? iconTheme =
        context.dependOnInheritedWidgetOfExactType<IconTheme>()?.data;

    // Copy past color inferring from Icon.build method
    final iconOpacity = iconTheme?.opacity ?? 1.0;
    var iconColor = color ?? iconTheme!.color;
    final iconSize = size ?? iconTheme!.size;
    if (iconOpacity != 1.0) {
      iconColor = iconColor?.withOpacity(iconColor.opacity * iconOpacity);
    }
    return SvgPicture.asset(
      asset,
      package: package,
      color: color,
      width: iconSize,
      height: iconSize,
      fit: fit ?? BoxFit.contain,
    );
  }
}
