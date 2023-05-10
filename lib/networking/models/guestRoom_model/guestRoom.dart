
import 'package:the_horeca_store/l10n/localization.dart';

class GuestRoom{
  List<Guestroomdata>?guestroomdata;
   List<GuestRoomSupplies>? guestRoomSupplies;
   List<Electronics>? electronics;
   List<Bathroom>?bathroom;
   List<ChildFriendly>? childFriendly;
}

class Guestroomdata {
  final String title;
  final String collectionId;
  final String handler;
  Guestroomdata({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class ChildFriendly {
  final String title;
  final int collectionId;
  final String handler;
  
  ChildFriendly({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class Bathroom {
  final String title;
  final int collectionId;
  final String handler;
  Bathroom({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class Electronics {
  final String title;
  final int collectionId;
  final String handler;
  Electronics({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class GuestRoomSupplies {
  final String title;
  final int collectionId;
  final String handler;
  GuestRoomSupplies({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}
List<GuestRoomSupplies> guestRoomSupplies=[
  GuestRoomSupplies( title: "SafeBox",
      collectionId: 435629621559,
      handler:"safebox"),

  GuestRoomSupplies( title: "Welcome Tray",
      collectionId:435629916471,
      handler:"welcome-tray"),

  GuestRoomSupplies(
      title: "Ironing Station",
      collectionId:435630047543,
      handler:"ironing-station"),

  GuestRoomSupplies(
      title: "Mirrors",
      collectionId:435631227191,
      handler:"mirrors"),

  GuestRoomSupplies(
      title: "Luggage Rack",
      collectionId:435631259959,
      handler:"luggage-rack"),

];
List<Electronics> electronics=[
  Electronics(   title: "MiniBar",
      collectionId:435631325495,
      handler:"minibar"),

Electronics(
    title: "Kettle",
    collectionId:435631358263,
    handler:"kettle"),

 Electronics(
     title: "Coffee Machine",
     collectionId:435631391031,
     handler:"coffee-machine"),

  Electronics(
      title: "Hair Dryer",
      collectionId: 435631423799,
      handler:"hair-dryer"),

  Electronics(
      title: "Irons",
      collectionId: 435631489335,
      handler:"irons"),

];
List<Bathroom> bathroom=[
  Bathroom( title: "Bathroom Bins",
    collectionId:435631620407,
    handler:"bathroom-bins"),

  Bathroom(
      title: "Tissue Box Holder",
      collectionId:435631751479,
      handler:"tissue-box-holder"),

 Bathroom(title: "Cloth Line",
    collectionId:435631817015,
    handler:"cloth-line"),

  Bathroom(
      title: "Sanitary Bag Dispenser",
      collectionId:435631882551,
      handler:"sanitary-bag-dispenser"),

  Bathroom(
      title: "Bathroom Scale",
      collectionId:435631096119,
      handler:"bathroom-scale"),

];
List<ChildFriendly> childFriendly=[
  ChildFriendly( title: "Cribs",
      collectionId:435631915319,
      handler:"cribs"),
ChildFriendly(
    title: "Bedding",
    collectionId:435632013623,
    handler:"bedding"),

  ChildFriendly(
      title: "Crib Mattress",
      collectionId:435632144695,
      handler:"crib-mattress"),

  ChildFriendly( title: "High Chair",
      collectionId:435632177463,
      handler:"high-chair"),

  ChildFriendly(
      title: "Baby Changing Station",
      collectionId:435632374071,
      handler:"baby-changing-station"),

];
List<Guestroomdata>?guestroomdata=[
  Guestroomdata(
      title: "Guestroom Supplies",
      collectionId:" 435397919031",
      handler:"guestroom-supplies"),

 Guestroomdata( title: "Electronics",
    collectionId:"435398377783",
    handler:"electronics"),

  Guestroomdata(  title: "Bathroom",
      collectionId:" 435398476087",
      handler:"bathroom"),

  Guestroomdata(title: "Child Friendly",
      collectionId:"435398508855",
      handler:"child-friendly-1"),
];