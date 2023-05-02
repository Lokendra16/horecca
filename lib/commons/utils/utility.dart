import 'package:url_launcher/url_launcher.dart';

class Utility {
  static String rateUsURLAndroid =
      "https://play.google.com/store/apps/details?id=com.example.the_horeca_store"; //TODO Update Package here
  static String rateUsURLIOS = "https://apps.apple.com/in/app/"; //TODO Update ID here
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

  static launchMail(email) {
    print("calling url launcher :- $email");
    launch('$email?subject=This is Subject Title&body=This is Body of Email');
  }


}
