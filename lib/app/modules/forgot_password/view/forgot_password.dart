import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/forgot_password/controller/forgot_password_controller.dart';
import 'package:the_horeca_store/app/widgets/custom_textfield.dart';
import 'package:the_horeca_store/app/widgets/primary_button.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.loginImage.path),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /*  Obx(
                      () => Visibility(
                    visible: controller.isLoading.value,
                    child: const LinearProgressIndicator(
                      color: ColorName.cardinal,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    Assets.images.icAppicon.path,
                    height: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
                  child: Text(
                    AppLocalizations.of(context).forgotPassword,
                    style: AppThemeData.font24Weight600PlayfairCardinal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
                  child: CustomTextField(
                      obscureText: false,
                      hintText: AppLocalizations.of(context).email,
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      padding: const EdgeInsets.all(14)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
                  child: InkWell(
                      onTap: () {
                        controller.forgotPasswordAPI();
                      },
                      child: PrimaryButton(primaryBtnText: AppLocalizations.of(context).send)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
