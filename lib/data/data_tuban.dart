class Wisata {
  final String nama;
  final String kategori;
  final String deskripsi;
  final String gambar;
  final String lokasi;
  final String jamBuka;
  final String hargaTiket;
  final double rating;
  final int ulasan;
  final String jarak;
  bool isFavorite;

  Wisata({
    required this.nama,
    required this.kategori,
    required this.deskripsi,
    required this.gambar,
    required this.lokasi,
    required this.jamBuka,
    required this.hargaTiket,
    this.rating = 4.7,
    this.ulasan = 120,
    this.jarak = '1,2 km',
    this.isFavorite = false,
  });
}

List<Wisata> listDataTuban = [
  Wisata(
    nama: 'Lontong Tahu Tuban',
    kategori: 'Makanan Tradisional',
    deskripsi:
        'Lontong tahu khas Tuban dengan kuah kacang gurih, tahu hangat, tauge, dan kerupuk.',
    gambar: 'assets/lontong_tahu.jpg',
    lokasi: 'Warung Lontong Tahu Khas Tuban, Jl. Sunan Bonang',
    jamBuka: '06.00 - 15.00 WIB',
    hargaTiket: 'Rp 10.000 - 15.000',
    rating: 4.7,
    ulasan: 120,
    jarak: '1,2 km',
  ),
  Wisata(
    nama: 'Sate Kerang',
    kategori: 'Makanan Tradisional',
    deskripsi:
        'Sate khas pesisir pantai Tuban menggunakan kerang laut segar berbumbu pedas manis.',
    gambar: 'assets/sate_kerang.jpg',
    lokasi: 'Warung Sate Kerang Alun-Alun Tuban',
    jamBuka: '16.00 - 23.00 WIB',
    hargaTiket: 'Rp 15.000',
    rating: 4.5,
    ulasan: 98,
    jarak: '2,3 km',
  ),
  Wisata(
    nama: 'Kare Rajungan',
    kategori: 'Makanan Seafood Pedas',
    deskripsi:
        'Olahan rajungan laut segar dengan kuah kare super pedas dan kaya akan rempah khas pesisir Tuban.',
    gambar: 'assets/kare_rajungan.jpg',
    lokasi: 'Warung Kare Rajungan Manunggal, Tuban',
    jamBuka: '10.00 - 21.00 WIB',
    hargaTiket: 'Rp 50.000 - 80.000',
    rating: 4.8,
    ulasan: 210,
    jarak: '3,5 km',
  ),
  Wisata(
    nama: 'Becek Menthok',
    kategori: 'Makanan Tradisional',
    deskripsi:
        'Olahan daging menthok bersantan pedas gurih dengan aroma rempah-rempah yang tajam dan menggugah selera.',
    gambar: 'assets/becek_mentok.jpg',
    lokasi: 'Warung Becek Menthok Khas Merakurak, Tuban',
    jamBuka: '09.00 - 16.00 WIB',
    hargaTiket: 'Rp 25.000 - 35.000',
    rating: 4.7,
    ulasan: 154,
    jarak: '4,2 km',
  ),
  Wisata(
    nama: 'Dumbek',
    kategori: 'Jajanan Tradisional',
    deskripsi:
        'Kue manis dari tepung beras, santan, dan gula merah yang dibungkus daun siwalan menyerupai terompet.',
    gambar: 'assets/dumbek.jpg',
    lokasi: 'Pusat Oleh-Oleh Khas Tuban, Jl. Semarang',
    jamBuka: '07.00 - 21.00 WIB',
    hargaTiket: 'Rp 2.000 - 15.000',
    rating: 4.6,
    ulasan: 88,
    jarak: '1,5 km',
  ),
  Wisata(
    nama: 'Legen Siwalan',
    kategori: 'Minuman Tradisional',
    deskripsi:
        'Minuman manis alami berkhasiat dari deresan pohon siwalan khas Tuban.',
    gambar: 'assets/legen.jpg',
    lokasi: 'Pusat Oleh-Oleh Legen Merakurak, Tuban',
    jamBuka: '07.00 - 17.00 WIB',
    hargaTiket: 'Rp 10.000',
    rating: 4.8,
    ulasan: 64,
    jarak: '3,1 km',
  ),
  Wisata(
    nama: 'Buah Siwalan',
    kategori: 'Camilan',
    deskripsi:
        'Buah segar kenyal mirip kolang-kaling hasil produksi utama pohon lontar/siwalan Tuban.',
    gambar: 'assets/siwalan.jpg',
    lokasi: 'Kios Buah Siwalan Merakurak, Tuban',
    jamBuka: '07.00 - 17.00 WIB',
    hargaTiket: 'Rp 15.000',
    rating: 4.6,
    ulasan: 76,
    jarak: '1,8 km',
  ),
];

class CeritaRakyat {
  final String judul;
  final String kategori;
  final String ringkasan;
  final String isi;
  final String gambar;
  final String pesanMoral;

  CeritaRakyat({
    required this.judul,
    required this.kategori,
    required this.ringkasan,
    required this.isi,
    required this.gambar,
    required this.pesanMoral,
  });
}

List<CeritaRakyat> listCeritaRakyat = [
  CeritaRakyat(
    judul: 'Pantai Panduri',
    kategori: 'Wisata Bahari',
    ringkasan: 'Keindahan pantai pesisir Tuban dengan pasir putih dan cemara udang.',
    isi:
        'Pantai Panduri merupakan destinasi wisata pesisir di Tuban yang menawarkan pemandangan tebing pantai, keindahan laut utara, serta deretan pohon cemara udang yang asri.',
    gambar: 'assets/pantai_panduri.jpg',
    pesanMoral: 'Menjaga kebersihan dan kelestarian pantai pesisir Tuban.',
  ),
  CeritaRakyat(
    judul: 'Wisata Pelang',
    kategori: 'Wisata Alam',
    ringkasan: 'Taman kebun sagu dan sungai alami berair jernih.',
    isi:
        'Wisata Pelang terkenal dengan kebun sagunya yang hijau serta sungai berair jernih yang dipenuhi ratusan ikan mas kaper. Pengunjung dapat menikmati terapi ikan dan keasrian suasana desa.',
    gambar: 'assets/wisata_pelang.jpg',
    pesanMoral: 'Melestarikan ekosistem perairan dan pepohonan lokal.',
  ),
  CeritaRakyat(
    judul: 'Sunan Bonang',
    kategori: 'Tokoh Wali Songo',
    ringkasan: 'Sang Wali yang membawa ajaran Islam di Tuban.',
    isi:
        'Kisah perjuangan dakwah Sunan Bonang menggunakan sarana kesenian gamelan Bonang dan karya sastra gubahan tembang dalam menyebarkan ajaran Islam secara santun di wilayah Tuban.',
    gambar: 'assets/sunan_bonang.jpg',
    pesanMoral: 'Menyebarkan kebaikan dengan cara yang santun, damai, dan bijaksana.',
  ),
  CeritaRakyat(
    judul: 'Wisata Nglirip',
    kategori: 'Wisata Alam & Legenda',
    ringkasan: 'Air terjun indah berair hijau toska di tengah rindangnya hutan.',
    isi:
        'Air Terjun Nglirip adalah destinasi wisata alam ikonik di Tuban yang terkenal dengan pancaran air berwarna hijau toska yang eksotis serta dikelilingi tebing batuan kapur.',
    gambar: 'assets/wisata_nglirip.jpg',
    pesanMoral: 'Menghormati keindahan alam serta senantiasa menjaga keselamatan diri saat berwisata.',
  ),
];