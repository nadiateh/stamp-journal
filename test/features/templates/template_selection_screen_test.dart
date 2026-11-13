import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_journal/features/templates/screens/template_selection_screen.dart';

void main() {
  group('TemplateSelectionScreen', () {
    testWidgets('displays the template gallery', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TemplateSelectionScreen()),
      );

      expect(find.text('Choose a template'), findsOneWidget);
      expect(
        find.text('Find the perfect shape for your memory.'),
        findsOneWidget,
      );

      // Square is the first template and is initially visible.
      expect(find.text('Square'), findsOneWidget);
    });

    testWidgets('filters templates by category', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TemplateSelectionScreen()),
      );

      await tester.tap(find.text('Postage'));
      await tester.pumpAndSettle();

      expect(find.text('Classic Postage'), findsOneWidget);
      expect(find.text('Scalloped'), findsOneWidget);
      expect(find.text('Square'), findsNothing);
    });

    testWidgets('updates the confirmation button when a template is selected', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(home: TemplateSelectionScreen()),
      );

      // Select Square, which is initially visible.
      await tester.tap(find.text('Square'));
      await tester.pumpAndSettle();

      expect(find.text('Use Square'), findsOneWidget);
    });
  });
}
