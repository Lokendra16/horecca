import 'package:flutter/material.dart';
import 'package:the_horeca_store/app/modules/my_order_screen/model/order_model.dart';
import 'package:the_horeca_store/app/widgets/primary_button.dart';
import 'package:the_horeca_store/commons/utils/app_theme_data.dart';
import 'package:the_horeca_store/l10n/localization.dart';
import 'package:the_horeca_store/src/gen/assets.gen.dart';
import 'package:the_horeca_store/src/gen/colors.gen.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.item}) : super(key: key);
  final OrderModel item;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      elevation: 6,
      shape: const RoundedRectangleBorder(
        /* side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),*/
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      color: ColorName.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${AppLocalizations.of(context).order} :",
                    style: AppThemeData.font16Weight400,
                  ),
                  Text(
                    item.name ?? 'N/A',
                    style: AppThemeData.font16Weight400,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${AppLocalizations.of(context).date} :",
                    style: AppThemeData.font16Weight400,
                  ),
                  Text(
                    item.processedAt.parseDate() ?? 'N/A',
                    style: AppThemeData.font16Weight400,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${AppLocalizations.of(context).paymentStatus} :",
                    style: AppThemeData.font16Weight400,
                  ),
                  Text(
                    item.financialStatus ?? 'N/A',
                    style: AppThemeData.font16Weight400,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${AppLocalizations.of(context).fulfillmentStatus} :",
                    style: AppThemeData.font16Weight400,
                  ),
                  Text(
                    item.fulfillmentStatus ?? 'N/A',
                    style: AppThemeData.font16Weight400,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${AppLocalizations.of(context).total} :",
                    style: AppThemeData.font16Weight400,
                  ),
                  Text(
                    "${item.totalAmount} ${item.totalCC}",
                    style: AppThemeData.font16Weight400,
                  )
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
