import 'dart:core';
import 'dart:core';

class TableAccessories{
   List<TabAccess>?tabaccess ;
     List<ServingSolution>? servngSolution;
   List<TableTopSolution>?tableTopSolution ;
   List<TablePresentation>?tablePresntation;
   List<CounterSolution>?counterSolution ;
    List<BarSolution>?barSolution;
    List<MenuSignage>?menuSignage;
}

class TabAccess {
  final String title;
  final String collectionId;
  final String handler;
  TabAccess({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class MenuSignage {
  final String title;
  final String collectionId;
  final String handler;

  MenuSignage( {
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class BarSolution {
  final String title;
  final String collectionId;
  final String handler;
  
  BarSolution({
    required this.title,
    required this.collectionId,
    required this.handler,
});

}

class CounterSolution {
  final String title;
  final String collectionId;
  final String handler;

  CounterSolution( {
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class TablePresentation {
  final String title;
  final String collectionId;
  final String handler;
  
  TablePresentation({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class TableTopSolution {
  final String title;
  final String collectionId;
  final String handler;

  TableTopSolution({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class ServingSolution {
  final String title;
  final String collectionId;
  final String handler;

  ServingSolution({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}
List<ServingSolution>servingsolution =[ServingSolution
  ( title: "Appetizers & Side Servers",
collectionId:"435623657783",
handler:"appetizers-side-servers"),

  ServingSolution(
      title: "Snack Server",
      collectionId:"435623821623",
      handler:"snack-server"),

  ServingSolution(
      title: "Cast Iron & Boards",
      collectionId:"435624116535",
      handler:"cast-iron-boards"),

  ServingSolution(
      title: "Wooden Boards",
      collectionId:"435624313143",
      handler:"wooden-boards"),

  ServingSolution(
      title: "Bread Baskets",
      collectionId:" 435624542519",
      handler:"bread-baskets"),

ServingSolution(
    title: "Mini Pans",
    collectionId:"435624706359",
    handler:"mini-pans"),

  ServingSolution(
      title: "Ramekins",
      collectionId:" 435624804663",
      handler:"ramekins"),
];

List<TableTopSolution> tableTopSolution =[
  TableTopSolution(
title: "Condiment and Napkin Holder",
collectionId:" 435625099575",
handler:"condiment-and-napkin-holder"),

  TableTopSolution(  title: "Salt and Pepper",
      collectionId:"435625623863",
      handler:"salt-and-pepper"),
  
  TableTopSolution(title: "Oil and Vinegar",
      collectionId:" 435625787703",
      handler:"oil-and-vinegar"),
  
  TableTopSolution( title: "Butter and Cheese ",
      collectionId:" 435626017079",
      handler:"butter-and-cheese"),

];

List<TablePresentation>tablePresntation =[
  TablePresentation(title: "Placemats",
      collectionId:" 435626475831",
      handler:"bed-bath-linen"),

  TablePresentation(  title: "Vases",
collectionId:"435626672439",
handler:"vases"),

  TablePresentation(
      title: "Table Lamp",
      collectionId:"435626836279",
      handler:"table-lamp"),

];

List<CounterSolution>counterSolution=[CounterSolution(
title: "Bottle and Jars",
collectionId:" 435627426103",
handler:"bottle-and-jars"),

  CounterSolution(
      title: "Double Wall Bowls",
      collectionId:"435627589943",
      handler:"double-wall-bowls"),
   ] ;

List<BarSolution>barSolution =[BarSolution(
title: "Ice Bucket & Coolers",
collectionId:"435627983159",
handler:"ice-bucket-coolers"),

  BarSolution(
      title: "Ashtray",
      collectionId:"435628146999",
      handler:"ashtray"),

    ];

List<MenuSignage>menuSignage=[
MenuSignage(title: "Menu", 
    collectionId:" 440481284407",
    handler:"menu"),

  MenuSignage(title:"Table Chalkboards", 
      collectionId:"440481349943",
      handler:"table chalkboards"),

  MenuSignage(title:"Marker",
      collectionId:"440481382711",
      handler:"marker")
  


];

List<TabAccess>tabaccess=[
  TabAccess(
title: "Serving Solution",
collectionId:"435395658039",
handler:"serving-solution"),
  
  TabAccess(  title: "Table Top Solution",
      collectionId:"435395690807",
      handler:"table-top-solution"),

  TabAccess(title: "Table Presentation",
      collectionId:"435395756343",
      handler:"table-presentation"),
  
  TabAccess(
      title: "Counter Solution",
      collectionId:" 435395789111",
      handler:"counter-solution"),

  TabAccess(
      title: "Bar Solution",
      collectionId:" 435395821879",
      handler:"bar-solution"),

  TabAccess(title: "Menu & Signage ",
      collectionId:"44048167762",
      handler:"menu & signage")
] ;