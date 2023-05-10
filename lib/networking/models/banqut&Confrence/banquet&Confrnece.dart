class BanquetConfrence{
   List<BanquetList>?banquetList;
   List<BanquetChairs>?banquetChair;
   List<ConfrenceTable>?confrneceTable;
   List<BanquetsTable>?banquetstable;
   List<CockTailTable>?cockTailTable;
   List<TableTrolly>?tableTrolly;
   List<StageLecterns>?stageLecterns;
   List<DanceFloorSeparator>?danceFloorSeprator;

}

class BanquetList {
  final String title;
  final String collectionId;
  final String handler;
  BanquetList({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class BanquetChairs {
  final String title;
  final int collectionId;
  final String handler;
  BanquetChairs({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class ConfrenceTable {
  final String title;
  final int collectionId;
  final String handler;
  ConfrenceTable({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class BanquetsTable {
  final String title;
  final int collectionId;
  final String handler;
  BanquetsTable({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class CockTailTable {
  final String title;
  final int collectionId;
  final String handler;
  CockTailTable({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class TableTrolly {
  final String title;
  final int collectionId;
  final String handler;
  TableTrolly({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class StageLecterns {
  final String title;
  final int collectionId;
  final String handler;
  StageLecterns({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class DanceFloorSeparator {
  final String title;
  final int collectionId;
  final String handler;
  DanceFloorSeparator({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}
List<BanquetChairs>banquetChair =[BanquetChairs
  (  title: "Savoy",
    collectionId:437671231799,
    handler:"savoy"),
  BanquetChairs(
      title: "Phoenix",
      collectionId:437671264567,
      handler:"phoenix"),
  BanquetChairs(
      title: "Verona",
      collectionId:437671297335,
      handler:"verona"),
  BanquetChairs(
      title: "Tucson",
      collectionId:437671395639,
      handler:"tucson"),

  BanquetChairs(
      title: "Jemima",
      collectionId:437671428407,
      handler:"jemima"),

  BanquetChairs(
      title: "Duke",
      collectionId:437671461175,
      handler:"duke"),
  BanquetChairs(
      title: "Regetta",
      collectionId:437671493943,
      handler:"regetta"),

  BanquetChairs(
      title: "Chair Trolley",
      collectionId:437671526711,
      handler:"chair-trolley"),

];

List<ConfrenceTable>confrneceTable = [
  ConfrenceTable(
title: "Ash Classroom Rectangle Table",
collectionId:437671625015,
handler:"ash-classroom-rectangle-table"),
  ConfrenceTable(
      title: "Ash Modesty Panel",
      collectionId:437671723319,
      handler:"ash-modesty-panel"),
  ConfrenceTable(
      title: "Walnut Modesty Panel",
      collectionId:437671854391,
      handler:"walnut-modesty-panel"),
  ConfrenceTable(
      title: "Beechwood Classroom Rectangle Table",
      collectionId:437672018231,
      handler:"beechwood-classroom-rectangle-table"),

  ConfrenceTable(
      title: "Beechwood Modesty Panel",
      collectionId:437672083767,
      handler:"beechwood-modesty-pane"),
  ConfrenceTable( title: "AshHalf Round Table",
      collectionId:437672149303,
      handler:"ashhalf-round-table"),

  ConfrenceTable(
      title: "WalnutHalf Round Table",
      collectionId:437672182071,
      handler:"walnuthalf-round-table"),

  ConfrenceTable( title: "Beechwood Half Round Table",
      collectionId:437672214839,
      handler:"beechwood-half-round-table"),

  ConfrenceTable( title: "Ash Quarter Round Table",
      collectionId:437672247607,
      handler:"ash-quarter-round-table"),

  ConfrenceTable(
      title: "Walnut Quarter Round Table",
      collectionId:437672378679,
      handler:"walnut-quarter-round-table"),
  ConfrenceTable(
      title: "Beechwood Quarter Round Table",
      collectionId:437672444215,
      handler:"beechwood-quarter-round-table"),
];

List<BanquetsTable>banquetstable = [BanquetsTable(
    title: "Soft Top Round Table ",
    collectionId:437672509751,
    handler:"soft-top-round-table"),

  BanquetsTable(
      title: "Ash Round Table (Linen Free)",
      collectionId:437672542519,
      handler:"ash-round-table-linen-free"),

  BanquetsTable(
title: "Walnut Round Table (Linen Free)",
collectionId:437672608055,
handler:"walnut-round-table-linen-free"),

  BanquetsTable(
      title: "Beechwood Round Table (Linen Free)",
      collectionId:437672673591,
      handler:"beechwood-round-table-linen-free"),

   ];

List<CockTailTable>cockTailTable=[

 CockTailTable(title: "Ash Flip Top Cocktail Table",
    collectionId:437672739127,
    handler:"ash-flip-top-cocktail-table"),
  CockTailTable(
      title: "Walnut Flip Top Cocktail Table",
      collectionId:437672771895,
      handler:"walnut-flip-top-cocktail-table"),
  CockTailTable(
      title: "Beechwood Flip Top Cocktail Table",
      collectionId:437672804663,
      handler:"beechwood-flip-top-cocktail-table"),
];

List<TableTrolly>tableTrolly=[
  TableTrolly( title: "Round Table Trolley",
    collectionId:437672902967,
    handler:"round-table-trolley"),

  TableTrolly(
      title: "Rectangular Table & Modesty Panel Trolley",
      collectionId:437672935735,
      handler:"rectangular-table-modesty-panel-trolley"),

  TableTrolly(
      title: "Rectangular Table Trolley",
      collectionId:437672968503,
      handler:"rectangular-table-trolley"),
];

List<StageLecterns>stageLecterns=[
  StageLecterns(title:"Occasion Portable Stage" , 
      collectionId:437673099575,
      handler:"occasion portable stage"),
  StageLecterns(title: "Stage Steps",
      collectionId:437673132343,
      handler:"stage steps"),
  
  StageLecterns(title: "Smart Lectern",
      collectionId:437673197879,
      handler: "smart lectern"),
  
  StageLecterns(title: "Spectrum Lectern",
      collectionId:437673263415,
      handler:"spectrum lectern"),
  
  StageLecterns(title: "Ohio Lectern",
      collectionId:437673296183,
      handler:"ohio lectern")
];
List<DanceFloorSeparator>danceFloorSeprator=[
  DanceFloorSeparator(title:"Ash Partition Screen ",
      collectionId:437673394487, handler:"ash partition screen"),
  
  DanceFloorSeparator(title: "Walnut Partition Screen",
      collectionId:437673427255,
      handler:  "Walnut Partition Screen"),
  
  DanceFloorSeparator(title: "Beechwood Partition Screen", 
      collectionId: 437673460023,
      handler: "beechwood partition screen"),
  
  DanceFloorSeparator(title: "Portable Dance Floor",
      collectionId:437673492791,
      handler:"portable dance floor"),
  
  DanceFloorSeparator(title:"Dance Floor Profile Trim" ,
      collectionId:437673558327,
      handler: "dance floor profile trim"),

  DanceFloorSeparator(title: "Dance Floor Trolley",
      collectionId:437673591095,
      handler: "dance floor trolley"),
  ];

List<BanquetList>?banquetList=[
  BanquetList(
      title: "Banquet Chairs",
      collectionId:"437671199031",
      handler:"banquet-chairs"),
  BanquetList(
      title: "Conference Tables",
      collectionId:"437671592247",
      handler:"conference-tables"),
  BanquetList(
      title: "Banquet Tables",
      collectionId:" 437672476983",
      handler:"banquet-tables"),
  BanquetList(
      title: "Cocktail Tables",
      collectionId:"437672706359",
      handler:"cocktail-tables"),

  BanquetList(
      title: "Table Trolley",
      collectionId:" 437672837431",
      handler:"table-trolley"),
  
  BanquetList(
      title: "Stage & Lecterns ",
      collectionId:"437673066807",
      handler:"stage-lecterns"),

 BanquetList(title:"Dance Floor & Separator",
     collectionId:"437673328951" ,
     handler: "dance floor separator")

];