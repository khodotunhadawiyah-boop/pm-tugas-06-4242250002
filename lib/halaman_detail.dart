import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key, required this.destinasi});

  final Destinasi? destinasi; // null bila ID di URL tidak dikenal

  @override
  Widget build(BuildContext context) {
    final d = destinasi;

    // Halaman "tidak ditemukan" untuk ID yang tidak dikenal.
    if (d == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Destinasi tidak ditemukan')),
        body: Center(
          child: FilledButton(
            onPressed: () => context.go('/'),
            child: const Text('Kembali ke daftar'),
          ),
        ),
      );
    }

    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    // Stack: label kategori ditumpuk di atas gambar.
    final gambar = AspectRatio(
      aspectRatio: 4 / 3,
      child: Stack(
        children: [
          Positioned.fill(
            child: ColoredBox(
              color: d.warna.withValues(alpha: 0.15),
              child: Center(child: Icon(d.ikon, size: 120, color: d.warna)),
            ),
          ),
          Positioned(
            left: 12,
            top: 12,
            child: Chip(label: Text(d.kategori)),
          ),
        ],
      ),
    );

    final info = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(d.nama, style: teks.headlineSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.place_outlined, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  d.lokasi,
                  style: teks.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.confirmation_number_outlined, size: 18),
              const SizedBox(width: 6),
              Text(
                'Tiket: ${d.teksTiket}',
                style: teks.titleMedium?.copyWith(color: skema.primary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(d.deskripsi, style: teks.bodyLarge),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(d.nama)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 700) {
            // Lebar: gambar dan info berdampingan.
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: gambar),
                Expanded(child: SingleChildScrollView(child: info)),
              ],
            );
          }
          // Sempit: gambar di atas, info di bawah.
          return ListView(children: [gambar, info]);
        },
      ),
    );
  }
}