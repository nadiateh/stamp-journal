import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onCapture;

  const HomeScreen({super.key, required this.onCapture});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HomeHeader(
              primary: colors.primary,
              text: colors.onSurface,
              secondaryText: textTheme.bodyMedium?.color,
            ),
            const SizedBox(height: 38),

            Text(
              'A collection of',
              style: textTheme.titleMedium?.copyWith(
                color: textTheme.bodyMedium?.color,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'little moments.',
              style: textTheme.displaySmall?.copyWith(
                fontSize: 39,
                height: 1.08,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Save the places, people, and details you never want to forget.',
              style: textTheme.bodyMedium?.copyWith(fontSize: 14, height: 1.6),
            ),

            const SizedBox(height: 28),

            _CaptureCard(onTap: onCapture),

            const SizedBox(height: 34),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your collection', style: textTheme.titleLarge),
                TextButton(
                  onPressed: () {
                    // Collection navigation will be connected here.
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: colors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                  child: const Text('View all'),
                ),
              ],
            ),
            const SizedBox(height: 12),

            const _EmptyCollection(),

            const SizedBox(height: 28),

            _JournalNote(
              primary: colors.primary,
              surface: colors.surface,
              text: colors.onSurface,
              secondaryText: textTheme.bodyMedium?.color,
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  final Color primary;
  final Color text;
  final Color? secondaryText;

  const _HomeHeader({
    required this.primary,
    required this.text,
    required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final dateLabel = '${_monthName(date.month)} ${date.day}, ${date.year}';

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'STAMP JOURNAL',
                style: TextStyle(
                  color: primary,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2.2,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                dateLabel,
                style: TextStyle(
                  color: secondaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: primary.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(Icons.auto_awesome_rounded, color: primary, size: 21),
        ),
      ],
    );
  }

  String _monthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return months[month - 1];
  }
}

class _CaptureCard extends StatelessWidget {
  final VoidCallback onTap;

  const _CaptureCard({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.primary,
      borderRadius: BorderRadius.circular(26),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Positioned(
              right: -22,
              top: -32,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colors.onPrimary.withValues(alpha: 0.10),
                    width: 25,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: colors.onPrimary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: colors.onPrimary,
                          size: 21,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_outward_rounded,
                        color: colors.onPrimary.withValues(alpha: 0.85),
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 27),
                  Text(
                    'Make a new stamp',
                    style: TextStyle(
                      color: colors.onPrimary,
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Turn an ordinary moment into something worth keeping.',
                    style: TextStyle(
                      color: colors.onPrimary.withValues(alpha: 0.82),
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'START CAPTURING',
                        style: TextStyle(
                          color: colors.onPrimary,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.3,
                        ),
                      ),
                      const SizedBox(width: 9),
                      Icon(
                        Icons.arrow_forward_rounded,
                        color: colors.onPrimary,
                        size: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyCollection extends StatelessWidget {
  const _EmptyCollection();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 27),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: colors.onSurface.withValues(alpha: 0.07)),
      ),
      child: Column(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: colors.primary.withValues(alpha: 0.09),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(
              Icons.photo_library_outlined,
              color: colors.primary,
              size: 25,
            ),
          ),
          const SizedBox(height: 15),
          Text('Your story starts here', style: textTheme.titleMedium),
          const SizedBox(height: 6),
          Text(
            'The stamps you create will find a home here.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

class _JournalNote extends StatelessWidget {
  final Color primary;
  final Color surface;
  final Color text;
  final Color? secondaryText;

  const _JournalNote({
    required this.primary,
    required this.surface,
    required this.text,
    required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: text.withValues(alpha: 0.06)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.format_quote_rounded, color: primary, size: 27),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'A LITTLE REMINDER',
                  style: TextStyle(
                    color: primary,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.3,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  'Not every moment needs to be extraordinary to be worth keeping.',
                  style: TextStyle(
                    color: text,
                    fontSize: 14,
                    height: 1.6,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
