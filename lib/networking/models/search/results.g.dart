// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      availability: json['availability'] as String?,
      best_price: (json['best_price'] as num?)?.toDouble(),
      brand: json['brand'] as String?,
      capacity: json['capacity'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      color: json['color'] as String?,
      description: json['description'] as String?,
      df_grouping_id: json['df_grouping_id'] as String?,
      dfid: json['dfid'] as String?,
      dfscore: (json['dfscore'] as num?)?.toDouble(),
      group_id: json['group_id'] as String?,
      gtin: json['gtin'] as String?,
      handle: json['handle'] as String?,
      id: json['id'] as String?,
      image_link: json['image_link'] as String?,
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
      'best_price': instance.best_price,
      'brand': instance.brand,
      'capacity': instance.capacity,
      'categories': instance.categories,
      'color': instance.color,
      'description': instance.description,
      'df_grouping_id': instance.df_grouping_id,
      'dfid': instance.dfid,
      'dfscore': instance.dfscore,
      'group_id': instance.group_id,
      'gtin': instance.gtin,
      'handle': instance.handle,
      'id': instance.id,
      'image_link': instance.image_link,
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
