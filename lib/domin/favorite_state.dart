

import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite_state.freezed.dart';
////可选的：因为 FavoriteState 类是可序列化的，所以我们必须添加这一行。
// 但是如果 FavoriteState 不是可序列化的，我们可以跳过它。
//part 'favorite_state.g.dart';

@freezed
abstract class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    required String itemId,
    required bool isFavorite,
    @Default(false) bool isLoading,
  }) = _FavoriteState;

  factory FavoriteState.initial({
    required String itemId,
    required bool initialStatus,
  }) => FavoriteState(
    itemId: itemId,
    isFavorite: initialStatus,
  );

//序列化要加的
  // factory Person.fromJson(Map<String, Object?> json)
  // => _$PersonFromJson(json);
}