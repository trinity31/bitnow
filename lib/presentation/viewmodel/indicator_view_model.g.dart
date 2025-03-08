// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indicator_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$maCrossHash() => r'b0bb31bab867d4068036eff3047cc6303e92dcf6';

/// See also [maCross].
@ProviderFor(maCross)
final maCrossProvider = AutoDisposeFutureProvider<MACrossResponse>.internal(
  maCross,
  name: r'maCrossProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$maCrossHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MaCrossRef = AutoDisposeFutureProviderRef<MACrossResponse>;
String _$fearGreedHash() => r'a4ba0e7bcd3df2154ca6d684a5b1ccd4d562df9c';

/// See also [fearGreed].
@ProviderFor(fearGreed)
final fearGreedProvider = AutoDisposeFutureProvider<FearGreedResponse>.internal(
  fearGreed,
  name: r'fearGreedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fearGreedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FearGreedRef = AutoDisposeFutureProviderRef<FearGreedResponse>;
String _$indicatorViewModelHash() =>
    r'ea4cb7db65c8659ee8ea7ba00d62c051fe1aceec';

/// See also [IndicatorViewModel].
@ProviderFor(IndicatorViewModel)
final indicatorViewModelProvider = AsyncNotifierProvider<
    IndicatorViewModel,
    (
      RsiResponse,
      DominanceResponse,
      MvrvResponse,
      FearGreedResponse?
    )>.internal(
  IndicatorViewModel.new,
  name: r'indicatorViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$indicatorViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IndicatorViewModel = AsyncNotifier<
    (RsiResponse, DominanceResponse, MvrvResponse, FearGreedResponse?)>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
