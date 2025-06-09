// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteNotifierHash() => r'86ab3210330722352b7b70c93bfd7e4c1ed090af';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FavoriteNotifier
    extends BuildlessAutoDisposeNotifier<FavoriteState> {
  late final String itemId;
  late final bool initialStatus;

  FavoriteState build(String itemId, bool initialStatus);
}

/// See also [FavoriteNotifier].
@ProviderFor(FavoriteNotifier)
const favoriteNotifierProvider = FavoriteNotifierFamily();

/// See also [FavoriteNotifier].
class FavoriteNotifierFamily extends Family<FavoriteState> {
  /// See also [FavoriteNotifier].
  const FavoriteNotifierFamily();

  /// See also [FavoriteNotifier].
  FavoriteNotifierProvider call(String itemId, bool initialStatus) {
    return FavoriteNotifierProvider(itemId, initialStatus);
  }

  @override
  FavoriteNotifierProvider getProviderOverride(
    covariant FavoriteNotifierProvider provider,
  ) {
    return call(provider.itemId, provider.initialStatus);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'favoriteNotifierProvider';
}

/// See also [FavoriteNotifier].
class FavoriteNotifierProvider
    extends AutoDisposeNotifierProviderImpl<FavoriteNotifier, FavoriteState> {
  /// See also [FavoriteNotifier].
  FavoriteNotifierProvider(String itemId, bool initialStatus)
    : this._internal(
        () =>
            FavoriteNotifier()
              ..itemId = itemId
              ..initialStatus = initialStatus,
        from: favoriteNotifierProvider,
        name: r'favoriteNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$favoriteNotifierHash,
        dependencies: FavoriteNotifierFamily._dependencies,
        allTransitiveDependencies:
            FavoriteNotifierFamily._allTransitiveDependencies,
        itemId: itemId,
        initialStatus: initialStatus,
      );

  FavoriteNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.itemId,
    required this.initialStatus,
  }) : super.internal();

  final String itemId;
  final bool initialStatus;

  @override
  FavoriteState runNotifierBuild(covariant FavoriteNotifier notifier) {
    return notifier.build(itemId, initialStatus);
  }

  @override
  Override overrideWith(FavoriteNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: FavoriteNotifierProvider._internal(
        () =>
            create()
              ..itemId = itemId
              ..initialStatus = initialStatus,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        itemId: itemId,
        initialStatus: initialStatus,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FavoriteNotifier, FavoriteState>
  createElement() {
    return _FavoriteNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteNotifierProvider &&
        other.itemId == itemId &&
        other.initialStatus == initialStatus;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, itemId.hashCode);
    hash = _SystemHash.combine(hash, initialStatus.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FavoriteNotifierRef on AutoDisposeNotifierProviderRef<FavoriteState> {
  /// The parameter `itemId` of this provider.
  String get itemId;

  /// The parameter `initialStatus` of this provider.
  bool get initialStatus;
}

class _FavoriteNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<FavoriteNotifier, FavoriteState>
    with FavoriteNotifierRef {
  _FavoriteNotifierProviderElement(super.provider);

  @override
  String get itemId => (origin as FavoriteNotifierProvider).itemId;
  @override
  bool get initialStatus => (origin as FavoriteNotifierProvider).initialStatus;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
