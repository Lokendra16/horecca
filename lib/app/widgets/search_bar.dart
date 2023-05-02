import 'package:flutter/material.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class SearchBar extends StatelessWidget {
  final Function(String searchKey) onSearchTap;

  SearchBar({Key? key, required this.onSearchTap}) : super(key: key);

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 16, right: 16),
      height: 40,
      decoration: BoxDecoration(
          color: ColorName.white,
          border: Border.all(color: ColorName.mercury),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
            controller: editingController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 16, bottom: 10),
              border: InputBorder.none,
              hintStyle: AppThemeData.font14Weight400Gray,
              hintText: AppLocalizations.of(context).searchBarText,
            ),
          )),
          InkWell(
            onTap: () {
              onSearchTap(editingController.text);
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorName.mercury),
                  color: ColorName.mercury,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(4), bottomRight: Radius.circular(4))),
              height: 40,
              width: 40,
              child: Center(
                  child: Image.asset(
                Assets.images.searchImage.path,
                height: 16,
                width: 16,
                    color: ColorName.black,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
