import 'package:json_annotation/json_annotation.dart';

part "new_home_banner_data.g.dart";

@JsonSerializable()
class NewHomeBannerListData{
  NewHomeBannerListData({this.bannerList});

  factory NewHomeBannerListData.fromJson(Map<String, dynamic> json) => _$NewHomeBannerListDataFromJson(json);

  List<NewHomeBannerData>? bannerList;
  Map<String, dynamic> toJson() => _$NewHomeBannerListDataToJson(this);
}

@JsonSerializable()
class NewHomeBannerData {
  NewHomeBannerData({
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,});
  factory NewHomeBannerData.fromJson(Map<String, dynamic> json) => _$NewHomeBannerDataFromJson(json);

  String? desc;
  num? id;
  String? imagePath;
  num? isVisible;
  num? order;
  String? title;
  num? type;
  String? url;


  Map<String, dynamic> toJson() => _$NewHomeBannerDataToJson(this);
// NewHomeBannerData.fromJson(dynamic json) {
//   desc = json['desc'];
//   id = json['id'];
//   imagePath = json['imagePath'];
//   isVisible = json['isVisible'];
//   order = json['order'];
//   title = json['title'];
//   type = json['type'];
//   url = json['url'];
// }
//
// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['desc'] = desc;
//   map['id'] = id;
//   map['imagePath'] = imagePath;
//   map['isVisible'] = isVisible;
//   map['order'] = order;
//   map['title'] = title;
//   map['type'] = type;
//   map['url'] = url;
//   return map;
// }

}