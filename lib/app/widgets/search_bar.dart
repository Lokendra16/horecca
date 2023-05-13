import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_horeca_store/app/modules/product_list/controller/product_listview_controller.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class SearchBar extends StatelessWidget {
  final Function(String searchKey) onSearchTap;
  final TextEditingController? searchController;
  final Function(String) onChange;
  final Function(String) onSubmit;
  final Widget suffixIcon;


  SearchBar(
      {Key? key,
      required this.onSearchTap,
      this.searchController,
      required this.onChange,
      required this.onSubmit, required this.suffixIcon,})
      : super(key: key);

  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 16, right: 16),
      height: 40,
      decoration: BoxDecoration(
          color: ColorName.silver.withOpacity(0.3),
          border: Border.all(color: ColorName.mercury),
          borderRadius: BorderRadius.circular(5)),
      child: InkWell(
        onTap: () {
          onSearchTap(editingController.text);
        },
        child: Row(
          children: [
            Expanded(
                child:
                   TextFormField(
                    enableSuggestions: true,
                    controller: searchController,
                    onChanged: (value) {
                      print('search cont ${searchController!.text}');

                     onChange(value);

                    },
                    onFieldSubmitted: (txt) {
                      onSubmit(txt);
                      debugPrint('txt : $txt');
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 16, bottom: 10),
                      border: InputBorder.none,
                      hintStyle: AppThemeData.font14Weight400Gray,
                      hintText: AppLocalizations.of(context).searchBarText,
                      suffixIcon:suffixIcon
                  ),

            )

            )
          ],
        ),
      ),
    );
  }
}
