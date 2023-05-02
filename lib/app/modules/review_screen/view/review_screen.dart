import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/review_screen/controller/review_screen_controller.dart';
import 'package:the_horeca_store/app/modules/review_screen/widget/review_widget.dart';
import 'package:the_horeca_store/app/widgets/app_bar_cart.dart';
import 'package:the_horeca_store/app/widgets/primary_button.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';
class ReviewScreen extends StatelessWidget {
   ReviewScreen({Key? key}) : super(key: key);
  final reviewScreenController = Get.put(ReviewScreenController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBarCart(
          title: AppLocalizations.of(context).customerReview,
          hideCartButton: true,
          hideSearchButton: true,
          onBackPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ReviewWidget(),
              ),
               Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 15),
                child: TextField(
                  minLines: 5,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'How is the product?',
                    hintStyle: AppThemeData.font14Weight400Gray.copyWith(color: ColorName.gray),
                    border: const OutlineInputBorder(borderSide: BorderSide(width: 1,color: ColorName.mercury)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5), //
                    focusedBorder:const OutlineInputBorder(
                      borderSide: BorderSide(color: ColorName.gray, width: 1.0),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 16,right: 16),
                child: PrimaryButton(primaryBtnText: AppLocalizations.of(context).submit,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
