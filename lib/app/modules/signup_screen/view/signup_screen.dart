import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/signup_screen/controller/signup_controller.dart';
import 'package:the_horeca_store/app/routes/app_routes.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/app/widgets/custom_textfield.dart';
import 'package:the_horeca_store/app/widgets/primary_button.dart';
import 'package:the_horeca_store/app/widgets/user_access_widget.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorName.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
          ),
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40,),
                child: Text(
                  AppLocalizations.of(context).register,
                  style: AppThemeData.font24Weight600PlayfairCardinal.copyWith(color: Colors.black,fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16,top: 40  ),
                child: CustomTextField(
                  padding: const EdgeInsets.all(6),
                  obscureText: false,
                  controller: controller.firstNameController,
                  hintText: AppLocalizations.of(context).firstName,
                  keyboardType: TextInputType.name,
                  prefixImage: SizedBox(
                      height: 20,
                      width: 20,
                      child: Center(
                          child: Image.asset(
                        Assets.images.bottomUser.path,
                        height: 16,
                      ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: CustomTextField(
                  padding: EdgeInsets.all(6),
                  obscureText: false,
                  controller: controller.lastNameController,
                  hintText: AppLocalizations.of(context).lastName,
                  keyboardType: TextInputType.name,
                  prefixImage: SizedBox(
                      height: 20,
                      width: 20,
                      child: Center(
                          child: Image.asset(
                        Assets.images.bottomUser.path,
                        height: 16,
                      ))),
                  //prefixIcon: const Icon(Icons.email),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
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
                  // prefixIcon: const Icon(Icons.email),
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
                  prefixImage: SizedBox(
                      height: 20,
                      width: 20,
                      child: Center(
                          child: Image.asset(
                        Assets.images.password.path,
                        height: 16,
                      ))),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16,top: 40),
                child: InkWell(
                    onTap: () {
                      controller.signUpApi();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: PrimaryButton(
                      primaryBtnText: AppLocalizations.of(context).register,
                    )),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16,bottom: 20),
                child: UserAccessWidget(
                  onPressed: () {
                    Get.toNamed(AppRoutes.loginScreen);
                  },
                  usrAccessTxt: AppLocalizations.of(context).alreadyAccount,
                  loginSignupTxt: AppLocalizations.of(context).login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
