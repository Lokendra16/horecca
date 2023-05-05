import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/login_screen/controller/login_screen_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/app/widgets/custom_textfield.dart';
import 'package:the_horeca_store/app/widgets/primary_button.dart';
import 'package:the_horeca_store/app/widgets/social_signin_button.dart';
import 'package:the_horeca_store/app/widgets/user_access_widget.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginScreenController controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: ColorName.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => Visibility(
                    visible: controller.isLoading.value,
                    child: const LinearProgressIndicator(
                      color: ColorName.cardinal,
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    Assets.images.icAppicon.path,
                    height: 40,
                    width: 103,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
                  child: Text(
                    AppLocalizations.of(context).login,
                    style: AppThemeData.font24Weight600PlayfairCardinal.copyWith(color: Colors.black,fontSize: 24),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
                  child: CustomTextField(
                    padding: const EdgeInsets.all(6),
                    obscureText: false,
                    controller: controller.emailController,
                    hintText: AppLocalizations.of(context).email,
                    keyboardType: TextInputType.emailAddress,
                    prefixImage: SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                            child: Image.asset(
                          Assets.images.emailImage.path,
                          height: 16,
                        ))),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: CustomTextField(
                    padding: const EdgeInsets.all(6),
                    obscureText: true,
                    controller: controller.passwordController,
                    hintText: AppLocalizations.of(context).password,
                    keyboardType: TextInputType.visiblePassword,
                    prefixImage: Container(
                        height: 20,
                        width: 20,
                        child: Center(
                            child: Image.asset(
                          Assets.images.password.path,
                          height: 16,
                        ))),
                    suffixImage: Container(
                        height: 20,
                        width: 20,
                        child: Center(
                            child: Image.asset(
                          Assets.images.showHide.path,
                          height: 16,
                        ))),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.forgotPassword);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context).forgotPassword,
                          style: AppThemeData.sf400Font15Gray.copyWith(color: ColorName.gray.withOpacity(0.7)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0,left: 20,right: 20),
                  child: InkWell(
                    onTap: () {
                      controller.loginAPI();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: PrimaryButton(
                      primaryBtnText: AppLocalizations.of(context).login,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.32,
                        color: ColorName.gray,
                      ),
                      const Spacer(),
                      Text(
                        AppLocalizations.of(context).login_with,
                        style: AppThemeData.font14Weight400Gray,
                      ),
                      const Spacer(),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.32,
                        color: ColorName.gray,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialSignInButton(image: Assets.images.facebookImage.path),
                      const SizedBox(width: 40),
                      SocialSignInButton(image: Assets.images.google.path),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                  child: UserAccessWidget(
                    onPressed: () {
                      Get.toNamed(AppRoutes.signupScreen);
                    },
                    usrAccessTxt: AppLocalizations.of(context).doNotAccount,
                    loginSignupTxt: AppLocalizations.of(context).register,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
