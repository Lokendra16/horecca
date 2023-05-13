import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/utils/app_theme_data.dart';
import '../../../../l10n/localization.dart';
import '../../../../src/gen/assets.gen.dart';
import '../../my_order_screen/controller/order_list_controller.dart';
import '../../my_order_screen/model/order_model.dart';
import '../../saved_address_screen/controller/address_list_controller.dart';

class OrderSummary extends StatelessWidget {
  OrderSummary({
    Key? key,
    required this.item,
  }) : super(key: key);
  final OrderModel item;
  final OrderListController controller = Get.put(OrderListController());
  final addresscontroller = Get.put(AddressListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_ios)),
              SizedBox(
                width: 70,
              ),
              Image.asset(
                Assets.images.icAppicon.path,
                height: 60,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Text(
                  "${AppLocalizations.of(context).order} :",
                  style: AppThemeData.sf500Font16Black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  item?.name ?? 'N/A',
                  style: AppThemeData.sf500Font16Black,
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
                  style: AppThemeData.sf500Font16Black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  item?.processedAt.parseDate() ?? 'N/A',
                  style: AppThemeData.sf500Font16Black,
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
                  style: AppThemeData.sf500Font16Black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  item?.financialStatus ?? 'N?A',
                  style: AppThemeData.sf500Font16Black,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Product ",
                      style: AppThemeData.sf500Font14Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Price ",
                      style: AppThemeData.sf500Font14Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Quantity",
                      style: AppThemeData.sf500Font14Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total",
                      style: AppThemeData.sf500Font14Black,
                    ),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "xyz product",
                      style: AppThemeData.sf500Font14Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "AED:40 ",
                      style: AppThemeData.sf500Font12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "4",
                      style: AppThemeData.sf500Font14Black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${item.totalAmount} ${item.totalCC}",
                      style: AppThemeData.sf500Font14Black,
                    ),
                  ),
                ])
              ],
            ),
          ),
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "SubTotal",
                    style: AppThemeData.sf500Font14Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "AED :160 ",
                    style: AppThemeData.sf500Font12,
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Shipping Charges",
                    style: AppThemeData.sf500Font14Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "AED :25",
                    style: AppThemeData.sf500Font12,
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Tax (VAT 5.0%",
                    style: AppThemeData.sf500Font14Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "AED :21",
                    style: AppThemeData.sf500Font12,
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Total :",
                    style: AppThemeData.sf500Font14Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${item?.totalAmount} ${item?.totalCC}",
                    style: AppThemeData.sf500Font14Black,
                  ),
                ),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Payment Status",
                    style: AppThemeData.sf500Font14Black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item?.financialStatus ?? 'N/A',
                    style: AppThemeData.sf500Font14Black,
                  ),
                ),
              ]),
            ],
          ),
          //    SizedBox(height: 20,),
          //  Container(
          //    decoration: BoxDecoration( border: Border.all(color: Colors.black.withOpacity(0.4),),
          //        borderRadius: BorderRadius.circular(8)),
          //    child:  Padding(
          //      padding: const EdgeInsets.all(8.0),
          //      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          //        children: [
          //
          //          Text("Billing Address",style: AppThemeData.font16Weight600Playfair,),
          //          SizedBox(height: 5,),
          //          Row(
          //            children: [
          //              Text("Name :"),
          //              Text(""),
          //            ],
          //          ),
          //          SizedBox(height: 5,),
          //          Row(
          //            children: [
          //              Text("Address :"),
          //
          //            ],
          //          ),
          //          SizedBox(height: 5,),
          //          Row(
          //            children: [
          //              Text("Pin Code :"),
          //            ],
          //          ),
          //          SizedBox(height: 5,),
          //          Row(
          //            children: [
          //              Text("Phone :"),
          //            ],
          //          ),
          //
          //
          //        ],
          //      ),
          //    ),
          //  ),
          //
          // SizedBox(height: 20,),
          // Container(
          //   decoration: BoxDecoration( border: Border.all(color: Colors.black.withOpacity(0.4),),
          //       borderRadius: BorderRadius.circular(8)),
          //   child:  Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text("Shipping Address",style: AppThemeData.font16Weight600Playfair,),
          //         SizedBox(height: 5,),
          //         Row(
          //           children: [
          //             Text("Name :"),
          //           ],
          //         ),
          //         SizedBox(height: 5,),
          //         Row(
          //           children: [
          //             Text("Address :"),
          //           ],
          //         ),
          //         SizedBox(height: 5,),
          //         Row(
          //           children: [
          //             Text("Pin Code :"),
          //           ],
          //         ),
          //         SizedBox(height: 5,),
          //         Row(
          //           children: [
          //             Text("Phone :"),
          //           ],
          //         ),
          //
          //       ],
          //     ),
          //   ),
          // ),
        ]),
      ),
    );
  }
}
