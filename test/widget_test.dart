import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:latihan1_pertemuan2_alfian/main.dart';
import 'package:latihan1_pertemuan2_alfian/statefull.dart';

void main() {
  testWidgets('Menampilkan 3 KartuMahasiswa', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Memastikan 3 Kartu Mahasiswa tampil
    expect(find.byType(KartuMahasiswa), findsNWidgets(3));
    expect(find.text('Alfian Fatoni'), findsOneWidget);
    expect(find.text('Alex Gunawan'), findsOneWidget);
    expect(find.text('Pras Goldinantara'), findsOneWidget);
  });

  testWidgets('Counter increment, decrement, dan reset test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Navigasi ke tab Counter
    await tester.tap(find.byIcon(Icons.calculate_outlined));
    await tester.pumpAndSettle();

    // Verifikasi nilai awal counter adalah 0
    expect(find.text('0'), findsOneWidget);

    // Tekan tombol Tambah
    await tester.tap(find.text('Tambah'));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    // Tekan tombol Kurang
    await tester.tap(find.text('Kurang'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);

    // Tekan Kurang lagi menjadi -1
    await tester.tap(find.text('Kurang'));
    await tester.pump();
    expect(find.text('-1'), findsOneWidget);

    // Tekan tombol Reset
    await tester.tap(find.text('Reset'));
    await tester.pump();
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('StatefullPage dari statefull.dart dapat berjalan secara mandiri', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: StatefullPage()));

    expect(find.text('Stateful Widget (statefull.dart)'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.text('Tambah'));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
