import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/widgets/common_pageview/common_pageview_controller.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

import 'common_pageview_model.dart';

class CommonPageView extends StatelessWidget {
  CommonPageView({
    Key? key,
  }) : super(key: key);

  final pageViewController = CommonPageViewController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => SizedBox(
          height: size.height * 0.3,
          width: size.width,
          child: Stack(children: [
            SizedBox(
              width: double.infinity,
              child: PageView.builder(
                controller: pageViewController.pageController,
                itemCount: homepageContents.length,
                onPageChanged: pageViewController.cIndex,
                itemBuilder: (_, i) {
                  return Image.network(
                    homepageContents[i].pgImage.toString(),
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  homepageContents.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
          ]),
        ));
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: pageViewController.cIndex.value == index ? ColorName.gray410 : ColorName.white,
      ),
    );
  }
}
