// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$otpControllersHash() => r'0ce51bc0b3d9488e8c03f56df1cabf8c24be3347';

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

abstract class _$OtpControllers
    extends BuildlessAutoDisposeNotifier<List<TextEditingController>> {
  late final OtpParams params;

  List<TextEditingController> build(OtpParams params);
}

/// Provider for OTP controllers - each example has its own controllers
///
/// Copied from [OtpControllers].
@ProviderFor(OtpControllers)
const otpControllersProvider = OtpControllersFamily();

/// Provider for OTP controllers - each example has its own controllers
///
/// Copied from [OtpControllers].
class OtpControllersFamily extends Family<List<TextEditingController>> {
  /// Provider for OTP controllers - each example has its own controllers
  ///
  /// Copied from [OtpControllers].
  const OtpControllersFamily();

  /// Provider for OTP controllers - each example has its own controllers
  ///
  /// Copied from [OtpControllers].
  OtpControllersProvider call(OtpParams params) {
    return OtpControllersProvider(params);
  }

  @override
  OtpControllersProvider getProviderOverride(
    covariant OtpControllersProvider provider,
  ) {
    return call(provider.params);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'otpControllersProvider';
}

/// Provider for OTP controllers - each example has its own controllers
///
/// Copied from [OtpControllers].
class OtpControllersProvider
    extends
        AutoDisposeNotifierProviderImpl<
          OtpControllers,
          List<TextEditingController>
        > {
  /// Provider for OTP controllers - each example has its own controllers
  ///
  /// Copied from [OtpControllers].
  OtpControllersProvider(OtpParams params)
    : this._internal(
        () => OtpControllers()..params = params,
        from: otpControllersProvider,
        name: r'otpControllersProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$otpControllersHash,
        dependencies: OtpControllersFamily._dependencies,
        allTransitiveDependencies:
            OtpControllersFamily._allTransitiveDependencies,
        params: params,
      );

  OtpControllersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final OtpParams params;

  @override
  List<TextEditingController> runNotifierBuild(
    covariant OtpControllers notifier,
  ) {
    return notifier.build(params);
  }

  @override
  Override overrideWith(OtpControllers Function() create) {
    return ProviderOverride(
      origin: this,
      override: OtpControllersProvider._internal(
        () => create()..params = params,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    OtpControllers,
    List<TextEditingController>
  >
  createElement() {
    return _OtpControllersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtpControllersProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OtpControllersRef
    on AutoDisposeNotifierProviderRef<List<TextEditingController>> {
  /// The parameter `params` of this provider.
  OtpParams get params;
}

class _OtpControllersProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          OtpControllers,
          List<TextEditingController>
        >
    with OtpControllersRef {
  _OtpControllersProviderElement(super.provider);

  @override
  OtpParams get params => (origin as OtpControllersProvider).params;
}

String _$otpFocusNodesHash() => r'a9832d71f2971c69766b052e70e3918611bb4296';

abstract class _$OtpFocusNodes
    extends BuildlessAutoDisposeNotifier<List<FocusNode>> {
  late final OtpParams params;

  List<FocusNode> build(OtpParams params);
}

/// Provider for OTP focus nodes - each example has its own focus nodes
///
/// Copied from [OtpFocusNodes].
@ProviderFor(OtpFocusNodes)
const otpFocusNodesProvider = OtpFocusNodesFamily();

/// Provider for OTP focus nodes - each example has its own focus nodes
///
/// Copied from [OtpFocusNodes].
class OtpFocusNodesFamily extends Family<List<FocusNode>> {
  /// Provider for OTP focus nodes - each example has its own focus nodes
  ///
  /// Copied from [OtpFocusNodes].
  const OtpFocusNodesFamily();

  /// Provider for OTP focus nodes - each example has its own focus nodes
  ///
  /// Copied from [OtpFocusNodes].
  OtpFocusNodesProvider call(OtpParams params) {
    return OtpFocusNodesProvider(params);
  }

  @override
  OtpFocusNodesProvider getProviderOverride(
    covariant OtpFocusNodesProvider provider,
  ) {
    return call(provider.params);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'otpFocusNodesProvider';
}

/// Provider for OTP focus nodes - each example has its own focus nodes
///
/// Copied from [OtpFocusNodes].
class OtpFocusNodesProvider
    extends AutoDisposeNotifierProviderImpl<OtpFocusNodes, List<FocusNode>> {
  /// Provider for OTP focus nodes - each example has its own focus nodes
  ///
  /// Copied from [OtpFocusNodes].
  OtpFocusNodesProvider(OtpParams params)
    : this._internal(
        () => OtpFocusNodes()..params = params,
        from: otpFocusNodesProvider,
        name: r'otpFocusNodesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$otpFocusNodesHash,
        dependencies: OtpFocusNodesFamily._dependencies,
        allTransitiveDependencies:
            OtpFocusNodesFamily._allTransitiveDependencies,
        params: params,
      );

  OtpFocusNodesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final OtpParams params;

  @override
  List<FocusNode> runNotifierBuild(covariant OtpFocusNodes notifier) {
    return notifier.build(params);
  }

  @override
  Override overrideWith(OtpFocusNodes Function() create) {
    return ProviderOverride(
      origin: this,
      override: OtpFocusNodesProvider._internal(
        () => create()..params = params,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<OtpFocusNodes, List<FocusNode>>
  createElement() {
    return _OtpFocusNodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtpFocusNodesProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OtpFocusNodesRef on AutoDisposeNotifierProviderRef<List<FocusNode>> {
  /// The parameter `params` of this provider.
  OtpParams get params;
}

class _OtpFocusNodesProviderElement
    extends AutoDisposeNotifierProviderElement<OtpFocusNodes, List<FocusNode>>
    with OtpFocusNodesRef {
  _OtpFocusNodesProviderElement(super.provider);

  @override
  OtpParams get params => (origin as OtpFocusNodesProvider).params;
}

String _$currentOtpHash() => r'03362b41223660f69e6e9527bf0b3a48d9dfb3e3';

abstract class _$CurrentOtp extends BuildlessAutoDisposeNotifier<String> {
  late final String exampleId;

  String build(String exampleId);
}

/// Provider for current OTP value
///
/// Copied from [CurrentOtp].
@ProviderFor(CurrentOtp)
const currentOtpProvider = CurrentOtpFamily();

/// Provider for current OTP value
///
/// Copied from [CurrentOtp].
class CurrentOtpFamily extends Family<String> {
  /// Provider for current OTP value
  ///
  /// Copied from [CurrentOtp].
  const CurrentOtpFamily();

  /// Provider for current OTP value
  ///
  /// Copied from [CurrentOtp].
  CurrentOtpProvider call(String exampleId) {
    return CurrentOtpProvider(exampleId);
  }

  @override
  CurrentOtpProvider getProviderOverride(
    covariant CurrentOtpProvider provider,
  ) {
    return call(provider.exampleId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'currentOtpProvider';
}

/// Provider for current OTP value
///
/// Copied from [CurrentOtp].
class CurrentOtpProvider
    extends AutoDisposeNotifierProviderImpl<CurrentOtp, String> {
  /// Provider for current OTP value
  ///
  /// Copied from [CurrentOtp].
  CurrentOtpProvider(String exampleId)
    : this._internal(
        () => CurrentOtp()..exampleId = exampleId,
        from: currentOtpProvider,
        name: r'currentOtpProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$currentOtpHash,
        dependencies: CurrentOtpFamily._dependencies,
        allTransitiveDependencies: CurrentOtpFamily._allTransitiveDependencies,
        exampleId: exampleId,
      );

  CurrentOtpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.exampleId,
  }) : super.internal();

  final String exampleId;

  @override
  String runNotifierBuild(covariant CurrentOtp notifier) {
    return notifier.build(exampleId);
  }

  @override
  Override overrideWith(CurrentOtp Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentOtpProvider._internal(
        () => create()..exampleId = exampleId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        exampleId: exampleId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CurrentOtp, String> createElement() {
    return _CurrentOtpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentOtpProvider && other.exampleId == exampleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exampleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrentOtpRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `exampleId` of this provider.
  String get exampleId;
}

class _CurrentOtpProviderElement
    extends AutoDisposeNotifierProviderElement<CurrentOtp, String>
    with CurrentOtpRef {
  _CurrentOtpProviderElement(super.provider);

  @override
  String get exampleId => (origin as CurrentOtpProvider).exampleId;
}

String _$otpHasErrorHash() => r'e558e236b887a853250b0f8c2198824c4a9d43f8';

abstract class _$OtpHasError extends BuildlessAutoDisposeNotifier<bool> {
  late final String exampleId;

  bool build(String exampleId);
}

/// Provider for error state
///
/// Copied from [OtpHasError].
@ProviderFor(OtpHasError)
const otpHasErrorProvider = OtpHasErrorFamily();

/// Provider for error state
///
/// Copied from [OtpHasError].
class OtpHasErrorFamily extends Family<bool> {
  /// Provider for error state
  ///
  /// Copied from [OtpHasError].
  const OtpHasErrorFamily();

  /// Provider for error state
  ///
  /// Copied from [OtpHasError].
  OtpHasErrorProvider call(String exampleId) {
    return OtpHasErrorProvider(exampleId);
  }

  @override
  OtpHasErrorProvider getProviderOverride(
    covariant OtpHasErrorProvider provider,
  ) {
    return call(provider.exampleId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'otpHasErrorProvider';
}

/// Provider for error state
///
/// Copied from [OtpHasError].
class OtpHasErrorProvider
    extends AutoDisposeNotifierProviderImpl<OtpHasError, bool> {
  /// Provider for error state
  ///
  /// Copied from [OtpHasError].
  OtpHasErrorProvider(String exampleId)
    : this._internal(
        () => OtpHasError()..exampleId = exampleId,
        from: otpHasErrorProvider,
        name: r'otpHasErrorProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$otpHasErrorHash,
        dependencies: OtpHasErrorFamily._dependencies,
        allTransitiveDependencies: OtpHasErrorFamily._allTransitiveDependencies,
        exampleId: exampleId,
      );

  OtpHasErrorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.exampleId,
  }) : super.internal();

  final String exampleId;

  @override
  bool runNotifierBuild(covariant OtpHasError notifier) {
    return notifier.build(exampleId);
  }

  @override
  Override overrideWith(OtpHasError Function() create) {
    return ProviderOverride(
      origin: this,
      override: OtpHasErrorProvider._internal(
        () => create()..exampleId = exampleId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        exampleId: exampleId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<OtpHasError, bool> createElement() {
    return _OtpHasErrorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtpHasErrorProvider && other.exampleId == exampleId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, exampleId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OtpHasErrorRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `exampleId` of this provider.
  String get exampleId;
}

class _OtpHasErrorProviderElement
    extends AutoDisposeNotifierProviderElement<OtpHasError, bool>
    with OtpHasErrorRef {
  _OtpHasErrorProviderElement(super.provider);

  @override
  String get exampleId => (origin as OtpHasErrorProvider).exampleId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
