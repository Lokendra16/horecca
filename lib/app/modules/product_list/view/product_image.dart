import 'package:flutter/material.dart';

import '../../../../networking/models/product_data/product_data.dart';

class ProductImage extends StatelessWidget {
  ProductImage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final ProductData item;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          clipBehavior: Clip.none,
          panEnabled: false,
          minScale: 0.5,
          maxScale: 4,
          child: Image.network(item.image?.src ?? ''),
          // child: FancyShimmerImage(
          //   imageUrl: item.image?.src ?? '',
          //   errorWidget: Image.asset('assets/images/ic_appicon.png'),
          // )
        ),
      ),
    );
  }
}
