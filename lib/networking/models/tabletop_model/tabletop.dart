class TableTop{
  List<TableTop>?tabletop;
  List<ChinaWare>?chinaware;
   List<GlassWare>?glassware;
   List<Cutlery>?cutlery;
  final String title;
  final String collectionId;
  final String handler;

  TableTop({ required this.title,
    required this.collectionId,
    required this.handler,});
}

class ChinaWare {
  final String title;
  final String collectionId;
  final String handler;
  ChinaWare({
    required this.title,
    required this.collectionId,
    required this.handler,

});
}

class GlassWare {
  final String title;
  final String collectionId;
  final String handler;
  GlassWare({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class Cutlery {
  final String title;
  final String collectionId;
  final String handler;

  Cutlery({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}
List<Cutlery> cutlery = [
  Cutlery(title: "Collection 2 MM",
      collectionId:"437663990071",
      handler:"collection-2-5-mm"),

  Cutlery(title: "Collection 3 MM",
      collectionId:"437664022839",
      handler:"collection-3-mm"),

  Cutlery(title: "Collection 4 MM",
      collectionId:"437664252215",
      handler:"collection-4-mm"),

  Cutlery(title: "Collection 5 MM",
      collectionId:"437664317751",
      handler:"collection-5-5-mm"),

  Cutlery( title: "Steakknife",
      collectionId:"437664350519",
      handler:"steakknife-1"),

];
List<ChinaWare>chinaware = [
  ChinaWare( title: "Desert",
    collectionId:"442099171639",
    handler:"desert"),

  ChinaWare( title: "Ocean",
collectionId:"442099237175",
handler:"ocean"),

  ChinaWare(title: "Finesse",
collectionId:"442099269943",
handler:"finesse"),

  ChinaWare( title: "Mirage",
  collectionId:"442099335479",
handler:"mirage"),

  ChinaWare(
title: "Craftstone",
collectionId:"442099368247",
handler:"craftstone"),

  ChinaWare( title: "Night and Day",
collectionId:" 442099532087",
handler:"night-and-day"),

  ChinaWare( title: "Festive",
collectionId:"444783624503",
handler:"festive"),

  ChinaWare(title: "Impression",
      collectionId:" 444783690039",
      handler:"impression"),

  ChinaWare( title: "Midnight Blue",
      collectionId:"444783722807",
      handler:"midnight-blue"),

];
List<GlassWare>glassware =[
  GlassWare(
title: "Stemware",
collectionId:"437663629623",
handler:"stemware"),

 GlassWare(  title: "Tumblers",
    collectionId:"437663662391",
    handler:"tumblers"),

  GlassWare( title: "Mini",
      collectionId:"437663695159",
      handler:"mini"),

  GlassWare( title: "Jug, Decanters and Carafe",
      collectionId:"437663760695",
      handler:"jug-decaters-and-carafe"),

  GlassWare( title: "Polycarbonate",
      collectionId:"437663826231",
      handler:"polycarbonate"),

  GlassWare(title: "Barware",
      collectionId:"437663891767",
      handler:"barware"),
];
List<TableTop>tabletop = [TableTop( title: "Glassware",
    collectionId:"435395395895",
    handler:"glassware"),
  TableTop(
      title: "Cutlery",
      collectionId:" 435395494199",
      handler:"cutlery"),
  TableTop(
      title: "Chinaware",
      collectionId:" 435395363127",
      handler:"chinaware"),
];