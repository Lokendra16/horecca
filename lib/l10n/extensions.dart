import 'package:flutter/widgets.dart';
import 'localization.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension Validator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool isValidPassword() {
    if (this.isEmpty) return false;
    if (this.length < 6) return false;
    return true;
  }

  bool isValidValue() {
    if (this.isEmpty) return false;
    return true;
  }
}

extension StringX on String? {
  String getLastSegment() {
    if (this != null && this!.isNotEmpty) {
      try{
        return Uri.parse(this!).pathSegments.last;
      }catch(e){
        return "";
      }

    } else {
      return "";
    }

  }

  String? parseDate(){
    if(this!=null && this!.isNotEmpty){
      final dateTime = DateTime.parse(this!).toLocal();
      final formattedString = DateFormat('dd-MMMM-yyyy').format(dateTime);
      return formattedString;
    }else{
      return "";
    }
  }

}
