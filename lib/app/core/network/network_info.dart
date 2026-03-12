abstract class NetworkInfo {
  /// Returns true when the device has internet access.
  Future<bool> get isConnected;

  /// Emits connection status changes.
  Stream<bool> get onConnectivityChanged;
}
