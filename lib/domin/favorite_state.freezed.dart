// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FavoriteState {

 String get itemId; bool get isFavorite; bool get isLoading;
/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FavoriteStateCopyWith<FavoriteState> get copyWith => _$FavoriteStateCopyWithImpl<FavoriteState>(this as FavoriteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FavoriteState&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,isFavorite,isLoading);

@override
String toString() {
  return 'FavoriteState(itemId: $itemId, isFavorite: $isFavorite, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class $FavoriteStateCopyWith<$Res>  {
  factory $FavoriteStateCopyWith(FavoriteState value, $Res Function(FavoriteState) _then) = _$FavoriteStateCopyWithImpl;
@useResult
$Res call({
 String itemId, bool isFavorite, bool isLoading
});




}
/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._self, this._then);

  final FavoriteState _self;
  final $Res Function(FavoriteState) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? isFavorite = null,Object? isLoading = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _FavoriteState implements FavoriteState {
  const _FavoriteState({required this.itemId, required this.isFavorite, this.isLoading = false});
  

@override final  String itemId;
@override final  bool isFavorite;
@override@JsonKey() final  bool isLoading;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FavoriteStateCopyWith<_FavoriteState> get copyWith => __$FavoriteStateCopyWithImpl<_FavoriteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FavoriteState&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.isFavorite, isFavorite) || other.isFavorite == isFavorite)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,isFavorite,isLoading);

@override
String toString() {
  return 'FavoriteState(itemId: $itemId, isFavorite: $isFavorite, isLoading: $isLoading)';
}


}

/// @nodoc
abstract mixin class _$FavoriteStateCopyWith<$Res> implements $FavoriteStateCopyWith<$Res> {
  factory _$FavoriteStateCopyWith(_FavoriteState value, $Res Function(_FavoriteState) _then) = __$FavoriteStateCopyWithImpl;
@override @useResult
$Res call({
 String itemId, bool isFavorite, bool isLoading
});




}
/// @nodoc
class __$FavoriteStateCopyWithImpl<$Res>
    implements _$FavoriteStateCopyWith<$Res> {
  __$FavoriteStateCopyWithImpl(this._self, this._then);

  final _FavoriteState _self;
  final $Res Function(_FavoriteState) _then;

/// Create a copy of FavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? isFavorite = null,Object? isLoading = null,}) {
  return _then(_FavoriteState(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,isFavorite: null == isFavorite ? _self.isFavorite : isFavorite // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
