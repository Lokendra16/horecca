import 'package:the_horeca_store/l10n/localization.dart';

class KitchenEquipment{
  List<KitchenEquip>?kitchenEquip;
  List<Kitchen>? kitchen;

}

class KitchenEquip {
  final String title;
  final String collectionId;
  final String handler;

  KitchenEquip({
    required this.title,
    required this.collectionId,
    required this.handler,
  });
}

class Equipments {
  final String title;
  final String collectionId;
  final String handler;
  Equipments({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}

class Kitchen {
  final String title;
  final String collectionId;
  final String handler;
  Kitchen({
    required this.title,
    required this.collectionId,
    required this.handler,
});
}
List<Kitchen> kitchen=[
  Kitchen( title: "Cooking",
      collectionId:"437668741431",
      handler:"cooking"),
  Kitchen(  title: "Oven",
      collectionId:"437668774199",
      handler:"oven"),
Kitchen(
    title: "Preparation Machines",
    collectionId:"437668806967",
    handler:"preparation-machines"),
  Kitchen(
      title: "Cold Line",
      collectionId:"437668839735",
      handler:"cold-line"),
  Kitchen(  title: "Cold Display",
      collectionId:"437668872503",
      handler:"cold-display"),
  Kitchen(
      title: "Banqueting Trolley",
      collectionId:"437668905271",
      handler:"banqueting-trolley-1"),
  Kitchen(
      title: "Dishwasher",
      collectionId:" 437668938039",
      handler:"dishwasher"),

];

List<KitchenEquip>kitchenEquip=[
  KitchenEquip(  title: "Kitchen Equipment",
collectionId:"433094787383",
handler:"kitchen-equipment"),

];