// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authNotifierHash() => r'44d9d80648841637d3e1522c381e33224e345b24';

/// See also [AuthNotifier].
@ProviderFor(AuthNotifier)
final authNotifierProvider =
    AutoDisposeNotifierProvider<AuthNotifier, AuthState>.internal(
      AuthNotifier.new,
      name: r'authNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$authNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AuthNotifier = AutoDisposeNotifier<AuthState>;
String _$loginNotifierHash() => r'ba4b74366a9eb0e714f999c2cce9ee5eff98c5a2';

/// See also [LoginNotifier].
@ProviderFor(LoginNotifier)
final loginNotifierProvider =
    AutoDisposeAsyncNotifierProvider<LoginNotifier, void>.internal(
      LoginNotifier.new,
      name: r'loginNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$loginNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LoginNotifier = AutoDisposeAsyncNotifier<void>;
String _$registerNotifierHash() => r'6e6323d6d16173cc54f639df8c3b2d71870bd523';

/// See also [RegisterNotifier].
@ProviderFor(RegisterNotifier)
final registerNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RegisterNotifier, void>.internal(
      RegisterNotifier.new,
      name: r'registerNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$registerNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RegisterNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
