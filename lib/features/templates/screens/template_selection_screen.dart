import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../data/stamp_templates.dart';
import '../models/stamp_template.dart';
import '../painters/stamp_template_painter.dart';

class TemplateSelectionScreen extends StatefulWidget {
  final StampTemplate? initialTemplate;
  final ValueChanged<StampTemplate>? onTemplateSelected;

  const TemplateSelectionScreen({
    super.key,
    this.initialTemplate,
    this.onTemplateSelected,
  });

  @override
  State<TemplateSelectionScreen> createState() =>
      _TemplateSelectionScreenState();
}

class _TemplateSelectionScreenState extends State<TemplateSelectionScreen> {
  StampCategory? _selectedCategory;
  late StampTemplate _selectedTemplate;

  @override
  void initState() {
    super.initState();

    _selectedTemplate = widget.initialTemplate ?? StampTemplates.all.first;
  }

  List<StampTemplate> get _filteredTemplates {
    if (_selectedCategory == null) {
      return StampTemplates.all;
    }

    return StampTemplates.all
        .where((template) => template.category == _selectedCategory)
        .toList();
  }

  String _categoryName(StampCategory? category) {
    if (category == null) return 'All';

    switch (category) {
      case StampCategory.geometric:
        return 'Geometric';
      case StampCategory.postage:
        return 'Postage';
      case StampCategory.decorative:
        return 'Decorative';
      case StampCategory.creative:
        return 'Creative';
      case StampCategory.seasonal:
        return 'Seasonal';
    }
  }

  void _selectTemplate(StampTemplate template) {
    setState(() {
      _selectedTemplate = template;
    });
  }

  void _confirmSelection() {
    widget.onTemplateSelected?.call(_selectedTemplate);
    Navigator.of(context).pop(_selectedTemplate);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        title: const Text('Choose a template'),
        centerTitle: false,
        backgroundColor: colors.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
            child: Text(
              'Find the perfect shape for your memory.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
          ),

          _buildCategoryFilters(),

          const SizedBox(height: 16),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              itemCount: _filteredTemplates.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.92,
              ),
              itemBuilder: (context, index) {
                final template = _filteredTemplates[index];

                return _TemplateCard(
                  template: template,
                  selected: template.id == _selectedTemplate.id,
                  onTap: () => _selectTemplate(template),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 16),
          child: SizedBox(
            height: 54,
            child: FilledButton(
              onPressed: _confirmSelection,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.coral,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Use ${_selectedTemplate.name}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    final categories = <StampCategory?>[null, ...StampCategory.values];

    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final selected = category == _selectedCategory;

          return ChoiceChip(
            label: Text(_categoryName(category)),
            selected: selected,
            onSelected: (_) {
              setState(() {
                _selectedCategory = category;
              });
            },
            selectedColor: AppColors.coral,
            backgroundColor: Theme.of(context).colorScheme.surface,
            side: BorderSide(
              color: selected ? AppColors.coral : AppColors.border,
            ),
            labelStyle: TextStyle(
              color: selected
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
            showCheckmark: false,
          );
        },
      ),
    );
  }
}

class _TemplateCard extends StatelessWidget {
  final StampTemplate template;
  final bool selected;
  final VoidCallback onTap;

  const _TemplateCard({
    required this.template,
    required this.selected,
    required this.onTap,
  });

  Size _previewSize() {
    const maxWidth = 125.0;
    const maxHeight = 100.0;

    final ratio = template.aspectRatio;

    if (ratio >= 1) {
      return Size(maxWidth, maxWidth / ratio);
    }

    return Size(maxHeight * ratio, maxHeight);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final previewSize = _previewSize();

    return Material(
      color: colors.surface,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: selected ? AppColors.coral : AppColors.border,
              width: selected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: previewSize.width,
                    height: previewSize.height,
                    child: CustomPaint(
                      painter: StampTemplatePainter(
                        template: template,
                        fillColor: _previewColor(),
                        borderColor: _borderColor(),
                        cutoutColor: colors.surface,
                        borderWidth: 2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                template.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.onSurface,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                template.category.name.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant,
                  letterSpacing: 0.8,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _previewColor() {
    switch (template.category) {
      case StampCategory.geometric:
        return AppColors.mango;
      case StampCategory.postage:
        return AppColors.coral;
      case StampCategory.decorative:
        return AppColors.lilac;
      case StampCategory.creative:
        return AppColors.teal;
      case StampCategory.seasonal:
        return AppColors.softPink;
    }
  }

  Color _borderColor() {
    switch (template.category) {
      case StampCategory.geometric:
        return const Color(0xFFE39B32);
      case StampCategory.postage:
        return const Color(0xFFD95346);
      case StampCategory.decorative:
        return const Color(0xFF8066C7);
      case StampCategory.creative:
        return const Color(0xFF327D71);
      case StampCategory.seasonal:
        return const Color(0xFFE59AAE);
    }
  }
}
