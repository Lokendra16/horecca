import 'package:the_horeca_store/l10n/localization.dart';

class LiveCooking {
   List<LiveCookingModule>?livecookingModule;
   List<LivCooking>?livecooking;
   List<ModularKitchen>?modularKitchen ;
}

class LiveCookingModule {
  final String title;
  final String collectionId;
  final String handler;
  LiveCookingModule({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class LivCooking {
  final String title;
  final int collectionId;
  final String handler;
  LivCooking( {
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class ModularKitchen {
  final String title;
  final int collectionId;
  final String handler;

  ModularKitchen({
    required this.title,
    required this.collectionId,
    required this.handler,

  });
}
List<LivCooking>livecooking=[
  LivCooking(
title: "Foldable Table Frames",
collectionId:437665726775,
handler:"foldable-table-frames"),

  LivCooking(
      title: "Table Top Units",
      collectionId: 437665759543,
      handler:"table-top-units"),

  LivCooking(
      title: "Warm Buffet",
      collectionId:437665792311,
      handler:"warm-buffet"),

  LivCooking(
      title: "Cold Buffet",
      collectionId: 437666021687,
      handler:"cold-buffet"),

  LivCooking( title: "Cooking Module",
      collectionId:437666119991,
      handler:"cooking-module"),

  LivCooking(
      title: "Side Station",
      collectionId:437666152759,
      handler:"side-station"),

  LivCooking(
      title: "Middle Shelf",
      collectionId:437666251063,
      handler:"middle-shelf"),
  
  LivCooking(
      title: "Blind",
      collectionId:437666316599,
      handler:"blind"),

  LivCooking( title: "Trolleys",
      collectionId:437666349367,
      handler:"trolleys"),
  

  
    ];
List<ModularKitchen>modularKitchen=[
  ModularKitchen( title: "Lectern",
      collectionId:437666414903,
      handler:"lectern"),

 ModularKitchen(
     title: "Coffee & Tea Break",
     collectionId:437666480439,
     handler:"coffee-tea-break"),

 ModularKitchen(
     title: "Signage Stand A2 Portrait",
     collectionId:437666513207,
     handler:"signage-stand-a2-portrait"),

  ModularKitchen(
      title: "Signage Stand A2 Landscape",
      collectionId:437666545975,
      handler:"signage-stand-a2-landscape"),
  
  ModularKitchen(
      title: "Signage Stand A3 Portrait ",
      collectionId:437666611511,
      handler:"signage-stand-a3-portrait"),
  
  ModularKitchen(
      title: "Signage Stand A4 Portrait ",
      collectionId:437666677047,
      handler:"signage-stand-a4-portrait"),
  
  ModularKitchen(
      title: "Signage Stand A4 Portrait",
      collectionId:437666677047,
      handler:"signage-stand-a4-landscape"),


] ;
List<LiveCookingModule>?livecookingModule=[LiveCookingModule(
    title: "Live Cooking & Modular Buffet",
    collectionId:"433094983991",
    handler:"modular-buffet-station"),

  LiveCookingModule(title: "Trolleys",
      collectionId:"437666349367",
      handler:"trolleys"),
];