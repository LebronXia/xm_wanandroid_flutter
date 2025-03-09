// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_home_banner_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewHomeBannerListData _$NewHomeBannerListDataFromJson(
  Map<String, dynamic> json,
) => NewHomeBannerListData(
  bannerList:
      (json['bannerList'] as List<dynamic>?)
          ?.map((e) => NewHomeBannerData.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$NewHomeBannerListDataToJson(
  NewHomeBannerListData instance,
) => <String, dynamic>{'bannerList': instance.bannerList};

NewHomeBannerData _$NewHomeBannerDataFromJson(Map<String, dynamic> json) =>
    NewHomeBannerData(
      desc: json['desc'] as String?,
      id: json['id'] as num?,
      imagePath: json['imagePath'] as String?,
      isVisible: json['isVisible'] as num?,
      order: json['order'] as num?,
      title: json['title'] as String?,
      type: json['type'] as num?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$NewHomeBannerDataToJson(NewHomeBannerData instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
