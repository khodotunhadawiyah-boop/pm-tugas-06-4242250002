# Tugas Rutin 6: Aplikasi Wisata Sumatera Utara (Responsif & Multi-Screen)

Mata kuliah Pemrograman Mobile, Pertemuan 6.

Aplikasi panduan wisata Sumatera Utara dengan 6 destinasi (Danau Toba, Bukit Lawang, Berastagi, Istana Maimun, Air Terjun Sipiso-piso, dan Masjid Raya Al-Mashun). Tata letaknya menyesuaikan ukuran layar, dan navigasinya memakai `go_router`.

## a. Identitas
- Nama: Khodotun Hadawiyah. M
- NIM: 4242250002
- Kelas: PSIK 24D

## b. Tangkapan layar

### Ponsel (Infinix SMART 9, Android 14)
Grid 2 kolom, navigasi di bawah layar (NavigationBar), dan detail tersusun vertikal.

| Halaman daftar | Halaman detail |
|---|---|
| ![ponsel daftar](screenshots/ponsel-daftar.jpeg) | ![ponsel detail](screenshots/ponsel-detail.jpeg) |

### Tablet / layar lebar (Chrome)
Diambil dari Chrome dengan lebar jendela penuh, sehingga NavigationRail muncul di samping, grid memakai 4 kolom, dan detail tersusun berdampingan.

| Halaman daftar | Halaman detail |
|---|---|
| ![tablet daftar](screenshots/tablet-daftar.png) | ![tablet detail](screenshots/tablet-detail.png) |

## c. Keputusan responsif

Saya memakai beberapa batas lebar yang mengikuti window size class Material 3. Pada halaman daftar, jumlah kolom grid ditentukan LayoutBuilder: kurang dari 600 dp memakai 2 kolom, 600 sampai 899 dp memakai 3 kolom, dan 900 dp ke atas memakai 4 kolom. Saya memilih LayoutBuilder di sini karena keputusan ini bergantung pada lebar ruang yang benar-benar diberikan parent kepada grid, bukan lebar seluruh layar, sehingga tetap benar walaupun grid berada di samping NavigationRail. Pada halaman detail, LayoutBuilder juga dipakai dengan batas 700 dp: di bawahnya gambar dan informasi tersusun vertikal dengan ListView, sedangkan di atasnya keduanya berdampingan dalam Row dengan Expanded. Label kategori diletakkan di atas gambar memakai Stack dan Positioned. Untuk kerangka navigasi saya memakai MediaQuery.sizeOf karena keputusannya berlaku untuk seluruh aplikasi: lebar 840 dp ke atas menampilkan NavigationRail di samping, dan di bawahnya menampilkan NavigationBar di bawah layar. Teks panjang ditangani dengan Expanded dan ellipsis agar tidak overflow pada lebar 360 sampai 1280 dp.

## d. Pernyataan penggunaan AI

Saya menggunakan Claude (Anthropic) sebagai asisten untuk memandu langkah pengerjaan, membantu menyusun kode aplikasi dan widget test, serta merapikan draf penjelasan pada bagian c. Seluruh langkah dijalankan sendiri di laptop dan perangkat saya.