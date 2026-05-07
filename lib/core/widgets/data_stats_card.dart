// lib/features/vpn/widgets/data_stats_card.dart
import 'package:flutter/material.dart';
import 'package:vpn_app/core/styles/app_text_styles.dart';

class DataStatsCard extends StatelessWidget {
  final double dataUsed;
  final int connectionTime;

  const DataStatsCard({
    super.key,
    required this.dataUsed,
    required this.connectionTime,
  });

  String _formatConnectionTime(int milliseconds) {
    if (milliseconds == 0) return '00:00:00';
    final seconds =
        (DateTime.now().millisecondsSinceEpoch - milliseconds) ~/ 1000;
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final secs = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: 0.15),
            Colors.white.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStat(
            icon: Icons.cloud_download,
            value: '${dataUsed.toStringAsFixed(1)} GB',
            label: 'Data Used',
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.white.withValues(alpha: 0.2),
          ),
          _buildStat(
            icon: Icons.timer,
            value: _formatConnectionTime(connectionTime),
            label: 'Session Time',
          ),
        ],
      ),
    );
  }

  Widget _buildStat({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Icon(icon, color: Colors.white70, size: 24),
        const SizedBox(height: 8),
        Text(
          value,
          style: AppTextStyles.bodyLarge.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.small.copyWith(color: Colors.white70)),
      ],
    );
  }
}
