// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knowledge_detail_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KnowledgeDetailParam {

 String? get name; set name(String? value);// 确保是公共类型
 String? get id;// 确保是公共类型
 set id(String? value);
/// Create a copy of KnowledgeDetailParam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeDetailParamCopyWith<KnowledgeDetailParam> get copyWith => _$KnowledgeDetailParamCopyWithImpl<KnowledgeDetailParam>(this as KnowledgeDetailParam, _$identity);





@override
String toString() {
  return 'KnowledgeDetailParam(name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class $KnowledgeDetailParamCopyWith<$Res>  {
  factory $KnowledgeDetailParamCopyWith(KnowledgeDetailParam value, $Res Function(KnowledgeDetailParam) _then) = _$KnowledgeDetailParamCopyWithImpl;
@useResult
$Res call({
 String? name, String? id
});




}
/// @nodoc
class _$KnowledgeDetailParamCopyWithImpl<$Res>
    implements $KnowledgeDetailParamCopyWith<$Res> {
  _$KnowledgeDetailParamCopyWithImpl(this._self, this._then);

  final KnowledgeDetailParam _self;
  final $Res Function(KnowledgeDetailParam) _then;

/// Create a copy of KnowledgeDetailParam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _KnowledgeDetailParam implements KnowledgeDetailParam {
   _KnowledgeDetailParam({required this.name, required this.id});
  

@override  String? name;
// 确保是公共类型
@override  String? id;

/// Create a copy of KnowledgeDetailParam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeDetailParamCopyWith<_KnowledgeDetailParam> get copyWith => __$KnowledgeDetailParamCopyWithImpl<_KnowledgeDetailParam>(this, _$identity);





@override
String toString() {
  return 'KnowledgeDetailParam(name: $name, id: $id)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeDetailParamCopyWith<$Res> implements $KnowledgeDetailParamCopyWith<$Res> {
  factory _$KnowledgeDetailParamCopyWith(_KnowledgeDetailParam value, $Res Function(_KnowledgeDetailParam) _then) = __$KnowledgeDetailParamCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? id
});




}
/// @nodoc
class __$KnowledgeDetailParamCopyWithImpl<$Res>
    implements _$KnowledgeDetailParamCopyWith<$Res> {
  __$KnowledgeDetailParamCopyWithImpl(this._self, this._then);

  final _KnowledgeDetailParam _self;
  final $Res Function(_KnowledgeDetailParam) _then;

/// Create a copy of KnowledgeDetailParam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? id = freezed,}) {
  return _then(_KnowledgeDetailParam(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
