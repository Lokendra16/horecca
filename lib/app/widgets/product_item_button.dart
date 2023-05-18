import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/commons/utils/my_snackbar.dart';
import 'package:the_horeca_store/networking/cart_repo.dart';
import 'package:the_horeca_store/networking/models/product_data/product_data.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class ProductItemButton extends StatefulWidget {
  const ProductItemButton({Key? key, required this.item}) : super(key: key);

  final ProductData item;
  @override
  State<ProductItemButton> createState() => _ProductItemButtonState();
}

class _ProductItemButtonState extends State<ProductItemButton> {
  bool isAdding = false;
  @override
  Widget build(BuildContext context) {
    if (widget.item.quantity <= 0) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          height: 40,
          child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                backgroundColor: ColorName.cardinal,
              ),
              onPressed: () async {
                setState(() {
                  isAdding = true;
                });

                var data = await CartRepo().addToCart(
                    1,
                    '${widget.item.variants?[0].id}',
                    widget.item.id.toString());
                setState(() {
                  if (data != null) {
                    widget.item.quantity = widget.item.quantity + 1;
                    widget.item.lineId = data;
                  }
                });
              },
              child: isAdding == true
                  ? SizedBox(
                      height: 50,
                      width: 50,
                      child: const CircularProgressIndicator())
                  : Text("Add to cart", style: AppThemeData.poppins400Font14)),
        ),
      );
    } else {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: ColorName.mercury,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () async {
                    var newQuantity = widget.item.quantity - 1;
                    if (newQuantity == 0) {
                      MySnackBar()
                          .errorSnackBar("At-least one quantity required!");
                      return;
                      await CartRepo()
                          .removeProductFromCart(widget.item.lineId);
                    } else {
                      await CartRepo()
                          .updateCart(newQuantity, widget.item.lineId);
                    }
                    setState(() {
                      widget.item.quantity = newQuantity;
                    });
                  },
                  child: const Icon(Icons.remove,
                      color: ColorName.gray, size: 16)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    widget.item.quantity.toString(),
                    style: GoogleFonts.roboto(
                        color: ColorName.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              InkWell(
                  onTap: () async {
                    var newQuantity = widget.item.quantity + 1;
                    await CartRepo()
                        .updateCart(newQuantity, widget.item.lineId);
                    setState(() {
                      widget.item.quantity = newQuantity;
                    });
                  },
                  child:
                      const Icon(Icons.add, color: ColorName.black, size: 16)),
            ],
          ),
        ),
      );
    }
    ;
  }
}
