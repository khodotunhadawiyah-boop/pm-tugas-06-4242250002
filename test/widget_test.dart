import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pm_tugas_06/main.dart';

void main() {
  testWidgets('Membuka detail destinasi dari daftar', (tester) async {
    await tester.pumpWidget(const WisataApp());

    expect(find.text('Danau Toba'), findsOneWidget);

    await tester.tap(find.text('Danau Toba'));
    await tester.pumpAndSettle();

    expect(find.byType(BackButton), findsOneWidget);
  });
}