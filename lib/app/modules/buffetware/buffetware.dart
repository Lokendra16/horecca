import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_horeca_store/app/modules/home_screen/controller/home_screen_controller.dart';
import 'package:the_horeca_store/extensions/assets_ext.dart';

import '../../../networking/models/buffetware/buffetware_model.dart';
import '../../../src/gen/assets.gen.dart';
import '../../../src/gen/colors.gen.dart';
import '../home_screen/view/home_category_widget.dart';
import '../home_screen/view/home_products_widget.dart';
import '../product_list/view/product_list_screen.dart';

class Buffet extends StatelessWidget {
   Buffet({Key? key}) : super(key: key);

   final HomeScreenController controller = Get.put(HomeScreenController());

   @override
  Widget build(BuildContext context) {
    return Scaffold
      (
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
          "GuestRoom",
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
        itemCount:buffe?.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            childrenPadding: EdgeInsets.all(7),
            collapsedTextColor: Colors.black87,
            textColor:ColorName.cardinal,
            title: Text(buffe!
            [index].title),
            children: <Widget>[
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(index == 0)
                      for (var i = 0 ; i< buffetwareStand!.length ; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 10),
                          child: Container(
                            height: 40,
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: (){

                                  },
                                    child: Text(buffetwareStand![i].title)),
                                Assets.icons.icArrowForward.svgIcon(
                                    color: ColorName.black,size: 14),
                              ],
                            ),
                          ),
                        ),
                             ]

                           )
                          // ListTile(
                          //   tileColor: Colors.white54,
                          //   leading:  Text(buffetwareStand![i].title),
                          // ),







            ],
          );


        },
      ),
    );
  }
}
