// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgeModel _$KnowledgeModelFromJson(Map<String, dynamic> json) =>
    KnowledgeModel(
      children:
          (json['children'] as List<dynamic>?)
              ?.map((e) => Children.fromJson(e as Map<String, dynamic>))
              .toList(),
      courseId: (json['courseId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      order: (json['order'] as num?)?.toInt(),
      parentChapterId: (json['parentChapterId'] as num?)?.toInt(),
      visible: (json['visible'] as num?)?.toInt(),
    );

Map<String, dynamic> _$KnowledgeModelToJson(KnowledgeModel instance) =>
    <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'visible': instance.visible,
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) => Children(
  children:
      (json['children'] as List<dynamic>?)?.map((e) => e as String).toList(),
  courseId: (json['courseId'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  order: (json['order'] as num?)?.toInt(),
  parentChapterId: (json['parentChapterId'] as num?)?.toInt(),
  visible: (json['visible'] as num?)?.toInt(),
);

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
  'children': instance.children,
  'courseId': instance.courseId,
  'id': instance.id,
  'name': instance.name,
  'order': instance.order,
  'parentChapterId': instance.parentChapterId,
  'visible': instance.visible,
};
