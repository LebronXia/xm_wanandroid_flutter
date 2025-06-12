// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getKnowledgeListHash() => r'd70afb3da41a6f1b0cdea73e03930f601013b484';

/// See also [getKnowledgeList].
@ProviderFor(getKnowledgeList)
final getKnowledgeListProvider =
    AutoDisposeFutureProvider<List<KnowledgeModel>>.internal(
      getKnowledgeList,
      name: r'getKnowledgeListProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$getKnowledgeListHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetKnowledgeListRef =
    AutoDisposeFutureProviderRef<List<KnowledgeModel>>;
String _$knowledgeDetailListNotifierHash() =>
    r'b731460029a13db1548d20959bc855625dd7eaa6';

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

abstract class _$KnowledgeDetailListNotifier
    extends BuildlessAutoDisposeNotifier<KnowLedgeTabChildState> {
  late final String id;

  KnowLedgeTabChildState build(String id);
}

/// See also [KnowledgeDetailListNotifier].
@ProviderFor(KnowledgeDetailListNotifier)
const knowledgeDetailListNotifierProvider = KnowledgeDetailListNotifierFamily();

/// See also [KnowledgeDetailListNotifier].
class KnowledgeDetailListNotifierFamily extends Family<KnowLedgeTabChildState> {
  /// See also [KnowledgeDetailListNotifier].
  const KnowledgeDetailListNotifierFamily();

  /// See also [KnowledgeDetailListNotifier].
  KnowledgeDetailListNotifierProvider call(String id) {
    return KnowledgeDetailListNotifierProvider(id);
  }

  @override
  KnowledgeDetailListNotifierProvider getProviderOverride(
    covariant KnowledgeDetailListNotifierProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'knowledgeDetailListNotifierProvider';
}

/// See also [KnowledgeDetailListNotifier].
class KnowledgeDetailListNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          KnowledgeDetailListNotifier,
          KnowLedgeTabChildState
        > {
  /// See also [KnowledgeDetailListNotifier].
  KnowledgeDetailListNotifierProvider(String id)
    : this._internal(
        () => KnowledgeDetailListNotifier()..id = id,
        from: knowledgeDetailListNotifierProvider,
        name: r'knowledgeDetailListNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$knowledgeDetailListNotifierHash,
        dependencies: KnowledgeDetailListNotifierFamily._dependencies,
        allTransitiveDependencies:
            KnowledgeDetailListNotifierFamily._allTransitiveDependencies,
        id: id,
      );

  KnowledgeDetailListNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  KnowLedgeTabChildState runNotifierBuild(
    covariant KnowledgeDetailListNotifier notifier,
  ) {
    return notifier.build(id);
  }

  @override
  Override overrideWith(KnowledgeDetailListNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: KnowledgeDetailListNotifierProvider._internal(
        () => create()..id = id,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    KnowledgeDetailListNotifier,
    KnowLedgeTabChildState
  >
  createElement() {
    return _KnowledgeDetailListNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is KnowledgeDetailListNotifierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin KnowledgeDetailListNotifierRef
    on AutoDisposeNotifierProviderRef<KnowLedgeTabChildState> {
  /// The parameter `id` of this provider.
  String get id;
}

class _KnowledgeDetailListNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          KnowledgeDetailListNotifier,
          KnowLedgeTabChildState
        >
    with KnowledgeDetailListNotifierRef {
  _KnowledgeDetailListNotifierProviderElement(super.provider);

  @override
  String get id => (origin as KnowledgeDetailListNotifierProvider).id;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
