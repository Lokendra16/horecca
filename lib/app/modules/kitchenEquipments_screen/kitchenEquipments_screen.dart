import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';
import 'package:the_horeca_store/networking/models/kitchenEquipments_model/kitchenEquipment.dart';

import '../../../src/gen/assets.gen.dart';
import '../../../src/gen/colors.gen.dart';

class KitchenEquipmentsScreen extends StatelessWidget {
  const KitchenEquipmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEFEFF0),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        title: Text(
          "Kitchen Equipments",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        actions: [
          SizedBox(


              child: Icon(
                Icons.search,
                color: Color(0xff000000).withOpacity(0.6),
              )),
          const SizedBox(


            width: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xff000000).withOpacity(0.6),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: kitchenEquip?.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            childrenPadding: EdgeInsets.all(7),
            collapsedTextColor: Colors.black87,
            textColor:ColorName.cardinal,
            title: Text(kitchenEquip!
            [index].title),
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(index == 0)
                      for (var i = 0 ; i< kitchen.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: Container(
                            height: 40,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(kitchen![i].title),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 14),
                              ],
                            ),
                          ),
                        ),

                  ]
              )

            ],
          );
        },
      ),
    );
  }
}
