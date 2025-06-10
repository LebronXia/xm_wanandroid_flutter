// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'konwledge_tab_child_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$KnowLedgeTabChildState {

 String? get id; List<KnowledgeDetailItem> get items; int get pageCount; bool get isLoading; bool get isLoadingMore; String? get errorMessage;
/// Create a copy of KnowLedgeTabChildState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowLedgeTabChildStateCopyWith<KnowLedgeTabChildState> get copyWith => _$KnowLedgeTabChildStateCopyWithImpl<KnowLedgeTabChildState>(this as KnowLedgeTabChildState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowLedgeTabChildState&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(items),pageCount,isLoading,isLoadingMore,errorMessage);

@override
String toString() {
  return 'KnowLedgeTabChildState(id: $id, items: $items, pageCount: $pageCount, isLoading: $isLoading, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $KnowLedgeTabChildStateCopyWith<$Res>  {
  factory $KnowLedgeTabChildStateCopyWith(KnowLedgeTabChildState value, $Res Function(KnowLedgeTabChildState) _then) = _$KnowLedgeTabChildStateCopyWithImpl;
@useResult
$Res call({
 String? id, List<KnowledgeDetailItem> items, int pageCount, bool isLoading, bool isLoadingMore, String? errorMessage
});




}
/// @nodoc
class _$KnowLedgeTabChildStateCopyWithImpl<$Res>
    implements $KnowLedgeTabChildStateCopyWith<$Res> {
  _$KnowLedgeTabChildStateCopyWithImpl(this._self, this._then);

  final KnowLedgeTabChildState _self;
  final $Res Function(KnowLedgeTabChildState) _then;

/// Create a copy of KnowLedgeTabChildState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? items = null,Object? pageCount = null,Object? isLoading = null,Object? isLoadingMore = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<KnowledgeDetailItem>,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _KnowLedgeTabChildState extends KnowLedgeTabChildState {
  const _KnowLedgeTabChildState({required this.id, final  List<KnowledgeDetailItem> items = const [], this.pageCount = 0, this.isLoading = false, this.isLoadingMore = false, this.errorMessage}): _items = items,super._();
  

@override final  String? id;
 final  List<KnowledgeDetailItem> _items;
@override@JsonKey() List<KnowledgeDetailItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int pageCount;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingMore;
@override final  String? errorMessage;

/// Create a copy of KnowLedgeTabChildState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowLedgeTabChildStateCopyWith<_KnowLedgeTabChildState> get copyWith => __$KnowLedgeTabChildStateCopyWithImpl<_KnowLedgeTabChildState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowLedgeTabChildState&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.pageCount, pageCount) || other.pageCount == pageCount)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_items),pageCount,isLoading,isLoadingMore,errorMessage);

@override
String toString() {
  return 'KnowLedgeTabChildState(id: $id, items: $items, pageCount: $pageCount, isLoading: $isLoading, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$KnowLedgeTabChildStateCopyWith<$Res> implements $KnowLedgeTabChildStateCopyWith<$Res> {
  factory _$KnowLedgeTabChildStateCopyWith(_KnowLedgeTabChildState value, $Res Function(_KnowLedgeTabChildState) _then) = __$KnowLedgeTabChildStateCopyWithImpl;
@override @useResult
$Res call({
 String? id, List<KnowledgeDetailItem> items, int pageCount, bool isLoading, bool isLoadingMore, String? errorMessage
});




}
/// @nodoc
class __$KnowLedgeTabChildStateCopyWithImpl<$Res>
    implements _$KnowLedgeTabChildStateCopyWith<$Res> {
  __$KnowLedgeTabChildStateCopyWithImpl(this._self, this._then);

  final _KnowLedgeTabChildState _self;
  final $Res Function(_KnowLedgeTabChildState) _then;

/// Create a copy of KnowLedgeTabChildState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? items = null,Object? pageCount = null,Object? isLoading = null,Object? isLoadingMore = null,Object? errorMessage = freezed,}) {
  return _then(_KnowLedgeTabChildState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<KnowledgeDetailItem>,pageCount: null == pageCount ? _self.pageCount : pageCount // ignore: cast_nullable_to_non_nullable
as int,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
