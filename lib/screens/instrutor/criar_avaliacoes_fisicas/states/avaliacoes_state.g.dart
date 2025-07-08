// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliacoes_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$avaliacoesStateHash() => r'342d94af95f32fa7a9f95e68b80f6156c2d364d9';

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

abstract class _$AvaliacoesState
    extends BuildlessAutoDisposeAsyncNotifier<List<AvaliacaoFisica>> {
  late final String id;

  FutureOr<List<AvaliacaoFisica>> build(
    String id,
  );
}

/// See also [AvaliacoesState].
@ProviderFor(AvaliacoesState)
const avaliacoesStateProvider = AvaliacoesStateFamily();

/// See also [AvaliacoesState].
class AvaliacoesStateFamily extends Family<AsyncValue<List<AvaliacaoFisica>>> {
  /// See also [AvaliacoesState].
  const AvaliacoesStateFamily();

  /// See also [AvaliacoesState].
  AvaliacoesStateProvider call(
    String id,
  ) {
    return AvaliacoesStateProvider(
      id,
    );
  }

  @override
  AvaliacoesStateProvider getProviderOverride(
    covariant AvaliacoesStateProvider provider,
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
  String? get name => r'avaliacoesStateProvider';
}

/// See also [AvaliacoesState].
class AvaliacoesStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AvaliacoesState, List<AvaliacaoFisica>> {
  /// See also [AvaliacoesState].
  AvaliacoesStateProvider(
    String id,
  ) : this._internal(
          () => AvaliacoesState()..id = id,
          from: avaliacoesStateProvider,
          name: r'avaliacoesStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$avaliacoesStateHash,
          dependencies: AvaliacoesStateFamily._dependencies,
          allTransitiveDependencies:
              AvaliacoesStateFamily._allTransitiveDependencies,
          id: id,
        );

  AvaliacoesStateProvider._internal(
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
    covariant AvaliacoesState notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(AvaliacoesState Function() create) {
    return ProviderOverride(
      origin: this,
      override: AvaliacoesStateProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<AvaliacoesState,
      List<AvaliacaoFisica>> createElement() {
    return _AvaliacoesStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AvaliacoesStateProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AvaliacoesStateRef
    on AutoDisposeAsyncNotifierProviderRef<List<AvaliacaoFisica>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _AvaliacoesStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AvaliacoesState,
        List<AvaliacaoFisica>> with AvaliacoesStateRef {
  _AvaliacoesStateProviderElement(super.provider);

  @override
  String get id => (origin as AvaliacoesStateProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
