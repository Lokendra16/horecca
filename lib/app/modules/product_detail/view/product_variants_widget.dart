import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_horeca_store/app/modules/product_detail/controller/product_detail_controller.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class ProductVariantsWidget extends StatelessWidget {
  ProductVariantsWidget({
    super.key,
  });

  ProductDetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Container(
          width: size.width,
          color: ColorName.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var item = controller.productDetail.value.options?[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item?.name ?? '',
                        style: GoogleFonts.roboto(fontSize: 18.0),
                      ),
                      Wrap(
                        children: [
                          for (int i = 0; i < item!.values!.length; i++)
                            _buildChip(
                              item.values?[i].toString() ?? '',
                              i == item.selectedOptionIndex ? true : false,
                            ),
                        ],
                      )
                    ],
                  );
                },
                shrinkWrap: true,
                itemCount: controller.productDetail.value.options?.length ?? 0),
          ),
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
      child: Chip(
        labelPadding: const EdgeInsets.all(2.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(6.0),
          ),
        ),
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: isSelected ? ColorName.jewel : ColorName.silver,
      ),
    );
  }
}
