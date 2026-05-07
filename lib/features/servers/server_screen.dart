// lib/features/server/presentation/server_selection_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vpn_app/core/styles/app_text_styles.dart';
import 'package:vpn_app/core/theme/app_theme.dart';
import 'package:vpn_app/features/servers/server_card.dart';
import 'package:vpn_app/features/servers/server_model.dart';
import 'package:vpn_app/features/servers/server_provider.dart';

class ServerSelectionScreen extends ConsumerStatefulWidget {
  const ServerSelectionScreen({super.key});

  @override
  ConsumerState<ServerSelectionScreen> createState() =>
      _ServerSelectionScreenState();
}

class _ServerSelectionScreenState extends ConsumerState<ServerSelectionScreen> {
  String _searchQuery = '';
  String _selectedRegion = 'All';

  final List<String> _regions = [
    'All',
    'North America',
    'Europe',
    'Asia',
    'Oceania',
  ];

  @override
  Widget build(BuildContext context) {
    final servers = ref.watch(serverProvider);
    final filteredServers = _filterServers(servers);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(color: const Color.fromRGBO(38, 119, 119, 1)),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              _buildAppBar(),

              // Search and Filter
              _buildSearchAndFilter(),

              const SizedBox(height: 16),

              // Server List
              Expanded(
                child: filteredServers.isEmpty
                    ? _buildEmptyState()
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: filteredServers.length,
                        itemBuilder: (context, index) {
                          return ServerCard(
                            server: filteredServers[index],
                            onConnect: () {
                              ref
                                  .read(serverProvider.notifier)
                                  .selectServer(filteredServers[index]);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            ),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Select Server',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Search Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
            ),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search servers...',
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.white70),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Region Filter
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _regions.length,
              separatorBuilder: (context, index) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final region = _regions[index];
                final isSelected = _selectedRegion == region;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedRegion = region;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.white
                          : Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? Colors.transparent
                            : Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(
                      region,
                      style: TextStyle(
                        color: isSelected ? AppTheme.deepPurple : Colors.white,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off,
            size: 80,
            color: Colors.white.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No servers found',
            style: AppTextStyles.headingSmall.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search',
            style: AppTextStyles.bodyMedium.copyWith(
              color: Colors.white.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  List<ServerModel> _filterServers(List<ServerModel> servers) {
    return servers.where((server) {
      final matchesSearch =
          _searchQuery.isEmpty ||
          server.country.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          server.city.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          server.serverName.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchesRegion =
          _selectedRegion == 'All' || server.region == _selectedRegion;

      return matchesSearch && matchesRegion;
    }).toList();
  }
}
