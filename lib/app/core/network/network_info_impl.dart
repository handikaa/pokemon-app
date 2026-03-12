import 'dart:async';

import 'network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl({
    required Future<bool> Function() internetChecker,
    required Stream<bool> connectivityStream,
  }) : _internetChecker = internetChecker,
       _connectivityStream = connectivityStream;

  final Future<bool> Function() _internetChecker;
  final Stream<bool> _connectivityStream;

  @override
  Future<bool> get isConnected async {
    try {
      return await _internetChecker();
    } catch (_) {
      return false;
    }
  }

  @override
  Stream<bool> get onConnectivityChanged async* {
    await for (final isConnected in _connectivityStream) {
      yield isConnected;
    }
  }
}
