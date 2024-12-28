/// Whether running in profile mode.
const bool zProfileMode = bool.fromEnvironment('dart.vm.profile');

/// Whether running in release mode.
const bool zReleaseMode = bool.fromEnvironment('dart.vm.product');

/// Whether running in debug mode.
const bool zDebugMode = !zProfileMode && !zReleaseMode;

/// Prints [o] in debug-mode only.
void safePrint(Object? o) {
  if (zDebugMode) {
    // ignore: avoid_print
    print(o);
  }
}
