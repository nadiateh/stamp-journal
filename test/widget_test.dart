import 'package:flutter_test/flutter_test.dart';
import 'package:stamp_journal/app/stamp_journal_app.dart';

void main() {
  testWidgets('Stamp Journal app loads', (tester) async {
    await tester.pumpWidget(const StampJournalApp());

    expect(find.text('STAMP JOURNAL'), findsOneWidget);
    expect(find.text('A collection of'), findsOneWidget);
    expect(find.text('little moments.'), findsOneWidget);
    expect(find.text('Make a new stamp'), findsOneWidget);
    expect(find.text('Your story starts here'), findsOneWidget);
  });
}
