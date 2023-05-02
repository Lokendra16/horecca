import 'package:flutter/material.dart';
import 'package:the_horeca_store/app/widgets/product_gridview/product_gridview_model.dart';
import 'package:the_horeca_store/app/widgets/product_gridview/product_gridview_widget.dart';
class ProductGridView extends StatelessWidget {

  const ProductGridView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: myGridList.length,
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2 / 1,

        ),
      itemBuilder: (BuildContext context ,index){
        return  ProductGridviewWidget(myGridListData: myGridList, index: index,);
      },
    );
  }
}
