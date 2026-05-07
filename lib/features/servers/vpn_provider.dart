// lib/features/vpn/providers/vpn_provider.dart
import 'package:flutter_riverpod/legacy.dart';
import 'package:vpn_app/features/servers/server_model.dart';

class VPNState {
  final bool isConnected;
  final ServerModel? currentServer;
  final String currentIP;
  final double dataUsed;
  final int connectionTime;

  VPNState({
    required this.isConnected,
    this.currentServer,
    required this.currentIP,
    required this.dataUsed,
    required this.connectionTime,
  });

  VPNState copyWith({
    bool? isConnected,
    ServerModel? currentServer,
    String? currentIP,
    double? dataUsed,
    int? connectionTime,
  }) {
    return VPNState(
      isConnected: isConnected ?? this.isConnected,
      currentServer: currentServer ?? this.currentServer,
      currentIP: currentIP ?? this.currentIP,
      dataUsed: dataUsed ?? this.dataUsed,
      connectionTime: connectionTime ?? this.connectionTime,
    );
  }
}

final vpnProvider = StateNotifierProvider<VPNNotifier, VPNState>((ref) {
  return VPNNotifier();
});

class VPNNotifier extends StateNotifier<VPNState> {
  VPNNotifier()
    : super(
        VPNState(
          isConnected: false,
          currentIP: '192.168.1.1',
          dataUsed: 0,
          connectionTime: 0,
        ),
      );

  void toggleConnection() {
    if (state.isConnected) {
      disconnect();
    } else {
      connect();
    }
  }

  void connect() {
    // Simulate VPN connection
    state = state.copyWith(
      isConnected: true,
      currentIP: '203.45.67.89',
      connectionTime: DateTime.now().millisecondsSinceEpoch,
    );
  }

  void disconnect() {
    state = state.copyWith(
      isConnected: false,
      currentIP: '192.168.1.1',
      dataUsed: state.dataUsed + 0.5,
      connectionTime: 0,
    );
  }

  void updateServer(ServerModel server) {
    state = state.copyWith(currentServer: server);
  }
}
