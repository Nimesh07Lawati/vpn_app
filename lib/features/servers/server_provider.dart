// lib/features/server/providers/server_provider.dart
import 'package:flutter_riverpod/legacy.dart';
import 'package:vpn_app/features/servers/server_model.dart';

final serverProvider = StateNotifierProvider<ServerNotifier, List<ServerModel>>(
  (ref) {
    return ServerNotifier();
  },
);

class ServerNotifier extends StateNotifier<List<ServerModel>> {
  ServerNotifier() : super(ServerModel.getServers());

  void selectServer(ServerModel server) {
    // Logic to select and connect to server
    // This will be handled by the VPN provider
  }

  void updateServerLoad(String serverId, int newLoad) {
    state = state.map((server) {
      if (server.id == serverId) {
        return ServerModel(
          id: server.id,
          serverName: server.serverName,
          country: server.country,
          city: server.city,
          flag: server.flag,
          region: server.region,
          load: newLoad,
          ping: server.ping,
          isPremium: server.isPremium,
          latency: server.latency,
        );
      }
      return server;
    }).toList();
  }
}
