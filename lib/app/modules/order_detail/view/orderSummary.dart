import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../commons/utils/app_theme_data.dart';
import '../../../../l10n/localization.dart';
import '../../../../src/gen/assets.gen.dart';
import '../../my_order_screen/controller/order_list_controller.dart';
import '../../my_order_screen/model/order_model.dart';
import '../../saved_address_screen/controller/address_list_controller.dart';

class OrderSummary extends StatelessWidget {
   OrderSummary({Key? key, required this.item,}) : super(key: key);
  final OrderModel item;
  final OrderListController controller = Get.put(OrderListController());
   final addresscontroller = Get.put(AddressListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(

        children: [
        Image.asset(
        Assets.images.icAppicon.path,
          height: 60,
        ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(

              children: [
                Text(
                  "${AppLocalizations.of(context).order} :",
                  style: AppThemeData.font16Weight600PlayfairBlack,
                ),
                SizedBox(width: 10,),
                Text(
                  item?.name ?? 'N/A',
                  style: AppThemeData.font16Weight600PlayfairBlack,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(

              children: [
                Text(
                  "${AppLocalizations.of(context).date} :",
                  style: AppThemeData.font16Weight600PlayfairBlack,
                ),
                SizedBox(width: 10,),
                Text(
                  item?.processedAt.parseDate()?? 'N/A',
                  style: AppThemeData.font16Weight600PlayfairBlack,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(

              children: [
                Text(
                  "${AppLocalizations.of(context).paymentStatus} :",
                  style: AppThemeData.font16Weight600PlayfairBlack,
                ),
                SizedBox(width: 10,),
                Text(
                  item?.financialStatus ??'N?A',
                  style: AppThemeData.font16Weight600PlayfairBlack,
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child:Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Text("Product "),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Price "),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Quantity "),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Total "),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Text("xyz product "),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("AED:40 "),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("4 "),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Text("${item.totalAmount} ${item.totalCC}"),
                      ),
                    ]
                )

              ],
            ),
          ),
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text("SubTotal "),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text("AED :160 "),
                    ),
                  ]

              ),
              TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text("Shipping Charges "),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text("AED :25 "),
                    ),
                  ]

              ),
              TableRow(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text("Tax (VAT 5.0%"),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text("AED :21 "),
                    ),
                  ]
              ),
              TableRow(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text("Total :"),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${item?.totalAmount} ${item?.totalCC}"),
                    ),
                  ]
              ),
              TableRow(

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text("Payment Status"),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:   Text(item?.financialStatus ?? 'N/A'),
                    ),
                  ]
              ),

            ],
          ),
             SizedBox(height: 20,),
           Container(
             decoration: BoxDecoration( border: Border.all(color: Colors.black.withOpacity(0.4),),
                 borderRadius: BorderRadius.circular(8)),
             child:  Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   Text("Billing Address",style: AppThemeData.font16Weight600Playfair,),
                   SizedBox(height: 5,),
                   Row(
                     children: [
                       Text("Name :"),
                       Text(""),
                     ],
                   ),
                   SizedBox(height: 5,),
                   Row(
                     children: [
                       Text("Address :"),

                     ],
                   ),
                   SizedBox(height: 5,),
                   Row(
                     children: [
                       Text("Pin Code :"),
                     ],
                   ),
                   SizedBox(height: 5,),
                   Row(
                     children: [
                       Text("Phone :"),
                     ],
                   ),


                 ],
               ),
             ),
           ),

          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration( border: Border.all(color: Colors.black.withOpacity(0.4),),
                borderRadius: BorderRadius.circular(8)),
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shipping Address",style: AppThemeData.font16Weight600Playfair,),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text("Name :"),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text("Address :"),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text("Pin Code :"),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text("Phone :"),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ]
        ),
      ),
    );
  }
}
