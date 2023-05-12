import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/commons/utils/app_preference.dart';
import 'package:the_horeca_store/networking/models/product_data/product_model.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

import '../modules/wish_list_screen/controller/wishlist_controller.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  var isWishlist = false;


  @override
  void initState() {
    super.initState();
    checkWishlist(widget.id);
     }

  @override
  Widget build(BuildContext context) {
    debugPrint('product id : ${widget.id}');
    return isWishlist
        ? GestureDetector(
            onTap: () {
             AppPreference().addRemoveFromWishlist(widget.id);

              setState(() {
                isWishlist = !isWishlist;

              });

            },
            child: const Icon(Icons.favorite, color: ColorName.cardinal, size: 26))
        : GestureDetector(
            onTap: () {
              AppPreference().addRemoveFromWishlist(widget.id);

              setState(() {
                isWishlist = !isWishlist;

              });
            },
            child: const Icon(Icons.favorite_border_rounded, color: ColorName.silver, size: 26));
  }

  Future<void> checkWishlist(String id) async {
    await AppPreference().checkIdProductInWishlist(id).then((value) {
      setState(() {
        isWishlist = value;
      });
    });
  }
}
