import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_tags.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.black,
      appBar: AppBar(
        backgroundColor: ColorName.black,
        leading: const Icon(
          Icons.arrow_back,
          color: ColorName.gray,
        ),
        centerTitle: false,
        title: const Text(
          AppTags.contactUs,
          style: AppThemeData.sf600Font16Gray,
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Column(
                children: [
                  // location icon and text
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.location_on,
                        color: ColorName.gray,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        " S08-09, Damascus street 2,AI\n Quasis Industrail 02 Behind AI,\n Quasis Plaza, Dubai U.A.E.\n P.O.Box 122851",
                        style: AppThemeData.sf400Font18Gray,
                      )
                    ],
                  ),
                  // email icon and email text
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(
                          Icons.email,
                          color: ColorName.gray,
                          size: 26,
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Text(
                          " hello@thehorecastore.com",
                          style: AppThemeData.sf400Font18Gray,
                        )
                      ],
                    ),
                  ),
                  // phone icon and phone number
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.phone,
                        color: ColorName.gray,
                        size: 30,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        " +971 4 224 5818",
                        style: AppThemeData.sf400Font18Gray,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
