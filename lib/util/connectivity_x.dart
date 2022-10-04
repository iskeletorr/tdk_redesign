import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkAwareState {
  BuildContext context;
  NetworkAwareState(this.context);
  StreamSubscription<ConnectivityResult>? _networkSubscription;
  final Connectivity _connectivity = Connectivity();
  bool _isDisconnected = false;
  void initStateSubs() {
    initConnectivity();
    _networkSubscription = _connectivity.onConnectivityChanged.listen((result) {
      _updateConnectionStatus(result);
    });
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on Exception catch (e) {
      print(e);
    }
    return _updateConnectionStatus(result!);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    String text2 = 'Disconnected';
    if (result != ConnectivityResult.none) {
      String text = result == ConnectivityResult.wifi ? 'Connected via WiFi' : 'Connected via Mobile';
      if (_isDisconnected) {
        onReconnected(text);
        _isDisconnected = false;
      }
    } else {
      _isDisconnected = true;
      onReconnected(text2);
    }
  }

  void onReconnected(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }

  // void onDisconnected() {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text(
  //         'Disconnected',
  //         style: TextStyle(fontSize: 30),
  //       ),
  //     ),
  //   );
  // }

  void disposeSubs() {
    cancelSubscription();
  }

  void cancelSubscription() {
    try {
      _networkSubscription?.cancel();
    } catch (e) {
      print(e);
    }
  }
}
