import 'package:material_ui/material_ui.dart';

/// Model satu destinasi wisata.
class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.kategori,
    required this.deskripsi,
    required this.tiket,
    required this.ikon,
    required this.warna,
  });

  final int id;
  final String nama;
  final String lokasi; // kabupaten/kota
  final String kategori;
  final String deskripsi;
  final int tiket; // 0 = gratis
  final IconData ikon;
  final Color warna;

  String get teksTiket => tiket == 0 ? 'Gratis' : tiket.rupiah;
}

// Harga tiket adalah data contoh, sesuaikan bila perlu.
const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1,
    nama: 'Danau Toba',
    lokasi: 'Kab. Samosir',
    kategori: 'Alam',
    deskripsi:
        'Danau vulkanik terbesar di Asia Tenggara dengan Pulau Samosir di tengahnya.',
    tiket: 0,
    ikon: Icons.landscape,
    warna: Color(0xFF1565C0),
  ),
  Destinasi(
    id: 2,
    nama: 'Bukit Lawang',
    lokasi: 'Kab. Langkat',
    kategori: 'Alam',
    deskripsi:
        'Gerbang Taman Nasional Gunung Leuser, terkenal dengan wisata orangutan.',
    tiket: 50000,
    ikon: Icons.forest,
    warna: Color(0xFF2E7D32),
  ),
  Destinasi(
    id: 3,
    nama: 'Berastagi',
    lokasi: 'Kab. Karo',
    kategori: 'Pegunungan',
    deskripsi:
        'Kota sejuk di kaki Gunung Sibayak dan Sinabung, terkenal dengan buah markisa.',
    tiket: 15000,
    ikon: Icons.terrain,
    warna: Color(0xFFEF6C00),
  ),
  Destinasi(
    id: 4,
    nama: 'Istana Maimun',
    lokasi: 'Kota Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Istana Kesultanan Deli bergaya Melayu, Eropa, dan India yang dibangun tahun 1888.',
    tiket: 10000,
    ikon: Icons.account_balance,
    warna: Color(0xFFF9A825),
  ),
  Destinasi(
    id: 5,
    nama: 'Air Terjun Sipiso-piso',
    lokasi: 'Kab. Karo',
    kategori: 'Alam',
    deskripsi:
        'Air terjun tinggi yang jatuh ke arah Danau Toba, terlihat dari titik pandang di atasnya.',
    tiket: 10000,
    ikon: Icons.water,
    warna: Color(0xFF00838F),
  ),
  Destinasi(
    id: 6,
    nama: 'Masjid Raya Al-Mashun',
    lokasi: 'Kota Medan',
    kategori: 'Religi',
    deskripsi:
        'Masjid bersejarah peninggalan Kesultanan Deli dengan arsitektur khas dan kubah besar.',
    tiket: 0,
    ikon: Icons.mosque,
    warna: Color(0xFF6A1B9A),
  ),
];

/// Mengembalikan null bila ID tidak dikenal.
Destinasi? cariDestinasi(int id) {
  for (final d in daftarDestinasi) {
    if (d.id == id) return d;
  }
  return null;
}

extension Rupiah on int {
  String get rupiah {
    final pola = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp${toString().replaceAllMapped(pola, (m) => '.')}';
  }
}