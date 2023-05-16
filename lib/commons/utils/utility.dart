import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_horeca_store/commons/utils/app_tags.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  static String rateUsURLAndroid =
      "https://play.google.com/store/apps/details?id=com.example.the_horeca_store"; //TODO Update Package here
  static String rateUsURLIOS =
      "https://apps.apple.com/in/app/"; //TODO Update ID here
  static String privacyPolicyURL =
      "https://thehorecastore.com/pages/privacy-policy"; //TODO Update ID here

  static launchCall(number) async {
    final call = Uri.parse('tel:$number');
    if (await canLaunchUrl(call)) {
      launchUrl(call);
    } else {
      throw 'Could not launch $call';
    }
  }

  static launchWhatsapp(whatsappNumber) {
    return launchUrl(
      Uri.parse(
        'whatsapp://send?phone=$whatsappNumber', //put your number here
      ),
    );
  }

  static launchURL(url) {
    return launchUrl(
      Uri.parse(
        '$url',
      ),
    );
  }

  static launchMail(email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'hello@thehorecastore.com',
    );
    String chatURL = "https://$email";
    var url = Uri.parse(chatURL);
    if (await canLaunchUrl(url)) {
      await Platform.isIOS
          ? launchUrl(url, mode: LaunchMode.inAppWebView)
          : launchURL(params);
    } else {
      throw 'Could not launch $url';
    }
  }

  static shareUrl(String slug) async {
    var newUrl = 'https://thehorecastore.myshopify.com/products/$slug';
    await Share.shareWithResult('$newUrl \nShop from : ${AppTags.shareTxt}');
    debugPrint(" new url : $newUrl");
  }
}
