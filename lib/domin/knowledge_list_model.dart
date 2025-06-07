import 'package:json_annotation/json_annotation.dart';

part 'knowledge_list_model.g.dart';

@JsonSerializable()
class KnowledgeModel {
  @JsonKey(name: "children")
  List<Children>? children;
  @JsonKey(name: "courseId")
  int? courseId;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "parentChapterId")
  int? parentChapterId;
  @JsonKey(name: "visible")
  int? visible;

  KnowledgeModel({
    this.children,
    this.courseId,
    this.id,
    this.name,
    this.order,
    this.parentChapterId,
    this.visible,
  });

  factory KnowledgeModel.fromJson(Map<String, dynamic> json) => _$KnowledgeModelFromJson(json);

  Map<String, dynamic> toJson() => _$KnowledgeModelToJson(this);
}

@JsonSerializable()
class Children {
  @JsonKey(name: "children")
  List<String>? children;
  @JsonKey(name: "courseId")
  int? courseId;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "parentChapterId")
  int? parentChapterId;
  @JsonKey(name: "visible")
  int? visible;

  Children({
    this.children,
    this.courseId,
    this.id,
    this.name,
    this.order,
    this.parentChapterId,
    this.visible,
  });

  factory Children.fromJson(Map<String, dynamic> json) => _$ChildrenFromJson(json);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);
}