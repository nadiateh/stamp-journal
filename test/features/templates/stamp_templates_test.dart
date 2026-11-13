import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_journal/features/templates/data/stamp_templates.dart';
import 'package:stamp_journal/features/templates/models/stamp_template.dart';

void main() {
  group('StampTemplates', () {
    test('contains all five categories', () {
      final categories = StampTemplates.all
          .map((template) => template.category)
          .toSet();

      expect(categories, containsAll(StampCategory.values));
    });

    test('every template has a unique ID', () {
      final ids = StampTemplates.all.map((template) => template.id);

      expect(ids.toSet().length, ids.length);
    });

    test('every template has a valid aspect ratio', () {
      for (final template in StampTemplates.all) {
        expect(template.aspectRatio, greaterThan(0));
      }
    });

    test('contains 18 built-in templates', () {
      expect(StampTemplates.all.length, 18);
    });
  });
}
