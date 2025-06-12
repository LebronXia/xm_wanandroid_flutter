import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'search_list_model.g.dart';

@JsonSerializable()
class SearchListModel {
  @JsonKey(name: "curPage")
  int? curPage;
  @JsonKey(name: "datas")
  List<SearchListItemModel>? datas;
  @JsonKey(name: "offset")
  int? offset;
  @JsonKey(name: "over")
  bool? over;
  @JsonKey(name: "pageCount")
  int? pageCount;
  @JsonKey(name: "size")
  int? size;
  @JsonKey(name: "total")
  int? total;

  SearchListModel({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory SearchListModel.fromJson(Map<String, dynamic> json) => _$SearchListModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchListModelToJson(this);
}

@JsonSerializable()
class SearchListItemModel {
  @JsonKey(name: "adminAdd")
  bool? adminAdd;
  @JsonKey(name: "apkLink")
  String? apkLink;
  @JsonKey(name: "audit")
  int? audit;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "canEdit")
  bool? canEdit;
  @JsonKey(name: "chapterId")
  int? chapterId;
  @JsonKey(name: "chapterName")
  String? chapterName;
  @JsonKey(name: "collect")
  bool? collect;
  @JsonKey(name: "courseId")
  int? courseId;
  @JsonKey(name: "desc")
  String? desc;
  @JsonKey(name: "descMd")
  String? descMd;
  @JsonKey(name: "envelopePic")
  String? envelopePic;
  @JsonKey(name: "fresh")
  bool? fresh;
  @JsonKey(name: "host")
  String? host;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "isAdminAdd")
  bool? isAdminAdd;
  @JsonKey(name: "link")
  String? link;
  @JsonKey(name: "niceDate")
  String? niceDate;
  @JsonKey(name: "niceShareDate")
  String? niceShareDate;
  @JsonKey(name: "origin")
  String? origin;
  @JsonKey(name: "prefix")
  String? prefix;
  @JsonKey(name: "projectLink")
  String? projectLink;
  @JsonKey(name: "publishTime")
  int? publishTime;
  @JsonKey(name: "realSuperChapterId")
  int? realSuperChapterId;
  @JsonKey(name: "selfVisible")
  int? selfVisible;
  @JsonKey(name: "shareDate")
  int? shareDate;
  @JsonKey(name: "shareUser")
  String? shareUser;
  @JsonKey(name: "superChapterId")
  int? superChapterId;
  @JsonKey(name: "superChapterName")
  String? superChapterName;
  // @JsonKey(name: "tags")
  // List<String>? tags;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "type")
  int? type;
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "visible")
  int? visible;
  @JsonKey(name: "zan")
  int? zan;

  SearchListItemModel({
    this.adminAdd,
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.host,
    this.id,
    this.isAdminAdd,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.realSuperChapterId,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
   // this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  factory SearchListItemModel.fromJson(Map<String, dynamic> json) => _$SearchListItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchListItemModelToJson(this);
}

