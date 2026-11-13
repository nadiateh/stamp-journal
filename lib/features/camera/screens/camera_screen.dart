import 'package:flutter/material.dart';

import '../../templates/models/stamp_template.dart';
import '../../templates/screens/template_selection_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  StampTemplate? _selectedTemplate;

  Future<void> _openTemplateSelection() async {
    final selected = await Navigator.of(context).push<StampTemplate>(
      MaterialPageRoute(
        builder: (_) =>
            TemplateSelectionScreen(initialTemplate: _selectedTemplate),
      ),
    );

    if (!mounted || selected == null) return;

    setState(() {
      _selectedTemplate = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: const Text('Create a stamp'),
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.camera_alt_outlined, size: 64, color: colors.primary),
              const SizedBox(height: 20),
              Text(
                'Your next memory starts here.',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Choose a stamp shape before taking your photo.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 28),
              OutlinedButton.icon(
                onPressed: _openTemplateSelection,
                icon: const Icon(Icons.crop_square_rounded),
                label: Text(_selectedTemplate?.name ?? 'Choose stamp shape'),
              ),
              if (_selectedTemplate != null) ...[
                const SizedBox(height: 12),
                Text(
                  'Selected: ${_selectedTemplate!.name}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
