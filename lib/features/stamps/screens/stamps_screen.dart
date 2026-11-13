import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class StampsScreen extends StatelessWidget {
  const StampsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Stamps', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Every little moment, in one place.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.grid_view_outlined,
                    size: 48,
                    color: AppColors.mutedBrown,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'No stamps yet',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.brown,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Your captured stamps will appear here.',
                    style: TextStyle(color: AppColors.secondaryText),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
