// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_banner_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeBannerState {

 List<NewHomeBannerData> get bannerList;
/// Create a copy of HomeBannerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeBannerStateCopyWith<HomeBannerState> get copyWith => _$HomeBannerStateCopyWithImpl<HomeBannerState>(this as HomeBannerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeBannerState&&const DeepCollectionEquality().equals(other.bannerList, bannerList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bannerList));

@override
String toString() {
  return 'HomeBannerState(bannerList: $bannerList)';
}


}

/// @nodoc
abstract mixin class $HomeBannerStateCopyWith<$Res>  {
  factory $HomeBannerStateCopyWith(HomeBannerState value, $Res Function(HomeBannerState) _then) = _$HomeBannerStateCopyWithImpl;
@useResult
$Res call({
 List<NewHomeBannerData> bannerList
});




}
/// @nodoc
class _$HomeBannerStateCopyWithImpl<$Res>
    implements $HomeBannerStateCopyWith<$Res> {
  _$HomeBannerStateCopyWithImpl(this._self, this._then);

  final HomeBannerState _self;
  final $Res Function(HomeBannerState) _then;

/// Create a copy of HomeBannerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bannerList = null,}) {
  return _then(_self.copyWith(
bannerList: null == bannerList ? _self.bannerList : bannerList // ignore: cast_nullable_to_non_nullable
as List<NewHomeBannerData>,
  ));
}

}


/// @nodoc


class _HomeBannerState implements HomeBannerState {
  const _HomeBannerState({final  List<NewHomeBannerData> bannerList = const []}): _bannerList = bannerList;
  

 final  List<NewHomeBannerData> _bannerList;
@override@JsonKey() List<NewHomeBannerData> get bannerList {
  if (_bannerList is EqualUnmodifiableListView) return _bannerList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bannerList);
}


/// Create a copy of HomeBannerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeBannerStateCopyWith<_HomeBannerState> get copyWith => __$HomeBannerStateCopyWithImpl<_HomeBannerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeBannerState&&const DeepCollectionEquality().equals(other._bannerList, _bannerList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_bannerList));

@override
String toString() {
  return 'HomeBannerState(bannerList: $bannerList)';
}


}

/// @nodoc
abstract mixin class _$HomeBannerStateCopyWith<$Res> implements $HomeBannerStateCopyWith<$Res> {
  factory _$HomeBannerStateCopyWith(_HomeBannerState value, $Res Function(_HomeBannerState) _then) = __$HomeBannerStateCopyWithImpl;
@override @useResult
$Res call({
 List<NewHomeBannerData> bannerList
});




}
/// @nodoc
class __$HomeBannerStateCopyWithImpl<$Res>
    implements _$HomeBannerStateCopyWith<$Res> {
  __$HomeBannerStateCopyWithImpl(this._self, this._then);

  final _HomeBannerState _self;
  final $Res Function(_HomeBannerState) _then;

/// Create a copy of HomeBannerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bannerList = null,}) {
  return _then(_HomeBannerState(
bannerList: null == bannerList ? _self._bannerList : bannerList // ignore: cast_nullable_to_non_nullable
as List<NewHomeBannerData>,
  ));
}


}

// dart format on
