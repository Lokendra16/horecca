// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      availability: json['availability'] as String?,
      bestPrice: json['bestPrice'] as int?,
      brand: json['brand'] as String?,
      capacity: json['capacity'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      color: json['color'] as String?,
      description: json['description'] as String?,
      dfGroupingId: json['dfGroupingId'] as String?,
      dfid: json['dfid'] as String?,
      dfscore: (json['dfscore'] as num?)?.toDouble(),
      groupId: json['groupId'] as String?,
      gtin: json['gtin'] as String?,
      handle: json['handle'] as String?,
      id: json['id'] as String?,
      imageLink: json['imageLink'] as String?,
      link: json['link'] as String?,
      mpn: json['mpn'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      size: json['size'] as String?,
      tags: json['tags'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      casePack: json['casePack'] as String?,
      uom: json['uom'] as String?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'availability': instance.availability,
      'bestPrice': instance.bestPrice,
      'brand': instance.brand,
      'capacity': instance.capacity,
      'categories': instance.categories,
      'color': instance.color,
      'description': instance.description,
      'dfGroupingId': instance.dfGroupingId,
      'dfid': instance.dfid,
      'dfscore': instance.dfscore,
      'groupId': instance.groupId,
      'gtin': instance.gtin,
      'handle': instance.handle,
      'id': instance.id,
      'imageLink': instance.imageLink,
      'link': instance.link,
      'mpn': instance.mpn,
      'price': instance.price,
      'size': instance.size,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'casePack': instance.casePack,
      'uom': instance.uom,
    };
