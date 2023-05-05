class BedBath{
  List<BedBathLinen>?bedbath;
  List<Bed>?bed;
   List<Bath>?bath;
}

class BedBathLinen {
  final String title;
  final String collectionId;
  final String handler;
  BedBathLinen({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class Bath {
  final String title;
  final String collectionId;
  final String handler;
  Bath({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class Bed {
  final String title;
  final String collectionId;
  final String handler;
  Bed({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}
List<Bed>bed=[Bed(
    title: "Cotton Sheets and Duvet Covers",
    collectionId:"437669101879",
    handler:"cotton-sheets-and-duvet-covers"),

 Bed(title: "Poly Cotton Sheets and Duvet Covers",
     collectionId:"437669134647",
     handler:"poly-cotton-sheets-and-duvet-covers"),

  Bed( title: "Pillows",
      collectionId:"437669200183",
      handler:"pillows-2"),

 Bed( title: "Mattress and Pillow Protector",
     collectionId:"437669232951",
     handler:"mattress-and-pillow-protector-1"),

  Bed(
      title: "Feather & Synthetic Duvets",
      collectionId:" 435628933431",
      handler:"feather-synthetic-duvets"),
];
List<Bath>bath = [Bath(
    title: "Towels",
    collectionId:"435397558583",
    handler:"towels"),

  Bath( title: "BathRobes",
      collectionId:" 435397591351",
      handler:"bathrobes"),

  Bath( title: "Pool & Gym",
      collectionId:"435397656887",
      handler:"pool-gym"),
];
List<BedBathLinen>bedbath = [
  BedBathLinen(  title: "Bed Linen",
      collectionId:"437669069111",
      handler:"bed-linen"),

  BedBathLinen( title: "Bath Linen",
      collectionId:" 437669298487",
      handler:"bath-linen"),
];