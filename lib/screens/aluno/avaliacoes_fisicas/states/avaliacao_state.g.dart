// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliacao_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$avaliacaoStateHash() => r'0d13b28da1c169609a4cf849d2c76a28773b8927';

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

abstract class _$AvaliacaoState
    extends BuildlessAutoDisposeAsyncNotifier<List<AvaliacaoFisica>> {
  late final String id;

  FutureOr<List<AvaliacaoFisica>> build(
    String id,
  );
}

/// See also [AvaliacaoState].
@ProviderFor(AvaliacaoState)
const avaliacaoStateProvider = AvaliacaoStateFamily();

/// See also [AvaliacaoState].
class AvaliacaoStateFamily extends Family<AsyncValue<List<AvaliacaoFisica>>> {
  /// See also [AvaliacaoState].
  const AvaliacaoStateFamily();

  /// See also [AvaliacaoState].
  AvaliacaoStateProvider call(
    String id,
  ) {
    return AvaliacaoStateProvider(
      id,
    );
  }

  @override
  AvaliacaoStateProvider getProviderOverride(
    covariant AvaliacaoStateProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'avaliacaoStateProvider';
}

/// See also [AvaliacaoState].
class AvaliacaoStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AvaliacaoState, List<AvaliacaoFisica>> {
  /// See also [AvaliacaoState].
  AvaliacaoStateProvider(
    String id,
  ) : this._internal(
          () => AvaliacaoState()..id = id,
          from: avaliacaoStateProvider,
          name: r'avaliacaoStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$avaliacaoStateHash,
          dependencies: AvaliacaoStateFamily._dependencies,
          allTransitiveDependencies:
              AvaliacaoStateFamily._allTransitiveDependencies,
          id: id,
        );

  AvaliacaoStateProvider._internal(
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
  FutureOr<List<AvaliacaoFisica>> runNotifierBuild(
    covariant AvaliacaoState notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(AvaliacaoState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AvaliacaoStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AvaliacaoState, List<AvaliacaoFisica>>
      createElement() {
    return _AvaliacaoStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AvaliacaoStateProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AvaliacaoStateRef
    on AutoDisposeAsyncNotifierProviderRef<List<AvaliacaoFisica>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AvaliacaoStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AvaliacaoState,
        List<AvaliacaoFisica>> with AvaliacaoStateRef {
  _AvaliacaoStateProviderElement(super.provider);

  @override
  String get id => (origin as AvaliacaoStateProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
