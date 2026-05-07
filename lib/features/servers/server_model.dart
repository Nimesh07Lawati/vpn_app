// lib/features/server/models/server_model.dart
class ServerModel {
  final String id;
  final String serverName;
  final String country;
  final String city;
  final String flag;
  final String region;
  final int load;
  final int ping;
  final bool isPremium;
  final double latency;

  ServerModel({
    required this.id,
    required this.serverName,
    required this.country,
    required this.city,
    required this.flag,
    required this.region,
    required this.load,
    required this.ping,
    required this.isPremium,
    required this.latency,
  });

  String? get location => null;

  static List<ServerModel> getServers() {
    return [
      ServerModel(
        id: '1',
        serverName: 'US - New York',
        country: 'United States',
        city: 'New York',
        flag: '🇺🇸',
        region: 'North America',
        load: 45,
        ping: 32,
        isPremium: false,
        latency: 32.5,
      ),
      ServerModel(
        id: '2',
        serverName: 'US - Los Angeles',
        country: 'United States',
        city: 'Los Angeles',
        flag: '🇺🇸',
        region: 'North America',
        load: 62,
        ping: 48,
        isPremium: false,
        latency: 48.2,
      ),
      ServerModel(
        id: '3',
        serverName: 'UK - London',
        country: 'United Kingdom',
        city: 'London',
        flag: '🇬🇧',
        region: 'Europe',
        load: 38,
        ping: 25,
        isPremium: false,
        latency: 25.8,
      ),
      ServerModel(
        id: '4',
        serverName: 'Germany - Frankfurt',
        country: 'Germany',
        city: 'Frankfurt',
        flag: '🇩🇪',
        region: 'Europe',
        load: 28,
        ping: 22,
        isPremium: false,
        latency: 22.3,
      ),
      ServerModel(
        id: '5',
        serverName: 'Japan - Tokyo',
        country: 'Japan',
        city: 'Tokyo',
        flag: '🇯🇵',
        region: 'Asia',
        load: 71,
        ping: 95,
        isPremium: false,
        latency: 95.6,
      ),
      ServerModel(
        id: '6',
        serverName: 'Singapore',
        country: 'Singapore',
        city: 'Singapore',
        flag: '🇸🇬',
        region: 'Asia',
        load: 53,
        ping: 78,
        isPremium: true,
        latency: 78.4,
      ),
      ServerModel(
        id: '7',
        serverName: 'Australia - Sydney',
        country: 'Australia',
        city: 'Sydney',
        flag: '🇦🇺',
        region: 'Oceania',
        load: 34,
        ping: 142,
        isPremium: true,
        latency: 142.7,
      ),
      ServerModel(
        id: '8',
        serverName: 'Canada - Toronto',
        country: 'Canada',
        city: 'Toronto',
        flag: '🇨🇦',
        region: 'North America',
        load: 41,
        ping: 29,
        isPremium: false,
        latency: 29.1,
      ),
      ServerModel(
        id: '9',
        serverName: 'France - Paris',
        country: 'France',
        city: 'Paris',
        flag: '🇫🇷',
        region: 'Europe',
        load: 47,
        ping: 31,
        isPremium: false,
        latency: 31.4,
      ),
      ServerModel(
        id: '10',
        serverName: 'India - Mumbai',
        country: 'India',
        city: 'Mumbai',
        flag: '🇮🇳',
        region: 'Asia',
        load: 68,
        ping: 112,
        isPremium: true,
        latency: 112.9,
      ),
    ];
  }
}
