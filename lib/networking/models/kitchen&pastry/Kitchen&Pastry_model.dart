import 'package:the_horeca_store/l10n/localization.dart';

class KitchenPastry{
   List<Kitchendata>?kitchendata;
   List<Cookware>? cookware;
   List<GastronormsFood>? gastronorm;
   List<KitchenUtensils>? kitchenutensil;
   List<PastryBakery>?pastryBakery;
   List<Knives>?knives;
   List<BreadPizza>?breadpizza;
   List<StorageTransport>? strorageTransport;
   List<Hygiene>?hygiene;

}

class Kitchendata {
  final String title;
  final String collectionId;
  final String handler;
  
  Kitchendata({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class Cookware {
  final String title;
  final String collectionId;
  final String handler;

  Cookware({
    required this.title,
    required this.collectionId,
    required this.handler,
});

}

class GastronormsFood {
  final String title;
  final String collectionId;
  final String handler;

  GastronormsFood({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class KitchenUtensils {
  final String title;
  final String collectionId;
  final String handler;

  KitchenUtensils({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class PastryBakery {
  final String title;
  final String collectionId;
  final String handler;

  PastryBakery({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class Knives {
  final String title;
  final String collectionId;
  final String handler;
  Knives({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class BreadPizza {
  final String title;
  final String collectionId;
  final String handler;
  BreadPizza({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class StorageTransport {
  final String title;
  final String collectionId;
  final String handler;
  StorageTransport({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class Hygiene {
  final String title;
  final String collectionId;
  final String handler;
  Hygiene({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

List<Cookware> cookware=[Cookware(  title: "Bain Marie",
collectionId:"437667168567",
handler:"bain-marie"),
  Cookware(
      title: "Asian Kitchen",
      collectionId:"437667201335",
      handler:"asian-kitchen"),
];

List<GastronormsFood> gastronorm=[
  GastronormsFood(
      title: "GN Pans Polypropylene",
      collectionId:"437667430711",
      handler:"gn-pans-polypropylene"),
  GastronormsFood(
      title: "Food Containers",
      collectionId:"437667463479",
      handler:"food-containers"),
];

List<KitchenUtensils> kitchenutensil=[
  KitchenUtensils(
      title: "Colander Strainer & Ladles",
      collectionId:"437667561783",
      handler:"colander-strainer-ladles"),
  KitchenUtensils(
      title: "Spatula & Whisk",
      collectionId:"437667594551",
      handler:"spatula-whisk"),
  KitchenUtensils(
      title: "Mixing Bowls, Funnel & Jug",
      collectionId:"437667660087",
      handler:"mixing-bowls-funnel-jug"),
  KitchenUtensils( title: "Graters, Cutters & Slicers",
     collectionId:" 437667692855",
     handler:"graters-cutters-slicers"),
  KitchenUtensils(
      title: "Thermometers",
      collectionId:"437667758391",
      handler:"thermometers"),
  KitchenUtensils(
      title: "Spice Box & Grinder",
      collectionId:"437667856695",
      handler:"spice-box-grinder"),
  KitchenUtensils(
      title: "Squeezer, Towels & Recipe Holder ",
      collectionId:"437667889463",
      handler:"squeezer-towels-recipe-holder"),
];

List<PastryBakery>pastryBakery=[

];

List<Knives>knives=[Knives(
title: "Cutting Boards",
collectionId:" 437667954999",
handler:"cutting-boards"),
  Knives(
      title: "knives",
      collectionId:"437656813879",
      handler:"knives"),
];

List<BreadPizza> breadpizza=[
  BreadPizza(
      title: "Pizza & Can Opener",
      collectionId:"437668020535",
      handler:"pizza-can-opener"),
  BreadPizza(
      title: "Baking Trays & Dish",
      collectionId:" 437668053303",
      handler:"baking-trays-dish"),
  BreadPizza( title: "Gloves, Tongs & Accessories",
      collectionId:"437668086071",
      handler:"gloves-tongs-accessories"),

];

List<StorageTransport> strorageTranspor=[
  StorageTransport(
      title: "Storage Crates",
      collectionId:" 437668184375",
      handler:"storage-crates"),
  StorageTransport(
      title: "Ingredient Bins & Scoop",
      collectionId:"437668217143",
      handler:"ingredient-bins-scoop"),
  StorageTransport(
      title: "Insulated Containers",
      collectionId:"437668282679",
      handler:"insulated-containers"),
  StorageTransport(
      title: "Serving Trolleys",
      collectionId:"437668380983",
      handler:"serving-trolleys"),
  StorageTransport(
      title: "Banqueting Trolley",
      collectionId:"437668905271",
      handler:"banqueting-trolley-1"),
];

List<Hygiene>hygien=[
  Hygiene(title: "Insect Killer",
collectionId:"437668479287",
handler:"insect-killer"),

  Hygiene(title: "Kitchen Bins",
collectionId:"437668512055",
handler:"kitchen-bins"),
];

List<Kitchendata>?kitchendata=[
  Kitchendata(
title: "Gastronorm Food Pans",
collectionId:" 437667234103",
handler:"gastronorm-food-pans"),

Kitchendata(  title: "knives",
    collectionId:"437656813879",
    handler:"knives"),

  Kitchendata(
      title: "Bread & Pizza",
      collectionId:"437667987767",
      handler:"bread-pizza"),

  Kitchendata(
      title: "Storage & Transport",
      collectionId:"437668118839",
      handler:"storage-transport"),

Kitchendata(  title: "Hygiene",
    collectionId:"437668446519",
    handler:"hygiene"),


];